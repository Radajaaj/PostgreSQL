SELECT PR.nome, C.nome, E.sigla, P.nome FROM parceiro PR
INNER JOIN endereco EN
ON PR.idparceiro = EN.idparceiro
INNER JOIN cidade C
ON EN.idcidade = C.idcidade
INNER JOIN estado E
ON C.idestado = E.idestado
INNER JOIN pais P
ON E.idpais = P.idpais;