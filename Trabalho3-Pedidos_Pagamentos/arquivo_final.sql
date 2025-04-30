EXERCICIO 0 -
CREATE TABLE usuario (
    idusuario   SERIAL PRIMARY KEY,
    nome        varchar(255),
    email       varchar(255),
    observacao  varchar(255),
    idnativo    bit
);

CREATE TABLE parceiro (
    idparceiro      SERIAL PRIMARY KEY,
    documento       varchar(10),
    nome            varchar(255),
    nomefantasia    varchar(255),
    observacao      varchar(255),
    idnativo        bit
);

CREATE TABLE telefone (
    idtelefone      SERIAL PRIMARY KEY,
    numero          varchar(13),
    idusuario       integer,
    idparceiro      integer,
    idnativo        bit,
    CONSTRAINT fkUsuario  FOREIGN KEY (idusuario)  REFERENCES usuario(idusuario),
    CONSTRAINT fkparceiro FOREIGN KEY (idparceiro) REFERENCES parceiro(idparceiro)
);

CREATE TABLE pais (
    idpais          SERIAL PRIMARY KEY,
    nome            varchar(100),
    sigla           varchar(10)
);

CREATE TABLE estado (
    idestado        SERIAL PRIMARY KEY,
    nome            varchar(100),
    sigla           varchar(10),
    idpais          integer,
    CONSTRAINT fkpais FOREIGN KEY (idpais) REFERENCES pais(idpais)
);

CREATE TABLE cidade (
    idcidade            SERIAL PRIMARY KEY,
    nome                varchar(100),
    inscricaoestadual   integer,
    idestado            integer,
    CONSTRAINT fkestado FOREIGN KEY (idestado) REFERENCES estado(idestado)
);

CREATE TABLE endereco (
    idendereco      SERIAL PRIMARY KEY,
    logradouro      varchar(255),
    numero          integer,
    cep             varchar(10),
    complemento     varchar(255),
    idparceiro      integer,
    idusuario       integer,
    idcidade        integer,
    idnativo        bit,
    CONSTRAINT fkparceiro FOREIGN KEY (idparceiro) REFERENCES parceiro(idparceiro),
    CONSTRAINT fkusuario  FOREIGN KEY (idusuario)  REFERENCES usuario(idusuario),
    CONSTRAINT fkcidade   FOREIGN KEY (idcidade)   REFERENCES cidade(idcidade)
);

CREATE TABLE produto (
    idproduto       SERIAL PRIMARY KEY,
    codigo          integer,
    descricao       varchar(255),
    observacao      varchar(255),
    peso            numeric(10, 2)
);

CREATE TABLE tabelapreco (
    idtabelapreco   SERIAL PRIMARY KEY,
    descricao       varchar(255),
    descontomaximo  numeric(10, 2),
    codigo          integer,
    iniciovigencia  date,
    fimvigencia     date,
    idnativo        bit
);

CREATE TABLE tabelaprecoproduto (
    idtabelaprecoproduto    SERIAL PRIMARY KEY,
    idtabelapreco           integer,
    idproduto               integer,
    preco                   numeric(10, 2),
    CONSTRAINT fktabelapreco FOREIGN KEY (idtabelapreco) REFERENCES tabelapreco(idtabelapreco),
    CONSTRAINT fkproduto     FOREIGN KEY (idproduto)    REFERENCES produto(idproduto)
);

CREATE TABLE condicaopagamento (
    idcondicaopagamento     SERIAL PRIMARY KEY,
    descricao               varchar(255),
    codigo                  integer,
    observacao              varchar(255)
);

CREATE TABLE pedido (
    idpedido                SERIAL PRIMARY KEY,
    numero                  integer,
    valortotal              numeric(10, 2),
    quantidadeprodutos      integer,
    observacao              varchar(255),
    idtabelapreco           integer,
    idcondicaopagamento     integer,
    idparceiro              integer,
    idusuario               integer,
    data                    TIMESTAMP,
    CONSTRAINT fktabelapreco FOREIGN KEY (idtabelapreco) REFERENCES tabelapreco(idtabelapreco),
    CONSTRAINT fkcondicaopagamento FOREIGN KEY (idcondicaopagamento) REFERENCES condicaopagamento(idcondicaopagamento),
    CONSTRAINT fkparceiro FOREIGN KEY (idparceiro) REFERENCES parceiro(idparceiro),
    CONSTRAINT fkusuario  FOREIGN KEY (idusuario)  REFERENCES usuario(idusuario)
);

CREATE TABLE pedidoproduto (
    idpedidoproduto SERIAL PRIMARY KEY,
    idpedido        integer,
    idproduto       integer,
    valor           numeric(10, 2),
    quantidade      integer,
    CONSTRAINT fkpedido  FOREIGN KEY (idpedido)  REFERENCES pedido(idpedido),
    CONSTRAINT fkproduto FOREIGN KEY (idproduto) REFERENCES produto(idproduto)
);

INSERT INTO usuario (nome, email, observacao, idnativo) VALUES
('João Silva', 'joao@email.com', 'Cliente frequente', B'1'),
('Maria Souza', 'maria@email.com', 'Novo cliente', B'1'),
('Carlos Mendes', 'carlos@email.com', 'Nenhuma observação', B'1'),
('Ana Lima', 'ana@email.com', 'Cliente VIP', B'1'),
('Paulo Gomes', 'paulo@email.com', 'Atrasos no pagamento', B'1'),
('Fernanda Costa', 'fernanda@email.com', 'Nenhuma observação', B'1'),
('Rafael Martins', 'rafael@email.com', 'Reclamações frequentes', B'1'),
('Camila Oliveira', 'camila@email.com', 'Cliente regular', B'1'),
('Rodrigo Santos', 'rodrigo@email.com', 'Solicitou orçamento', B'1'),
('Juliana Ribeiro', 'juliana@email.com', 'Nenhuma observação', B'1'),
('Marcos Almeida', 'marcos@email.com', 'Cliente antigo', B'1'),
('Beatriz Figueiredo', 'beatriz@email.com', 'Pagamento sempre adiantado', B'1'),
('Ricardo Pereira', 'ricardo@email.com', 'Solicitou segunda via', B'1'),
('Gabriela Rocha', 'gabriela@email.com', 'Atendimento prioritário', B'1'),
('Felipe Nunes', 'felipe@email.com', 'Nenhuma observação', B'1');

INSERT INTO parceiro (documento, nome, nomefantasia, observacao, idnativo) VALUES
('1234567890', 'Empresa A', 'Fantasia A', 'Parceiro confiável', B'1'),
('2345678901', 'Empresa B', 'Fantasia B', 'Atrasos eventuais', B'1'),
('3456789012', 'Empresa C', 'Fantasia C', 'Novo parceiro', B'1'),
('4567890123', 'Empresa D', 'Fantasia D', 'Descontos frequentes', B'1'),
('5678901234', 'Empresa E', 'Fantasia E', 'Nenhuma observação', B'1'),
('6789012345', 'Empresa F', 'Fantasia F', 'Reclamações de clientes', B'1'),
('7890123456', 'Empresa G', 'Fantasia G', 'Parceria antiga', B'1'),
('8901234567', 'Empresa H', 'Fantasia H', 'Expansão recente', B'1'),
('9012345678', 'Empresa I', 'Fantasia I', 'Revisão pendente', B'1'),
('0123456789', 'Empresa J', 'Fantasia J', 'Pagamento adiantado', B'1'),
('1122334455', 'Empresa K', 'Fantasia K', 'Nenhuma observação', B'1'),
('2233445566', 'Empresa L', 'Fantasia L', 'Bom histórico', B'1'),
('3344556677', 'Empresa M', 'Fantasia M', 'Nenhuma observação', B'1'),
('4455667788', 'Empresa N', 'Fantasia N', 'Possível parceria futura', B'1'),
('5566778899', 'Empresa O', 'Fantasia O', 'Clientes satisfeitos', B'1');

INSERT INTO telefone (numero, idusuario, idparceiro, idnativo) VALUES
('4199990001', 1, 1, B'1'),
('4199990002', 2, 2, B'1'),
('4199990003', 3, 1, B'1'),
('4199990004', 4, 2, B'1'),
('4199990005', 3, 5, B'1'),
('4199990006', 6, 3, B'1'),
('4199990007', 4, 7, B'1'),
('4199990008', 8, 4, B'1'),
('4199990009', 5, 9, B'1'),
('4199990010', 10, 5, B'1'),
('4199990011', 6, 11, B'1'),
('4199990012', 12, 6, B'1'),
('4199990013', 7, 13, B'1'),
('4199990014', 14, 7, B'1'),
('4199990015', 8, 15, B'1');

INSERT INTO pais (nome, sigla) VALUES
('Brasil', 'BR'),
('Argentina', 'AR'),
('Estados Unidos', 'US'),
('Alemanha', 'DE'),
('França', 'FR'),
('Itália', 'IT'),
('Japão', 'JP'),
('China', 'CN'),
('Canadá', 'CA'),
('México', 'MX'),
('Portugal', 'PT'),
('Espanha', 'ES'),
('Austrália', 'AU'),
('Índia', 'IN'),
('Reino Unido', 'GB');

INSERT INTO estado (nome, sigla, idpais) VALUES
('Paraná', 'PR', 1),
('São Paulo', 'SP', 1),
('Rio de Janeiro', 'RJ', 1),
('Minas Gerais', 'MG', 1),
('Rio Grande do Sul', 'RS', 1),
('Santa Catarina', 'SC', 1),
('Bahia', 'BA', 1),
('Pernambuco', 'PE', 1),
('Ceará', 'CE', 1),
('Goiás', 'GO', 1),
('Amazonas', 'AM', 1),
('Pará', 'PA', 1),
('Mato Grosso', 'MT', 1),
('Mato Grosso do Sul', 'MS', 1),
('Distrito Federal', 'DF', 1);

INSERT INTO cidade (nome, inscricaoestadual, idestado) VALUES
('Curitiba', 123456, 1),
('São Paulo', 223456, 2),
('Rio de Janeiro', 323456, 3),
('Belo Horizonte', 423456, 4),
('Porto Alegre', 523456, 5),
('Florianópolis', 623456, 6),
('Salvador', 723456, 7),
('Recife', 823456, 8),
('Fortaleza', 923456, 9),
('Goiânia', 1023456, 10),
('Manaus', 1123456, 11),
('Belém', 1223456, 12),
('Cuiabá', 1323456, 13),
('Campo Grande', 1423456, 14),
('Brasília', 1523456, 15);

INSERT INTO endereco (logradouro, numero, CEP, complemento, idcidade, idusuario, idparceiro, idnativo) VALUES
('Rua das Flores', 123,        '1231231231', 'Apto 201',  1,  1,  2,  B'1'),
('Av. Paulista', 456,          '1231231232', 'Sala 12',   2,  2,  1,  B'1'),
('Rua XV de Novembro', 789,    '1231231233', 'Casa',      3,  2,  3,  B'1'),
('Av. Brasil', 101,            '1231231234', 'Bloco B',   4,  4,  2,  B'1'),
('Rua Augusta', 202,           '1231231235', 'Sobrado',   5,  3,  5,  B'1'),
('Rua das Palmeiras', 303,     '1231231236', 'Loja 5',    6,  6,  3,  B'1'),
('Av. Rio Branco', 404,        '1231231237', 'Andar 2',   7,  4,  7,  B'1'),
('Rua das Acácias', 505,       '1231231238', 'Térreo',    8,  8,  4,  B'1'),
('Av. das Nações', 606,        '1231231239', 'Galpão',    9,  5,  9,  B'1'),
('Rua do Comércio', 707,       '1231231240', 'Sala 10',   10, 10, 5,  B'1'),
('Av. Independência', 808,     '1231231241', 'Fundos',    11, 6,  11, B'1'),
('Rua Santa Clara', 909,       '1231231242', 'Apto 45',   12, 12, 6,  B'1'),
('Rua Marechal Deodoro', 1010, '1231231243', 'Casa 2',    13, 7,  13, B'1'),
('Av. Paraná', 1111,           '1231231244', 'Bloco C',   14, 14, 7,  B'1'),
('Rua Bela Vista', 1212,       '1231231245', 'Cobertura', 15, 8,  15, B'1');


INSERT INTO produto (codigo, descricao, observacao, peso) VALUES
(1001, 'Café', 'Pacote de 500g', 0.5),
(1002, 'Açúcar', 'Pacote de 1kg', 1.0),
(1003, 'Arroz', 'Saco de 5kg', 5.0),
(1004, 'Feijão', 'Pacote de 1kg', 1.0),
(1005, 'Macarrão', 'Pacote de 500g', 0.5),
(1006, 'Óleo de soja', 'Garrafa de 900ml', 0.9),
(1007, 'Farinha de trigo', 'Pacote de 1kg', 1.0),
(1008, 'Leite', 'Caixa de 1L', 1.0),
(1009, 'Manteiga', 'Pote de 200g', 0.2),
(1010, 'Queijo', 'Peça de 500g', 0.5),
(1011, 'Presunto', 'Peça de 1kg', 1.0),
(1012, 'Pão', 'Pacote de 400g', 0.4),
(1013, 'Refrigerante', 'Garrafa de 2L', 2.0),
(1014, 'Suco', 'Caixa de 1L', 1.0),
(1015, 'Chocolate', 'Barra de 150g', 0.15);


INSERT INTO tabelapreco (descricao, descontomaximo, codigo, iniciovigencia, fimvigencia, idnativo) VALUES
('Preço A', 10.0, 1001, '2023-01-01', '2023-12-31', B'1'),
('PreçoB', 15.0, 1002, '2023-02-01', '2023-11-30', B'1'),
('Preço C', 20.0, 1003, '2023-03-01', '2023-10-31', B'1'),
('Preço D', 25.0, 1004, '2023-04-01', '2023-09-30', B'1'),
('Preço E', 30.0, 1005, '2023-05-01', '2023-08-31', B'1'),
('Preço F', 5.0, 1006, '2023-06-01', '2023-07-31', B'1'),
('Preço G', 12.0, 1007, '2023-07-01', '2023-06-30', B'1'),
('Preço H', 18.0, 1008, '2023-08-01', '2023-05-31', B'1'),
('Preço I', 22.0, 1009, '2023-09-01', '2023-04-30', B'1'),
('Preço J', 8.0, 1010, '2023-10-01', '2023-03-31', B'1'),
('Preço K', 14.0, 1011, '2023-11-01', '2023-02-28', B'1'),
('Preço L', 16.0, 1012, '2023-12-01', '2023-01-31', B'1'),
('Preço M', 9.0, 1013, '2023-01-15', '2023-12-15', B'1'),
('Preço N', 11.0, 1014, '2023-02-15', '2023-11-15', B'1'),
('Preço O', 13.0, 1015, '2023-03-15', '2023-10-15', B'1');


INSERT INTO tabelaprecoproduto (idtabelapreco, idproduto, preco) VALUES
(1, 1, 10.50),
(2, 2, 5.75),
(3, 3, 20.00),
(4, 4, 8.90),
(5, 5, 3.45),
(6, 6, 7.80),
(7, 7, 4.20),
(8, 8, 2.99),
(9, 9, 6.10),
(10, 10, 12.30),
(11, 11, 15.00),
(12, 12, 9.99),
(13, 13, 5.50),
(14, 14, 3.75),
(15, 15, 18.00);

INSERT INTO condicaopagamento (descricao, codigo, observacao) VALUES
('À vista',       2001, 'Pagamento imediato'),
('30 dias',       2002, 'Pagamento em 30 dias'),
('60 dias',       2003, 'Pagamento em 60 dias'),
('90 dias',       2004, 'Pagamento em 90 dias'),
('120 dias',      2005, 'Pagamento em 120 dias'),
('Parcelado 2x',  2006, 'Parcelado em 2 vezes'),
('Parcelado 3x',  2007, 'Parcelado em 3 vezes'),
('Parcelado 4x',  2008, 'Parcelado em 4 vezes'),
('Parcelado 5x',  2009, 'Parcelado em 5 vezes'),
('Parcelado 6x',  2010, 'Parcelado em 6 vezes'),
('Parcelado 7x',  2011, 'Parcelado em 7 vezes'),
('Parcelado 8x',  2012, 'Parcelado em 8 vezes'),
('Parcelado 9x',  2013, 'Parcelado em 9 vezes'),
('Parcelado 10x', 2014, 'Parcelado em 10 vezes'),
('Parcelado 12x', 2015, 'Parcelado em 12 vezes');


INSERT INTO pedido (numero, valortotal, quantidadeprodutos, observacao, idtabelapreco, idcondicaopagamento, idparceiro, idusuario, data) VALUES
(10001, 150.00, 3, 'Pedido urgente', 1, 1, 1, 1, '2023-10-01 10:00:00'),
(10002, 200.00, 5, 'Pedido normal', 2, 2, 2, 2, '2023-10-02 11:00:00'),
(10003, 300.00, 7, 'Pedido com desconto', 3, 3, 3, 3, '2023-10-03 12:00:00'),
(10004, 250.00, 4, 'Pedido especial', 4, 4, 4, 4, '2023-10-04 13:00:00'),
(10005, 100.00, 2, 'Pedido pequeno', 5, 5, 5, 5, '2023-10-05 14:00:00'),
(10006, 350.00, 6, 'Pedido grande', 6, 6, 6, 6, '2023-10-06 15:00:00'),
(10007, 400.00, 8, 'Pedido com prioridade', 7, 7, 7, 7, '2023-10-07 16:00:00'),
(10008, 450.00, 9, 'Pedido com frete grátis', 8, 8, 8, 8, '2023-10-08 17:00:00'),
(10009, 500.00, 10, 'Pedido com brinde', 9, 9, 9, 9, '2023-10-09 18:00:00'),
(10010, 550.00, 11, 'Pedido com desconto especial', 10, 10, 10, 10, '2023-10-10 19:00:00'),
(10011, 600.00, 12, 'Pedido com pagamento adiantado', 11, 11, 11, 11, '2023-10-11 20:00:00'),
(10012, 650.00, 13, 'Pedido com entrega rápida', 12, 12, 12, 12, '2023-10-12 21:00:00'),
(10013, 700.00, 14, 'Pedido com garantia estendida', 13, 13, 13, 13, '2023-10-13 22:00:00'),
(10014, 750.00, 15, 'Pedido com desconto progressivo', 14, 14, 14, 14, '2023-10-14 23:00:00'),
(10015, 800.00, 16, 'Pedido com pagamento parcelado', 15, 15, 15, 15, '2023-10-15 00:00:00');


INSERT INTO pedidoproduto (idpedido, idproduto, valor, quantidade) VALUES
(1, 1, 10.50, 1),
(1, 2, 5.75, 2),
(2, 3, 20.00, 3),
(2, 4, 8.90, 2),
(3, 5, 3.45, 4),
(3, 6, 7.80, 3),
(4, 7, 4.20, 5),
(4, 8, 2.99, 4),
(5, 9, 6.10, 6),
(5, 10, 12.30, 5),
(6, 11, 15.00, 7),
(6, 12, 9.99, 6),
(7, 13, 5.50, 8),
(7, 14, 3.75, 7),
(8, 15, 18.00, 9);



EXERCICIO 1 -
SELECT PA.nome, PE.numero FROM parceiro PA
INNER JOIN pedido PE
ON PE.idparceiro = PA.idparceiro;



EXERCICIO 2 - 
SELECT PR.nome, C.nome, E.sigla, P.nome FROM parceiro PR
INNER JOIN endereco EN
ON PR.idparceiro = EN.idparceiro
INNER JOIN cidade C
ON EN.idcidade = C.idcidade
INNER JOIN estado E
ON C.idestado = E.idestado
INNER JOIN pais P
ON E.idpais = P.idpais;



EXERCICIO 3 - 
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



EXERCICIO 4 - 
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




EXERCICIO 5 -
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




EXRCICIO 6 - 
CREATE TABLE times_2023 (nome VARCHAR(50));
CREATE TABLE equipes_2018 (nome VARCHAR(50));

INSERT INTO times_2023 (nome) VALUES 
('Alfa Romeo'), ('Aston Martin'), ('Alpha Tauri'), ('Renault'), ('Ferrari'), 
('Haas'), ('McLaren'), ('Mercedes'), ('Red Bull'), ('Williams');

INSERT INTO equipes_2018 (nome) VALUES 
('Ferrari'), ('Force India'), ('Racing Point'), ('Haas'), ('McLaren'), 
('Mercedes'), ('Aston Martin'), ('Renault'), ('Sauber'), ('Red Bull'), ('Williams');

SELECT T23.nome, E18.nome
FROM times_2023 T23
INNER JOIN equipes_2018 E18 ON T23.nome = E18.nome;

SELECT T23.nome, E18.nome
FROM times_2023 T23
LEFT JOIN equipes_2018 E18 ON T23.nome = E18.nome;

SELECT T23.nome, E18.nome
FROM times_2023 T23
RIGHT JOIN equipes_2018 E18 ON T23.nome = E18.nome;

SELECT T23.nome, E18.nome
FROM times_2023 T23
FULL OUTER JOIN equipes_2018 E18 ON T23.nome = E18.nome;

SELECT T23.nome, E18.nome
FROM times_2023 T23
CROSS JOIN equipes_2018 E18;



EXERCICIO 7 -
SELECT PE.numero, PR.descricao, PR.codigo, TPP.preco, TP.descricao, TP.iniciovigencia, TP.fimvigencia, TP.idnativo, PE.observacao
FROM pedido PE
INNER JOIN 
	tabelapreco TP ON TP.idtabelapreco = PE.idtabelapreco
INNER JOIN
	tabelaprecoproduto TPP ON TPP.idtabelapreco = TP.idtabelapreco
INNER JOIN
	produto PR ON PR.idproduto = TPP.idproduto



EXERCICIO 8 -
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



EXERCICIO 9 -
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



EXERCICIO 10 -
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