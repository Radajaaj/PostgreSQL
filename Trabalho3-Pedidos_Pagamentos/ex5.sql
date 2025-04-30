SELECT PE.numero, PE.quantidadeprodutos, TP.descricao, CP.descricao, PC.nome, US.nome, CI.nome, ES.sigla, PA.nome, TU.numero, TPC.numero
FROM pedido PE
INNER JOIN 
	tabelapreco TP ON TP.idtabelapreco = PE.idtabelapreco
INNER JOIN
	condicaopagamento CP ON CP.idcondicaopagamento = PE.idcondicaopagamento
INNER JOIN
	parceiro PC ON PC.idparceiro = PE.idparceiro
INNER JOIN 
	usuario US ON US.idusuario = PE.idusuario
INNER JOIN 
	endereco EN ON EN.idparceiro = PC.idparceiro
INNER JOIN
	cidade CI ON CI.idcidade = EN.idcidade
INNER JOIN
	estado ES ON ES.idestado = CI.idestado
INNER JOIN
	pais PA ON PA.idpais = ES.idpais
INNER JOIN
	telefone TU ON TU.idusuario = US.idusuario
INNER JOIN
	telefone TPC ON TPC.idparceiro = PC.idparceiro