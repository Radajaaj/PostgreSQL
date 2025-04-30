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