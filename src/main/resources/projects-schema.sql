DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS category;

CREATE TABLE project (
project_id int AUTO_INCREMENTS NOT NULL,
project_name varchar(128) NOT NULL,
estimate_hours decimal(7,2),
actual_hours decimal (7,2),
difficulty int,
notes TEXT,
PRIMARY KEY (project_id)
);

CREATE TABLE category (  
category_id int AUTO_INCREMENTS NOT NULL,
category_name varchar(128) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE project_category ( 
project_id	int	NOT NULL,
category_id int NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step (
step_id int AUTO_INCREMENTS NOT NULL,
project_id int NOT NULL,
step_text TEXT NOT NULL,
step_order int NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE materials (
material_id int AUTO_INCREMENTS NOT NULL,
project_id int NOT NULL,
material_name varchar(128) NOT NULL,
num_required int,
cost decimal (7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);