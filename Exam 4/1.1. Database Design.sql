CREATE TABLE towns (
	id serial PRIMARY KEY,
	name varchar(45) NOT null
);

CREATE TABLE stadiums(
	id serial PRIMARY KEY,
	name varchar(45) NOT NULL,
	capacity int NOT NULL check(capacity > 0),
	town_id int NOT NULL,
	CONSTRAINT fk_stadiums_towns
	FOREIGN key(town_id) REFERENCES towns(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE teams (
	id serial PRIMARY KEY,
	name varchar(45) NOT NULL,
	established date NOT NULL,
	fan_base int DEFAULT 0 NOT NULL check(fan_base >= 0),
	stadium_id int NOT NULL,
	CONSTRAINT fk_teams_stadiums
	FOREIGN KEY (stadium_id) REFERENCES stadiums(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);


CREATE TABLE coaches (
	id serial PRIMARY KEY,
	first_name varchar(10) NOT NULL,
	last_name varchar(20) NOT NULL,
	salary numeric(10, 2) DEFAULT 0 NOT NULL check(salary >= 0),
	coach_level int DEFAULT 0 NOT NULL check(coach_level >= 0)
	);

CREATE TABLE skills_data (
    id serial PRIMARY KEY,
    dribbling int DEFAULT 0 check(dribbling >= 0),
    pace int DEFAULT 0 check(pace >= 0),
    "passing" int DEFAULT 0 check("passing" >= 0),
    shooting int DEFAULT 0 check(shooting >= 0),
    speed int DEFAULT 0 check(speed >= 0),
    strength int DEFAULT 0 check(strength >= 0)
);


CREATE TABLE players (
	id serial PRIMARY KEY,
	first_name varchar(10) NOT NULL,
	last_name varchar(20) NOT NULL,
	"age" int DEFAULT 0 NOT NULL check("age" >= 0),
	"position" char(1) NOT NULL,
	salary numeric(10, 2) DEFAULT 0 NOT NULL check("salary" >= 0),
	hire_date TIMESTAMP,
	skills_data_id int NOT NULL,
	team_id int,
	CONSTRAINT fk_players_skills_data
	FOREIGN KEY (skills_data_id) REFERENCES skills_data(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_players_teams
	FOREIGN KEY (team_id) REFERENCES teams(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);


CREATE TABLE players_coaches (
	player_id int,
	coach_id int,
	CONSTRAINT fk_players_coaches_players
	FOREIGN KEY (player_id) REFERENCES players(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_players_coaches_coaches
	FOREIGN KEY (coach_id) REFERENCES coaches(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
