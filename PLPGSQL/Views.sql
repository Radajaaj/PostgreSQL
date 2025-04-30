-- Sintaxe das views:
CREATE OR REPLACE VIEW media_cursos AS
SELECT D.nom_disc, AVG(H.media) from disciplinas D 
INNER JOIN historicos_escolares H
ON D.cod_disc = H.cod_disc
GROUP BY D.nom_disc