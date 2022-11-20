DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS category;


CREATE TABLE category (
	category_id INT AUTO_INCREMENT NOT NULL,
	PRIMARY KEY (category_id),
	category_name VARCHAR(128) NOT NULL
);

CREATE TABLE project (
	project_id INT AUTO_INCREMENT NOT NULL,
	PRIMARY KEY (project_id),
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT
);

CREATE TABLE project_category (
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step (
	step_id INT AUTO_INCREMENT NOT NULL,
	PRIMARY KEY (step_id),
	project_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL
);

CREATE TABLE material (
	material_id INT AUTO_INCREMENT NOT NULL,
	PRIMARY KEY (material_id),
	project_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2)
);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Hang Garage Door', 6, 5.5, 5, 'Follow instruction booklet closely.');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Door hangers', 3, 96.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Screws', 40, 23.00);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Align hangers on opening side', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Screw hangers into frame', 2);
INSERT INTO category (category_id, category_name) VALUES (1, 'Doors and Windows');
INSERT INTO category (category_id, category_name) VALUES (2, 'Repairs');
INSERT INTO category (category_id, category_name) VALUES (3, 'Gardening');
INSERT INTO project_category (project_id, category_id) VALUES (1, 1);
INSERT INTO project_category (project_id, category_id) VALUES (1, 2);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Hang New Bedroom Door', 4, 3.5, 3, 'Follow instruction booklet closely.');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Door hangers', 2, 45.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Screws', 20, 10.00);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Align hangers on opening side', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Screw hangers into frame', 2);
INSERT INTO project_category (project_id, category_id) VALUES (2, 1);
INSERT INTO project_category (project_id, category_id) VALUES (2, 2);
INSERT INTO project_category (project_id, category_id) VALUES (2, 3);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Hang New Shower Door', 5, 4, 4, 'Follow instruction booklet closely.');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Door hangers', 2, 45.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Screws', 25, 15.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Shower Door', 1, 165.00);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Align hangers on opening side', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Screw hangers into frame', 2);
INSERT INTO project_category (project_id, category_id) VALUES (3, 1);
INSERT INTO project_category (project_id, category_id) VALUES (3, 2);