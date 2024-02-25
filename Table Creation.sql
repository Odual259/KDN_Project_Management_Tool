--Creación de Tablas Fase 1
CREATE TABLE CLIENTS (
    ID_Client INT PRIMARY KEY,
    Client_Name VARCHAR(255) NOT NULL,
    Status_Client VARCHAR(50),
    Services VARCHAR(255)
);

CREATE TABLE CLUSTERS (
    Cluster_ID INT PRIMARY KEY,
    Cluster_Name VARCHAR(100) NOT NULL
);

CREATE TABLE COUNTRIES (
    Country_ID INT PRIMARY KEY,
    Country_Name VARCHAR(100) NOT NULL
);

CREATE TABLE CLUSTER_COUNTRIES_RELATION (
    Cluster_ID INT,
    Country_ID INT,
    PRIMARY KEY (Cluster_ID, Country_ID),
    FOREIGN KEY (Cluster_ID) REFERENCES CLUSTER(Cluster_ID),
    FOREIGN KEY (Country_ID) REFERENCES COUNTRIES(Country_ID)
);

CREATE TABLE BUSINESS_TYPES (
    Business_Type_ID INT PRIMARY KEY,
    Business_Type_Name VARCHAR(100) NOT NULL
);

CREATE TABLE ENTITIES_PER_CLIENT (
    ID_Entity INT PRIMARY KEY,
    ID_Client INT,
    Company_Internal_ID INT,
    Company_Name VARCHAR(255),
    Legal_ID VARCHAR(50),
    Cluster_ID INT,
    Country_ID INT,
    Business_Type_ID INT,
    FOREIGN KEY (ID_Client) REFERENCES CLIENTS(ID_Client),
    FOREIGN KEY (Cluster_ID) REFERENCES CLUSTER_PAISES_RELATION(Cluster_ID),
    FOREIGN KEY (Country_ID) REFERENCES CLUSTER_PAISES_RELATION(Country_ID),
    FOREIGN KEY (Business_Type_ID) REFERENCES BUSINESS_TYPES(Business_Type_ID)
);