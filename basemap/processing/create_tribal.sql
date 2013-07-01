--create_tribal.sql

drop table carto.tribal;

create table carto.tribal
(
  geom geometry,
  tribal_id character varying(4),
  tribal_name character varying(100),
  gid serial NOT NULL,
  CONSTRAINT carto_tribal_pkey PRIMARY KEY (gid),
  CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 2),
  CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 900913)
)
WITH (
  OIDS=TRUE
);

CREATE INDEX carto_tribal_geom_gist
  ON carto.tribal
  USING gist
  (geom);

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ak, carto.blockmaster2011
  where block_ak.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_al, carto.blockmaster2011
  where block_al.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_az, carto.blockmaster2011
  where block_az.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ar, carto.blockmaster2011
  where block_ar.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ca, carto.blockmaster2011
  where block_ca.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_co, carto.blockmaster2011
  where block_co.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ct, carto.blockmaster2011
  where block_ct.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_de, carto.blockmaster2011
  where block_de.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_dc, carto.blockmaster2011
  where block_dc.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_fl, carto.blockmaster2011
  where block_fl.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ga, carto.blockmaster2011
  where block_ga.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_hi, carto.blockmaster2011
  where block_hi.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_id, carto.blockmaster2011
  where block_id.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_il, carto.blockmaster2011
  where block_il.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_in, carto.blockmaster2011
  where block_in.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ia, carto.blockmaster2011
  where block_ia.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ks, carto.blockmaster2011
  where block_ks.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ky, carto.blockmaster2011
  where block_ks.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_la, carto.blockmaster2011
  where block_la.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_me, carto.blockmaster2011
  where block_me.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_md, carto.blockmaster2011
  where block_md.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ma, carto.blockmaster2011
  where block_ma.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_mi, carto.blockmaster2011
  where block_mi.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_mn, carto.blockmaster2011
  where block_mn.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ms, carto.blockmaster2011
  where block_ms.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_mo, carto.blockmaster2011
  where block_mo.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_mt, carto.blockmaster2011
  where block_mt.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ne, carto.blockmaster2011
  where block_ne.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_nv, carto.blockmaster2011
  where block_nv.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_nh, carto.blockmaster2011
  where block_nh.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_nj, carto.blockmaster2011
  where block_nj.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
 
insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_nm, carto.blockmaster2011
  where block_nm.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ny, carto.blockmaster2011
  where block_ny.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_nc, carto.blockmaster2011
  where block_nc.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_nd, carto.blockmaster2011
  where block_nd.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_oh, carto.blockmaster2011
  where block_oh.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ok, carto.blockmaster2011
  where block_ok.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_or, carto.blockmaster2011
  where block_or.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_pa, carto.blockmaster2011
  where block_pa.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ri, carto.blockmaster2011
  where block_ri.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_sc, carto.blockmaster2011
  where block_sc.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_sd, carto.blockmaster2011
  where block_sd.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_tn, carto.blockmaster2011
  where block_tn.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_tx, carto.blockmaster2011
  where block_tx.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_ut, carto.blockmaster2011
  where block_ut.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_vt, carto.blockmaster2011
  where block_vt.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_va, carto.blockmaster2011
  where block_va.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_wa, carto.blockmaster2011
  where block_wa.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_wv, carto.blockmaster2011
  where block_wv.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_wi, carto.blockmaster2011
  where block_wi.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_wy, carto.blockmaster2011
  where block_wy.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_as, carto.blockmaster2011
  where block_as.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_gu, carto.blockmaster2011
  where block_gu.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_mp, carto.blockmaster2011
  where block_mp.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_pr, carto.blockmaster2011
  where block_pr.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;

insert into carto.tribal
  select st_simplify(st_union(geom),5) as geom, tribal_id, tribal_name
  from carto.block_vi, carto.blockmaster2011
  where block_vi.geoid10=blockmaster2011.block_fips
  and tribal_id is not null
  group by tribal_id, tribal_name;
