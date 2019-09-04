DROP DATABASE IF EXISTS TinderProf;
CREATE DATABASE TinderProf;
USE TinderProf;

CREATE TABLE Utilisateur(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(240) NOT NULL ,
  prenom VARCHAR(240) NOT NULL ,
  addresse VARCHAR(240) NOT NULL ,
  ville VARCHAR(240) NOT NULL ,
  email VARCHAR(240) NOT NULL ,
  portable VARCHAR(240) NOT NULL ,
  formateur BOOLEAN NOT NULL ,
  eleve BOOLEAN NOT NULL ,
  description VARCHAR(240) NOT NULL,
  photo LONGBLOB
);

CREATE TABLE Matiere(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nomMatiere VARCHAR(240) NOT NULL
);

CREATE TABLE Utilisateur_Matiere(
  idUser INTEGER NOT NULL,
  idMatiere INTEGER NOT NULL,
  FOREIGN KEY (idUser) REFERENCES Utilisateur(id),
  FOREIGN KEY (idMatiere) REFERENCES Matiere(id)
);

CREATE TABLE Avis(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  idUserGive INTEGER ,
  idUserGet INTEGER,
  avis BOOLEAN NOT NULL,
  date DATE NOT NULL,
  FOREIGN KEY (idUserGive) REFERENCES Utilisateur(id),
  FOREIGN KEY (idUserGet) REFERENCES Utilisateur(id)
);

CREATE TABLE `Match`
(
    id int PRIMARY KEY AUTO_INCREMENT,
    idUserEnvoi int NOT NULL,
    idUserRecoi int NOT NULL,
    date date,
    CONSTRAINT Match_Utilisateur_id_fk FOREIGN KEY (idUserEnvoi) REFERENCES Utilisateur (id),
    CONSTRAINT Match_Utilisateur_id_fk_2 FOREIGN KEY (idUserRecoi) REFERENCES Utilisateur (id)
);

CREATE TABLE Messages(
  id int PRIMARY KEY AUTO_INCREMENT,
  message VARCHAR(240) NOT NULL, 
  date DATE NOT NULL, 
  idMatch INTEGER NOT NULL, 
  lu BOOLEAN,
  FOREIGN KEY (idMatch) REFERENCES `Match` (id)
  
);