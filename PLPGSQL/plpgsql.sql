-- Função de soma
CREATE FUNCTION add(integer, integer) RETURNS integer AS '
	SELECT $1 + $2;
'
LANGUAGE SQL
RETURNS NULL ON NULL INPUT;

SELECT add(1, 2);

-- Função para incrementar 1 à um valor qualquer
CREATE FUNCTION increment(integer) RETURNS integer AS '
	SELECT $1 + 1;
'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

SELECT increment(1);


-- Agora, vamos fazer isso em PLPGSQL

CREATE OR REPLACE FUNCTION increment(i integer) RETURNS integer
AS $$
BEGIN
RETURN i + 1;
END;
$$ LANGUAGE PLPGSQL;

SELECT increment(410);


-- Exemplo 1 dos slides
CREATE TABLE alunos (
 idaluno INT PRIMARY KEY,
 nome VARCHAR(100),
 cod_matricula INT
);

CREATE OR REPLACE FUNCTION clean_alunos() RETURNS void AS '
	DELETE FROM alunos WHERE cod_matricula < 10;
' LANGUAGE SQL;

SELECT * FROM alunos;

SELECT clean_alunos();

SELECT * FROM alunos;


-- Exemplo 2 dos slides
-- Func que seleciona alunos com base na matricula e retorna uma linha da tabela alunos (em SQL)
CREATE OR REPLACE FUNCTION select_alunos(cod_matricula integer)
RETURNS alunos AS $$
	select * from alunos where cod_matricula = $1
$$ LANGUAGE SQL;

SELECT * FROM select_alunos(10);


-- Exemplo 3 slides
-- Uma função que seleciona alunos com base na matrícula e retorna uma linha da tabela Alunos.
CREATE OR REPLACE FUNCTION nome_alunos(integer) RETURNS text AS $$
	SELECT nome FROM alunos WHERE cod_matricula = $1;
$$ LANGUAGE SQL;

SELECT * FROM nome_alunos(10);


-- Exemplo 4 slides
-- Uma função que insere um novo aluno e retorna a matrícula gerada para o mesmo
CREATE OR REPLACE FUNCTION insert_aluno(int, text, int) RETURNS integer AS $$

	INSERT INTO alunos(idaluno, nome, cod_matricula)
	VALUES ($1, $2, $3);
	SELECT $3;

$$ LANGUAGE SQL;

SELECT * FROM alunos


-- EXERCICIO

-- 0 - Primeiro deverá criar a tabela professor com os seguintes campos:
-- idprofessor, nome, cod_professor, email, telefone.
CREATE TABLE professor (
	idprofessor		SERIAL PRIMARY KEY,
	nome			varchar(100),
	cod_professor	int,
	email			varchar(50),
	telefone		varchar(20)
);

-- 1 - Construa uma funtion que insira um novo professor. 
CREATE OR REPLACE FUNCTION insert_professor(text, int, text, text) RETURNS void AS
$$

	INSERT INTO professor(nome, cod_professor, email, telefone)
	VALUES ($1, $2, $3, $4);

$$ LANGUAGE SQL;

SELECT insert_professor('a', 1, 'b', 'c');

SELECT * FROM professor;

-- 2 - Crie uma function para consultar os professores
CREATE OR REPLACE FUNCTION consultar_professor() RETURNS professor AS
$$

	SELECT * FROM professor;

$$ LANGUAGE SQL;

SELECT * FROM consultar_professor();


-- 3 - Crie uma function para deletar um professor pelo cod_professor.
CREATE OR REPLACE FUNCTION deletar_professor(integer) RETURNS void AS
$$

	DELETE FROM professor WHERE cod_professor = $1;

$$ LANGUAGE SQL;

SELECT * FROM deletar_professor(1);
SELECT * FROM PROFESSOR;






