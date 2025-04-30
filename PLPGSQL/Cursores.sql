-- Cursores
-- Permitem processar os resultados de uma query linha por linha / bloco por bloco
-- Daí evita que ueries muito grandes sejam completamente carregadas na memória

-- Exemplo:
CREATE TABLE alunos2 (
	id SERIAL PRIMARY KEY,
	nom_alu VARCHAR(100)
);

INSERT INTO alunos2 (nom_alu) VALUES ('Alice');
INSERT INTO alunos2 (nom_alu) VALUES ('Bob');
INSERT INTO alunos2 (nom_alu) VALUES ('Carol');
INSERT INTO alunos2 (nom_alu) VALUES ('David');
INSERT INTO alunos2 (nom_alu) VALUES ('Eve');
SELECT * FROM alunos2;

CREATE OR REPLACE FUNCTION refAlunos() RETURNS VOID AS $$
DECLARE
	cursor_alunos2 CURSOR FOR SELECT * FROM alunos2;
	aluno2 alunos2%ROWTYPE;
BEGIN
	OPEN cursor_alunos2;
	-- Loop para percorrer os registros
	LOOP
		FETCH cursor_alunos2 INTO aluno2;
		EXIT WHEN NOT FOUND;
		-- Exibit o nome do aluno
		RAISE NOTICE 'Nome: %', aluno2.nom_alu;
	END LOOP;
	CLOSE cursor_alunos2;
END;
$$ LANGUAGE PLPGSQL;

BEGIN;
SELECT refAlunos();
COMMIT;


-- Exemplo 2:
CREATE TABLE Produto (
	cod_prod INT PRIMARY KEY,
	descricao VARCHAR(50) UNIQUE,
	qtde_disponivel INT NOT NULL DEFAULT 0
);
INSERT INTO Produto VALUES (1, 'Feijão', 10);
INSERT INTO Produto VALUES (2, 'Arroz', 5);
INSERT INTO Produto VALUES (3, 'Macarrão', 15);
INSERT INTO Produto VALUES (4, 'Farinha', 25);
INSERT INTO Produto VALUES (5, 'Fubá', 7);
INSERT INTO Produto VALUES (6, 'Achocolatado', 10);
INSERT INTO Produto VALUES (7, 'Sal', 15);
INSERT INTO Produto VALUES (8, 'Açúcar', 10);
INSERT INTO Produto VALUES (9, 'Óleo', 30);
select * from produto


CREATE OR REPLACE FUNCTION listagem_produtos (prod_cursor refcursor) 
RETURNS refcursor AS $$
BEGIN
	OPEN prod_cursor FOR SELECT * FROM PRODUTO;
	RETURN prod_cursor;
END;
$$ LANGUAGE PLPGSQL;

select listagem_produtos ('cursor_prod');
fetch first in cursor_prod;

select listagem_produtos ('cursor_prod');
fetch 4 in cursor_prod;

select listagem_produtos ('cursor_prod');
fetch absolute 4 in cursor_prod;

select listagem_produtos ('cursor_prod');
fetch absolute 4 in cursor_prod;
fetch relative 3 in cursor_prod;


















