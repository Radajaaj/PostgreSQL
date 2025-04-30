--delete from filme_ator
--delete from filme
--delete from ator

CREATE OR REPLACE FUNCTION ATORES_FILMES_CACHES_(ID_ATOR integer)
RETURNS TABLE (NOME TEXT, FILME TEXT, CACHE_ INTEGER)
AS
$$
BEGIN
RETURN QUERY
SELECT A.NOME, F.NOME, C.CACHE AS CACHE_ FROM ATOR A
INNER JOIN FILME_ATOR FA ON A.IDATOR=FA.IDATOR
INNER JOIN FILME F ON F.IDFILME=FA.IDFILME
INNER JOIN ATOR_CACHE C ON A.IDATOR=C.IDATOR
WHERE A.IDATOR=ID_ATOR ORDER BY F.NOME ASC;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION Renomear_ATOR_nome(matricula integer, nome_novo text)
RETURNS void AS
$$
BEGIN
UPDATE ATOR
set NOME = nome_novo
where IDATOR = matricula;
END;
$$
LANGUAGE PLPGSQL;


SELECT * FROM Renomear_ATOR_nome(3, 'Analdo Xuasneguer');


SELECT * FROM ATOR;


SELECT * FROM ATORES_FILMES_CACHES_(1)



CREATE OR REPLACE FUNCTION buscar_ator(nome_ator text)
RETURNS SETOF ator
AS $$
DECLARE
idator integer;
BEGIN
RETURN QUERY SELECT * FROM ATOR WHERE nome like '%'||nome_ator||'%';
END;
$$
LANGUAGE PLPGSQL;


SELECT * FROM buscar_ator('Analdo Xuasneguer');



CREATE TABLE Car(
	CarID	int,
	CarName varchar(100)
);

INSERT INTO Car VALUES (101, 'Mercedes-Benz');
INSERT INTO Car VALUES (201, 'BMW');
INSERT INTO Car VALUES (301, 'Ferrari');
INSERT INTO Car VALUES (401, 'Lamborghini');
INSERT INTO Car VALUES (501, 'Porsche');

SELECT * FROM Car;

CREATE TABLE CarDescription(
	CarID			INT,
	CarDescription	VARCHAR(800)
);

INSERT INTO CarDescription VALUES (101, 'Luxury vehicle from the german automotive');
INSERT INTO CarDescription VALUES (201, 'Luxury motorcycle from the german automotive');
INSERT INTO CarDescription VALUES (301, 'Luxury sportscar from the italian manufacturer');
INSERT INTO CarDescription VALUES (401, 'Luxury SUV from the italian automotive');
INSERT INTO CarDescription VALUES (501, 'Hig-performance sports car from the german manufacturer');

SELECT * FROM CarDescription;



CREATE OR REPLACE FUNCTION GetCarDesc()
RETURNS TABLE (CarID INT, CarName VARCHAR(100), CarDescription VARCHAR(800)) 
AS $$
BEGIN
	RETURN QUERY
	SELECT C.CarID, C.CarName, CD.CarDescription
	FROM Car C
	INNER JOIN CarDescription CD ON C.CarID=CD.CarID;
END;
$$ LANGUAGE plpgsql;


SELECT GetCarDesc();









