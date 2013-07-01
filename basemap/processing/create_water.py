## ---------------------------------------------------------------------------
###   VERSION 0.1 (for postgis)
### create_water.py
### Created on: June 2, 20123
### Created by: Michael Byrne
### Federal Communications Commission 
##
## ---------------------------------------------------------------------------

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
oTbl = "water_poly"
census_s = "census2010"

def create_end_table():
  myConn = "dbname=" + db + " host=" + myHost + " port=" + myPort + " user=" + myUser
	conn = psycopg2.connect(myConn)
	myCur = conn.cursor()
	theSQL = "DROP TABLE IF EXISTS " + schema + "." + oTbl + "; "
	theSQL = theSQL + "CREATE TABLE " + schema + "." + oTbl + " as "
	theSQL = theSQL + "SELECT st_transform(geom,900913) as geom, geoid10, statefp10, nearshore, water from " + census_s + ".block_10 "
	theSQL = theSQL + "limit 1; "
	theSQL = theSQL + " TRUNCATE " + schema + "." + oTbl + "; ALTER TABLE " + schema + "."
	theSQL = theSQL + oTbl + " add column gid serial not null, "
	theSQL = theSQL + "add constraint " + schema + "_" + oTbl + "_pkey PRIMARY KEY (gid), "
	theSQL = theSQL + "add CONSTRAINT " + schema + "_" + oTbl + "_ndims CHECK (st_ndims(geom) = 2), "
	theSQL = theSQL + "add CONSTRAINT " + schema + "_" + oTbl + "_srid_geom CHECK (st_srid(geom) = 900913), "
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
	theSQL = theSQL + "st_transform(geom,900913) as geom, geoid10, statefp10, nearshore, water "
	theSQL = theSQL + "FROM " + census_s + ".block_" + myST + " where water = 1; " 
	theSQL = theSQL + "ALTER TABLE " + schema + ".working  "
	theSQL = theSQL + "add CONSTRAINT " + schema + "_working_srid_geom CHECK "
	theSQL = theSQL + "(st_srid(geom) = 900913); commit;"
#	print theSQL
	myCur.execute(theSQL)
	#insert as 900913
	theSQL = "INSERT INTO " + schema + "." + oTbl + " (geom, statefp10, nearshore, water) "
	theSQL = theSQL + "select ST_SimplifyPreserveTopology(geom, 10), "
	theSQL = theSQL + "statefp10, nearshore, water from "
	theSQL = theSQL + schema + ".working;  "
	theSQL = theSQL + "commit;"
#	print theSQL
	myCur.execute(theSQL)
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
	create_end_table()	
	for theST in States:
		print "going to operate on this state: " + theST
		insert_state_dissolved_polys(theST)
	now = time.localtime(time.time())
	print "local time:", time.asctime(now)
except:
	print "something bad bad happened"     
	
	
	
	
	
	
	



