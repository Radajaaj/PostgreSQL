-- Stored procedure que retorna valor por um parâmetro OUT:
CREATE OR REPLACE FUNCTION somar(x integer, y integer, OUT z integer) AS 
$$
BEGIN
	z = x + y;
END;
$$ LANGUAGE PLPGSQL;

SELECT somar(1, 2);


CREATE TABLE professor (
	idprofessor		SERIAL PRIMARY KEY,
	nome			varchar(100),
	cod_professor	int,
	email			varchar(50),
	telefone		varchar(20)
);


-- Também podem retornar um resultset de uma query! Daí definimos um return
-- No caso, ele retorna uma tabela genérica, definida nessa mesma função
CREATE OR REPLACE FUNCTION ATORES_FILMES_CACHES(ID_ATOR integer)
RETURNS TABLE(nome text, filme text, cache_ integer) AS $$
BEGIN

	RETURN QUERY
	SELECT A.NOME, F.NOME, C.CACHE AS CACHE_ FROM ATOR A
	INNER JOIN FILME_ATOR FA ON A.IDATOR=FA.IDATOR
	INNER JOIN FILME F ON F.IDFILME=FA.IDFILME
	INNER JOIN ATOR_CACHE C ON A.IDATOR=C.IDATOR
	WHERE A.IDATOR=ID_ATOR ORDER BY F.NOME ASC;

END;
$$ LANGUAGE PLPGSQL;


-- Stored procedures que não usam o OUT precisam definir o retorno como VOID.
CREATE OR REPLACE FUNCTION Renomear_ATOR_nome(matricula integer, nome_novo text)
RETURNS void AS $$
BEGIN

	UPDATE ATOR
	SET NOME = nome_novo
	WHERE IDATOR = matricula;

END;
$$ LANGUAGE PLPGSQL;


-- Podemos também declarar variáveis:
CREATE OR REPLACE FUNCTION buscar_ator(nome_ator text)
AS $$
	DECLARE
	id integer;
BEGIN

	RETURN QUERY SELECT * FROM ator WHERE nome like '%'||nome_ator||'%';

END;
$$ LANGUAGE PLSQL;


-- Exemplo Final da Aula:
CREATE TABLE Car(
	CarID INT,
	CarName VARCHAR(100)
);

INSERT INTO Car VALUES (101,'Mercedes-Benz');
INSERT INTO Car VALUES (201,'BMW');
INSERT INTO Car VALUES (301,'Ferrari');
INSERT INTO Car VALUES (401,'Lamborghini');
INSERT INTO Car VALUES (501,'Porsche');

SELECT * FROM Car;

CREATE TABLE CarDescription(
	CarID INT,
	CarDescription VARCHAR(800)
);
INSERT INTO CarDescription VALUES (101,'Luxury vehicle from the German automotive');
INSERT INTO CarDescription VALUES (201,'Luxury motorcycle from the German
automotive');
INSERT INTO CarDescription VALUES (301,'Luxury sports car from the Italian
manufacturer');
INSERT INTO CarDescription VALUES (401,'Luxury SUV from the Italian automotive');
INSERT INTO CarDescription VALUES (501,'High-performance sports car from the German
manufacturer');

SELECT * FROM CarDescription;



CREATE OR REPLACE FUNCTION GetCarDesc()
RETURNS TABLE (CarID int, CarName varchar(800), CarDescription varchar(800)) AS $$
BEGIN

	RETURN QUERY
	SELECT C.CarID, C.CarName, CD.CarDescription FROM Car C
	INNER JOIN CarDescription CD
	ON CD.CarID = C.CarID;

END
$$ LANGUAGE PLPGSQL;

SELECT * FROM GetCarDesc();








