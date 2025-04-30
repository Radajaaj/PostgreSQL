SELECT 
    u.idusuario,
    u.nome,
    u.email,
    u.observacao,
    u.idnativo,
    t.numero AS telefone,
    en.logradouro,
    en.numero AS numero_endereco,
    en.cep,
    en.complemento,
    ci.nome AS cidade,
    es.sigla AS estado,
    pa.nome AS pais
FROM 
    usuario u
LEFT JOIN 
    telefone t ON u.idusuario = t.idusuario
LEFT JOIN 
    endereco en ON u.idusuario = en.idusuario
LEFT JOIN 
    cidade ci ON en.idcidade = ci.idcidade
LEFT JOIN 
    estado es ON ci.idestado = es.idestado
LEFT JOIN 
    pais pa ON es.idpais = pa.idpais;