CREATE FUNCTION add(integer, integer) RETURNS integer AS '
select $1 + $2;
' LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

SELECT add(1, 1);

CREATE OR REPLACE FUNCTION increment(i integer) RETURNS integer 
AS $$
 BEGIN
 RETURN i + 1;
 END;
 $$ LANGUAGE plpgsql;
 
SELECT increment(410);


CREATE FUNCTION clean_emp() RETURNS void AS '
 DELETE FROM emp
 WHERE salary < 0;
' LANGUAGE SQL;


 CREATE TABLE alunos (
 	idaluno INT PRIMARY KEY,
 	nome VARCHAR(100),
 	cod_matricula INT
 );
 
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (1, 'João Silva', 1);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (2, 'Maria Santos', 2);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (3, 'Carlos Oliveira', 3);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (4, 'Ana Pereira', 4);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (5, 'Pedro Souza', 5);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (6, 'Mariana Lima', 6);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (7, 'Fernando Costa', 7);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (8, 'Amanda Rodrigues', 8);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (9, 'Lucas Martins', 9);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (10, 'Camila Almeida', 10);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (11, 'Gustavo Oliveira', 11);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (12, 'Juliana Barbosa', 12);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (13, 'Rafaela Sousa', 13);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (14, 'Daniel Pereira', 14);
 INSERT INTO alunos (idaluno, nome, cod_matricula) VALUES (15, 'Carolina Silva', 15);









 