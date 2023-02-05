DROP TABLE IF EXISTS materials;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
project_id int AUTO_INCREMENT NOT NULL,
project_name varchar(128) NOT NULL,
estimated_hours decimal(7,2),
actual_hours decimal (7,2),
difficulty int,
notes TEXT,
PRIMARY KEY (project_id)
);

CREATE TABLE category (  
category_id int AUTO_INCREMENT NOT NULL,
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

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Door', 4, 3, 3, 'Used HD hangers');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Door hanger', 1);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Screws', 20,);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Align hangers on opening side of door vertically on the wall');
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Screw hangers into frame', 2);
INSERT INTO category (category_id, category_name) VALUES (1, 'Doors and Windows');
INSERT INTO category (category_id, category_name) VALUES(2, 'Repairs');
INSERT INTO category (category_id, category_name) VALUES (3, 'Gardening');
INSERT INTO project_category (project_id, category_id) VALUES (1, 1);
INSERT INTO project_category (project_id, category_id) VALUES (1, 2);

CREATE TABLE step (
step_id int AUTO_INCREMENT NOT NULL,
project_id int NOT NULL,
step_text TEXT NOT NULL,
step_order int NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE materials (
material_id int AUTO_INCREMENT NOT NULL,
project_id int NOT NULL,
material_name varchar(128) NOT NULL,
num_required int,
cost decimal (7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);