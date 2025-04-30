SELECT PA.idparceiro, PA.nome, PA.documento, PA.nomefantasia, PA.observacao, PA.idnativo, T.numero, EN.logradouro, EN.cep, EN.numero, EN.complemento, C.nome, ES.sigla, P.nome
FROM parceiro PA
INNER JOIN 
	telefone T ON T.idparceiro = PA.idparceiro
INNER JOIN 
	endereco EN ON EN.idparceiro = PA.idparceiro
INNER JOIN 
	cidade C ON EN.idcidade = C.idcidade
INNER JOIN
	estado ES ON ES.idestado = C.idestado
INNER JOIN
	pais P ON ES.idpais = P.idpais