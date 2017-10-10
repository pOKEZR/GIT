-- Création de la BD  : on supprime la database, on la recrée, on l'utilise

drop database if exists empdeptTP05;
create database empdeptTP05;
use empdeptTP05;

-- Création des tables

CREATE TABLE employes (
       	     NE    	      integer primary key auto_increment,
	     NOM     	      varchar(10) not NULL,
	     JOB 	      enum ('PRESIDENT','MANAGER', 'SALESMAN', 'CLERK', 'ANALYST') not NULL,
	     DATEMB  	      date not NULL,
	     SAL 	      float(7,2) not NULL,
	     COMM             float(7,2),
	     ND	              integer not null,
	     NEchef 	      integer, foreign key(NEchef) references employes(NE)
	     ) Engine InnoDB;

CREATE TABLE departements (
       	      ND    		  integer primary key auto_increment,
	      NOM 	  	  varchar(14) not NULL,
	      VILLE       	  varchar(13) not NULL,
	      NEchef      	  integer, foreign key(NEchef) references employes(NE)
	      ) engine INNODB;

-- création des tuples

INSERT INTO employes VALUES (7839,'KING','PRESIDENT','1981-11-17',5000,NULL,10,NULL);
INSERT INTO employes VALUES (7698,'BLAKE','MANAGER','1981-05-1',2850,NULL,30,7839);
INSERT INTO employes VALUES (7782,'CLARK','MANAGER','1981-06-9',2450,NULL,10,7839);
INSERT INTO employes VALUES (7566,'JONES','MANAGER','1981-04-2',2975,NULL,20,7839);
INSERT INTO employes VALUES (NULL,'MARTIN','SALESMAN','1981-09-28',1250,1400,30,7698);
INSERT INTO employes VALUES (NULL,'ALLEN','SALESMAN','1981-02-20',1600,300,30,7698);
INSERT INTO employes VALUES (NULL,'TURNER','SALESMAN','1981-09-8',1500,0,30,7698);
INSERT INTO employes VALUES (NULL,'JAMES','CLERK','1981-12-3',950,NULL,20,7698);
INSERT INTO employes VALUES (NULL,'WARD','SALESMAN','1981-02-22',1250,500,30,7698);
INSERT INTO employes VALUES (NULL,'FORD','ANALYST','1981-12-3',3000,NULL,20,7566);
INSERT INTO employes VALUES (NULL,'SMITH','CLERK','1980-12-17',800,NULL,20,last_insert_id());
INSERT INTO employes VALUES (NULL,'SCOTT','ANALYST','1982-12-09',3000,NULL,20,7566);
INSERT INTO employes VALUES (NULL,'ADAMS','CLERK','1983-01-12',1100,NULL,20,last_insert_id());
INSERT INTO employes VALUES (NULL,'MILLER','CLERK','1982-01-23',1300,NULL,10,7782);

INSERT INTO departements VALUES
(10,'ACCOUNTING','NEW YORK',7782),
(20,'RESEARCH','DALLAS',7566),
(30,'SALES','CHICAGO',7698),
(40,'OPERATIONS','BOSTON',NULL)
;

ALTER TABLE employes ADD CONSTRAINT FK1 FOREIGN KEY(ND) REFERENCES departements(ND);
