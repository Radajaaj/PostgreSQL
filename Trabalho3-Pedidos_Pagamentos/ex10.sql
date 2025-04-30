SELECT * 
FROM pedido 
FULL OUTER JOIN condicaopagamento CP ON CP.idcondicaopagamento = pedido.idcondicaopagamento
FULL OUTER JOIN tabelapreco TP ON TP.idtabelapreco = pedido.idtabelapreco
FULL OUTER JOIN tabelaprecoproduto TPP ON TP.idtabelapreco = TPP.idtabelapreco
FULL OUTER JOIN produto PR ON PR.idproduto = TPP.idproduto
FULL OUTER JOIN pedidoproduto PP ON PP.idpedido = pedido.idpedido
FULL OUTER JOIN parceiro ON parceiro.idparceiro = pedido.idparceiro
FULL OUTER JOIN usuario ON usuario.idusuario = pedido.idusuario
FULL OUTER JOIN telefone ON telefone.idusuario = usuario.idusuario
FULL OUTER JOIN endereco ON endereco.idparceiro = parceiro.idparceiro
FULL OUTER JOIN cidade ON endereco.idcidade = cidade.idcidade
FULL OUTER JOIN estado ON estado.idestado = cidade.idestado
FULL OUTER JOIN pais ON pais.idpais = estado.idpais;