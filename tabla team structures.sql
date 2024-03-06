CREATE TABLE Rols (
    id_rol   INT PRIMARY KEY,
    rol_name VARCHAR(100) NOT NULL
);

CREATE TABLE Clusters (
    id_cluster   INT PRIMARY KEY,
    cluster_name VARCHAR(100) NOT NULL
);
CREATE TABLE Clusters_Rols_Relation (
    id_cluster INT,
    id_rol     INT,
    CONSTRAINT pk_Cluster_Rol_Relation PRIMARY KEY ( id_cluster,id_rol ),
    FOREIGN KEY ( id_cluster )REFERENCES Clusters ( id_cluster ),
    FOREIGN KEY ( id_rol )REFERENCES Rols ( id_rol )
);

CREATE TABLE Areas (
    id_area   INT PRIMARY KEY,
    area_name VARCHAR(100) NOT NULL
);

CREATE TABLE Team_Structure (
    id_user_Team    INT PRIMARY KEY,
    id_rol,
    first_name VARCHAR(255) NOT NULL,
    last_name  VARCHAR(255) NOT NULL,
    email      VARCHAR(255) NOT NULL,
    status     VARCHAR(10) NOT NULL,
    id_cluster INT,
    id_area    INT,
    FOREIGN KEY ( id_rol )REFERENCES Rols ( id_rol ),
    FOREIGN KEY ( id_cluster,id_rol )REFERENCES Clusters_Rols_Relation ( id_cluster,id_rol ),
    FOREIGN KEY ( id_area )REFERENCES Areas ( id_area )
);

--DROP TABLE Team_Structure;