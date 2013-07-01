## ---------------------------------------------------------------------------
###   VERSION 0.1 (for postgis)
### create_county.py
### Created on: June 2, 20123
### Created by: Michael Byrne
### Federal Communications Commission 
##
## ---------------------------------------------------------------------------
##this script creates the fixed polygons for the 706 report
##process is 6 categories


##dependencies
##software
##runs in python
##postgres/gis (open geo suite)
##the psycopg library
##data

# Import system modules
import sys, string, os
import psycopg2
import time
now = time.localtime(time.time())
print "local time:", time.asctime(now)

#variables
myHost = "localhost"
myPort = "54321"
myUser = "postgres"
db = "feomike"
schema = "carto"
oTbl = "county"
census_s = "census2010"
  

def create_end_table():
	myConn = "dbname=" + db + " host=" + myHost + " port=" + myPort + " user=" + myUser
	conn = psycopg2.connect(myConn)
	myCur = conn.cursor()
	theSQL = "DROP TABLE IF EXISTS " + schema + "." + oTbl + "; "
	theSQL = theSQL + "CREATE TABLE " + schema + "." + oTbl + " as "
	theSQL = theSQL + "SELECT geom, statefp10 as state_fips from " + census_s + ".block_10;"
	theSQL = theSQL + " TRUNCATE " + schema + "." + oTbl + "; ALTER TABLE " + schema + "."
	theSQL = theSQL + oTbl + " add column countyfp10 character varying(3), "
	theSQL = theSQL + "add column cnty_fips character varying(5), "
	theSQL = theSQL + "add column county_name character varying(50), "
	theSQL = theSQL + "add column gid serial not null, "
	theSQL = theSQL + "add constraint " + schema + "_" + oTbl + "_pkey PRIMARY KEY (gid), "
	theSQL = theSQL + "add CONSTRAINT " + schema + "_" + oTbl + "_ndims CHECK (st_ndims(geom) = 2), "
	theSQL = theSQL + "add CONSTRAINT " + schema + "_" + oTbl + "_srid_geom CHECK (st_srid(geom) = 4326), "
	theSQL = theSQL + "set with oids; commit;" 
#	print theSQL
	myCur.execute(theSQL)
	theSQL = "CREATE INDEX " + schema + "_" + oTbl + "_geom_gist ON " + schema + "." 
	theSQL = theSQL + oTbl + "  USING gist (geom); commit;"
	myCur.execute(theSQL)
	myCur.close()
	del myCur, conn, myConn
	return ()

def insert_state_dissolved_polys(myST):
	myConn = "dbname=" + db + " host=" + myHost + " port=" + myPort + " user=" + myUser
	conn = psycopg2.connect(myConn)
	myCur = conn.cursor()
	#set up working table
	theSQL = "DROP TABLE IF EXISTS " + schema + ".working; "
	theSQL = theSQL + "CREATE TABLE " + schema + ".working as SELECT gid, "
	theSQL = theSQL + "st_simplify(st_transform(geom,2163),10) as geom, statefp10, countyfp10, nearshore "
	theSQL = theSQL + "FROM " + census_s + ".block_" + myST + "; " 
	theSQL = theSQL + "ALTER TABLE " + schema + ".working add column cnty_fips character "
	theSQL = theSQL + "varying(5), add CONSTRAINT " + schema + "_working_srid_geom CHECK "
	theSQL = theSQL + "(st_srid(geom) = 2163); commit;"
#	print theSQL
	myCur.execute(theSQL)
	#update flag for water
	theSQL = "UPDATE " + schema + ".working set cnty_fips = statefp10 || countyfp10; commit;"
#	print theSQL
	myCur.execute(theSQL)
	#perform dissolve
	theSQL = "INSERT INTO " + schema + "." + oTbl + " select st_transform(st_union(geom), 4326), "
	theSQL = theSQL + "statefp10, countyfp10, cnty_fips from "
	theSQL = theSQL + schema + ".working  where nearshore = 0 "
	theSQL = theSQL + "group by statefp10, countyfp10, cnty_fips; "
	theSQL = theSQL + "commit;"
	print theSQL
	myCur.execute(theSQL)
	print "here"
	myCur.close()
	del myCur, conn, myConn
	return ()


try:
	#set up the connection to the database
	myConn = "dbname=" + db + " host=" + myHost + " port=" + myPort + " user=" + myUser
	conn = psycopg2.connect(myConn)
	theCur = conn.cursor()
	States = ["01","02","04","05","06","08","09"] 
	States = States + ["10","11","12","13","15","16","17","18","19"]
	States = States + ["20","21","22","23","24","25","26","27","28","29"]
	States = States + ["30","31","32","33","34","35","36","37","38","39"]
	States = States + ["40","41","42","44","45","46","47","48","49"]
	States = States + ["50","51","53","54","55","56"]	
	States = States + ["60","66","69","72","78"]
	States = ["10"]
	create_end_table()	
	for theST in States:
		print "going to operate on this state: " + theST
		insert_state_dissolved_polys(theST)
	now = time.localtime(time.time())
	print "local time:", time.asctime(now)
except:
	print "something bad bad happened"     
	
	
	
	
	
	
	



