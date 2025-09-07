USE ROLE USERADMIN;

CREATE ROLE ice_cream_reader COMMENT = "Able to read ice_cream_db";

CREATE ROLE ice_cream_writer COMMENT = "Able to CRUD operations on ice_cream_db";

CREATE ROLE ice_cream_analyst COMMENT = "Able to create views on ice_cream_db";

SHOW ROLES;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_reader;

GRANT USAGE ON DATABASE ice_cream_db  TO ROLE ice_cream_reader;

GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_reader;

-- READ - SELECT to ice_cream_reader

GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;

GRANT SELECT ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;

SHOW GRANTS TO ROLE ice_cream_reader;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

GRANT ROLE ice_cream_reader TO ROLE ice_cream_writer;

-- ice_cream_writer role has ice_cream_reader role granted on
SHOW GRANTS TO ROLE ice_cream_writer;

-- grant CRUD operations to ice_cream_writer
GRANT INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

GRANT INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public; 
GRANT ROLE ice_cream_writer TO USER EBT35;