SELECT PE.numero, PC.nome, 'Parceiro inativo'
FROM pedido PE
INNER JOIN 
	parceiro PC ON PC.idparceiro = PE.idparceiro
WHERE PC.idnativo = B'0'
UNION ALL
SELECT PE.numero, PC.nome, 'Parceiro ativo'
FROM pedido PE
INNER JOIN 
	parceiro PC ON PC.idparceiro = PE.idparceiro
WHERE PC.idnativo = B'1';