SELECT PA.nome, PE.numero FROM parceiro PA
INNER JOIN pedido PE
ON PE.idparceiro = PA.idparceiro;