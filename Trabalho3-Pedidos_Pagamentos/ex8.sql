SELECT PC.nome, SUM(PD.valortotal)
FROM pedido PD
INNER JOIN 
	parceiro PC ON PC.idparceiro = PD.idparceiro
GROUP BY 
	PC.nome;


SELECT US.nome, SUM(PD.valortotal)
FROM pedido PD
INNER JOIN 
	usuario US ON US.idusuario = PD.idusuario
GROUP BY 
	US.nome;