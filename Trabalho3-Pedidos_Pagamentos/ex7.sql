SELECT PE.numero, PR.descricao, PR.codigo, TPP.preco, TP.descricao, TP.iniciovigencia, TP.fimvigencia, TP.idnativo, PE.observacao
FROM pedido PE
INNER JOIN 
	tabelapreco TP ON TP.idtabelapreco = PE.idtabelapreco
INNER JOIN
	tabelaprecoproduto TPP ON TPP.idtabelapreco = TP.idtabelapreco
INNER JOIN
	produto PR ON PR.idproduto = TPP.idproduto