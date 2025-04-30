CREATE TABLE times_2023 (nome VARCHAR(50));
CREATE TABLE equipes_2018 (nome VARCHAR(50));

INSERT INTO times_2023 (nome) VALUES 
('Alfa Romeo'), ('Aston Martin'), ('Alpha Tauri'), ('Renault'), ('Ferrari'), 
('Haas'), ('McLaren'), ('Mercedes'), ('Red Bull'), ('Williams');

INSERT INTO equipes_2018 (nome) VALUES 
('Ferrari'), ('Force India'), ('Racing Point'), ('Haas'), ('McLaren'), 
('Mercedes'), ('Aston Martin'), ('Renault'), ('Sauber'), ('Red Bull'), ('Williams');

SELECT T23.nome, E18.nome
FROM times_2023 T23
INNER JOIN equipes_2018 E18 ON T23.nome = E18.nome;

SELECT T23.nome, E18.nome
FROM times_2023 T23
LEFT JOIN equipes_2018 E18 ON T23.nome = E18.nome;

SELECT T23.nome, E18.nome
FROM times_2023 T23
RIGHT JOIN equipes_2018 E18 ON T23.nome = E18.nome;

SELECT T23.nome, E18.nome
FROM times_2023 T23
FULL OUTER JOIN equipes_2018 E18 ON T23.nome = E18.nome;

SELECT T23.nome, E18.nome
FROM times_2023 T23
CROSS JOIN equipes_2018 E18;