connect 'jdbc:rmi://localhost:1099/jdbc:cloudscape:survey;create=true';
connect 'jdbc:mysql://localhost:3306/jdbc:mysql:survey;create=true'
;
CREATE TABLE SURVEYRESULTS
   (
      FIRSTNAME VARCHAR(20) NOT NULL ,
      LASTNAME VARCHAR(20) NOT NULL ,
      EMAIL VARCHAR(50) NOT NULL ,
      Q01 TINYINT DEFAULT 5 NOT NULL ,
      Q02 TINYINT DEFAULT 5 NOT NULL ,
      Q03 TINYINT DEFAULT 5 NOT NULL ,
      Q04 TINYINT DEFAULT 5 NOT NULL ,
      Q05 TINYINT DEFAULT 5 NOT NULL ,
      Q06 TINYINT DEFAULT 5 NOT NULL ,
      Q07 TINYINT DEFAULT 5 NOT NULL ,
      Q08 TINYINT DEFAULT 5 NOT NULL ,
      Q09 TINYINT DEFAULT 5 NOT NULL ,
      Q10 TINYINT DEFAULT 5 NOT NULL 
   )
   PROPERTIES 
      cloudscape.storage.pageReservedSpace=20, 
      cloudscape.storage.initialPages=1, 
      cloudscape.storage.pageSize=4096, 
      cloudscape.storage.minimumRecordSize=12
;
ALTER TABLE SURVEYRESULTS
   ADD CONSTRAINT PK_KEY1 Primary Key (
      EMAIL)
;
ALTER TABLE SURVEYRESULTS
   SET LOCKING = ROW
;