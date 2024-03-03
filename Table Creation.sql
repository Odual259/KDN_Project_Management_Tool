--Prueba Git
--Creaci�n de Tablas Fase 1
CREATE TABLE CLIENTS (
    ID_CLIENT INT PRIMARY KEY,
    CLIENT_NAME VARCHAR(255) NOT NULL,
    STATUS_CLIENT VARCHAR(50),
    SERVICES VARCHAR(255)
);

CREATE TABLE CLUSTERS (
    ID_CLUSTER INT PRIMARY KEY,
    CLUSTER_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE COUNTRIES (
    ID_COUNTRY INT PRIMARY KEY,
    COUNTRY_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE CLUSTERS_COUNTRIES_RELATION (
    ID_CLUSTER INT,
    ID_COUNTRY INT,
    CONSTRAINT PK_CLUSTER_COUNTRY_RELATION PRIMARY KEY (ID_CLUSTER, ID_COUNTRY),
    FOREIGN KEY (ID_CLUSTER) REFERENCES CLUSTERS(ID_CLUSTER),
    FOREIGN KEY (ID_COUNTRY) REFERENCES COUNTRIES(ID_COUNTRY)
);

CREATE TABLE BUSINESS_TYPES (
    BUSINESS_TYPE_ID INT PRIMARY KEY,
    BUSINESS_TYPE_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE ENTITIES_PER_CLIENT (
    ID_ENTITY INT PRIMARY KEY,
    ID_CLIENT INT,
    COMPANY_INTERNAL_ID INT,
    COMPANY_NAME VARCHAR(255),
    LEGAL_ID VARCHAR(50),
    ID_CLUSTER INT,
    ID_COUNTRY INT,
    BUSINESS_TYPE_ID INT,
    FOREIGN KEY (ID_CLIENT) REFERENCES CLIENTS(ID_CLIENT),
    FOREIGN KEY (ID_CLUSTER, ID_COUNTRY) REFERENCES CLUSTERS_COUNTRIES_RELATION(ID_CLUSTER, ID_COUNTRY),
    FOREIGN KEY (BUSINESS_TYPE_ID) REFERENCES BUSINESS_TYPES(BUSINESS_TYPE_ID)
);
--Drop Tables para hacer cambios
DROP TABLE BUSINESS_TYPES;
DROP TABLE CLIENTS;
DROP TABLE CLUSTERS;
DROP TABLE CLUSTERS_COUNTRIES_RELATION;
DROP TABLE COUNTRIES;
DROP TABLE ENTITIES_PER_CLIENT;