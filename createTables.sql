CREATE TABLE Units
(
  Unit_id_ number NOT NULL,
  Unit_name_ VARCHAR2(100),
  Location_ VARCHAR2(100) NOT NULL,
  PRIMARY KEY (Unit_id_)
);


CREATE TABLE Salaries
(
  Salary_id_ NUMBER NOT NULL,
  Amount_ NUMBER NOT NULL,
  Payment_date_ DATE NOT NULL,
  PRIMARY KEY (Salary_id_)
);


CREATE TABLE Trainings_
(
  Training_id_ NUMBER NOT NULL,
  Training_name_ VARCHAR2(100) NOT NULL,
  Start_date_ DATE NOT NULL,
  End_date_ DATE NOT NULL,
  PRIMARY KEY (Training_id_)
);


CREATE TABLE Roles_
(
  Role_id_ NUMBER NOT NULL,
  Role_description_ VARCHAR2(1000),
  Role_name VARCHAR2(100) NOT NULL,
  PRIMARY KEY (Role_id_)
);


CREATE TABLE Projects
(
  Project_id NUMBER NOT NULL,
  Project_name VARCHAR2(100) NOT NULL,
  Start_date DATE NOT NULL,
  End_date DATE NOT NULL,
  PRIMARY KEY (Project_id)
);

CREATE TABLE Soldiers
(
  Soldier_id_ NUMBER NOT NULL,
  First_name_ VARCHAR2(100),
  Last_name_ VARCHAR2(100),
  Birth_date_ DATE,
  Rank_ VARCHAR2(100),
  Unit_id_ NUMBER NOT NULL,
  Salary_id_ NUMBER,
  Role_id_ NUMBER NOT NULL,
  PRIMARY KEY (Soldier_id_),
  FOREIGN KEY (Salary_id_) REFERENCES Salaries(Salary_id_),
  FOREIGN KEY (Unit_id_) REFERENCES Units(Unit_id_),
  FOREIGN KEY (Role_id_) REFERENCES Roles_(Role_id_)
);




CREATE TABLE Participant
(
  Soldier_id_ NUMBER NOT NULL,
  Training_id_ NUMBER NOT NULL,
  PRIMARY KEY (Soldier_id_, Training_id_),
  FOREIGN KEY (Soldier_id_) REFERENCES Soldiers(Soldier_id_),
  FOREIGN KEY (Training_id_) REFERENCES Trainings_(Training_id_)
);


CREATE TABLE Have
(
  Soldier_id_ NUMBER NOT NULL,
  Project_id NUMBER NOT NULL,
  PRIMARY KEY (Soldier_id_, Project_id),
  FOREIGN KEY (Soldier_id_) REFERENCES Soldiers(Soldier_id_),
  FOREIGN KEY (Project_id) REFERENCES Projects(Project_id)
);
