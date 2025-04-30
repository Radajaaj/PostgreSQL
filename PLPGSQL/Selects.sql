10 – Faça um full outer join em todas as tabelas.

SELECT * FROM pedido;
SELECT * FROM parceiro;
SELECT * FROM condicaopagamento;


SELECT * 
FROM pedido 
FULL OUTER JOIN condicaopagamento CP ON CP.idcondicaopagamento = pedido.idcondicaopagamento
FULL OUTER JOIN tabelapreco TP ON TP.idtabelapreco = pedido.idtabelapreco
FULL OUTER JOIN tabelaprecoproduto TPP ON TP.idtabelapreco = TPP.idtabelapreco
FULL OUTER JOIN produto PR ON PR.idproduto = TPP.idproduto
FULL OUTER JOIN pedidoproduto PP ON PP.idpedido = pedido.idpedido
FULL OUTER JOIN parceiro ON parceiro.idparceiro = pedido.idparceiro
FULL OUTER JOIN usuario ON usuario.idusuario = pedido.idusuario
FULL OUTER JOIN telefone T1 ON T1.idusuario = usuario.idusuario
FULL OUTER JOIN telefone T2 ON T2.idparceiro = parceiro.idparceiro
FULL OUTER JOIN endereco E1 ON E1.idusuario = usuario.idusuario
FULL OUTER JOIN endereco E2 ON E2.idparceiro = parceiro.idparceiro
FULL OUTER JOIN cidade ON E1.idcidade = cidade.idcidade
FULL OUTER JOIN cidade ON E2.idcidade = cidade.idcidade
FULL OUTER JOIN estado ON estado.idestado = cidade.idestado
FULL OUTER JOIN pais ON pais.idpais = estado.idpais;