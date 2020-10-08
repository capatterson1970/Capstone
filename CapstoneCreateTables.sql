USE soccer;

DROP TABLE IF EXISTS players, playerAddress, playerContact, guardians, guardianAddress, guardianContact, teams, coaches, coachAddress, coachContact, managers, managerAddress, managerContact;

CREATE TABLE teams (
  id INT NOT NULL AUTO_INCREMENT,
  team_name VARCHAR(50),
  age_group VARCHAR(3),
  PRIMARY KEY (id)
);

CREATE TABLE players (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  jersey_number INT NOT NULL,
  team_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (team_id)
  REFERENCES teams (id)
);

CREATE TABLE playerContact (
  id INT NOT NULL AUTO_INCREMENT,
  player_id INT NOT NULL,
  phone VARCHAR(50),
  email VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (player_id)
  REFERENCES players (id)
    ON DELETE CASCADE
);

CREATE TABLE playerAddress (
  id INT NOT NULL AUTO_INCREMENT,
  player_id INT NOT NULL,
  address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  zip VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (player_id)
  REFERENCES players (id)
    ON DELETE CASCADE
);

CREATE TABLE guardians (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  player_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (player_id)
  REFERENCES players (id)
);

CREATE TABLE guardianContact (
  id INT NOT NULL AUTO_INCREMENT,
  guardian_id INT NOT NULL,
  phone1 VARCHAR(50),
  phone2 VARCHAR(50),
  email VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (guardian_id)
  REFERENCES guardians (id)
    ON DELETE CASCADE
);

CREATE TABLE guardianAddress (
  id INT NOT NULL AUTO_INCREMENT,
  guardian_id INT NOT NULL,
  address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  zip VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (guardian_id)
  REFERENCES guardians (id)
    ON DELETE CASCADE
);

CREATE TABLE coaches (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  team_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (team_id)
  REFERENCES teams (id)
);

CREATE TABLE coachContact (
  id INT NOT NULL AUTO_INCREMENT,
  coach_id INT NOT NULL,
  phone1 VARCHAR(50),
  phone2 VARCHAR(50),
  email VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (coach_id)
  REFERENCES coaches (id)
    ON DELETE CASCADE
);

CREATE TABLE coachAddress (
  id INT NOT NULL AUTO_INCREMENT,
  coach_id INT NOT NULL,
  address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  zip VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (coach_id)
  REFERENCES coaches (id)
    ON DELETE CASCADE
);

CREATE TABLE managers (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  team_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (team_id)
  REFERENCES teams (id)
);

CREATE TABLE managerContact (
  id INT NOT NULL AUTO_INCREMENT,
  manager_id INT NOT NULL,
  phone1 VARCHAR(50),
  phone2 VARCHAR(50),
  email VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (manager_id)
  REFERENCES managers (id)
    ON DELETE CASCADE
);

CREATE TABLE managerAddress (
  id INT NOT NULL AUTO_INCREMENT,
  manager_id INT NOT NULL,
  address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  zip VARCHAR(50),
  PRIMARY KEY (id),
  FOREIGN KEY (manager_id)
  REFERENCES managers (id)
    ON DELETE CASCADE
);