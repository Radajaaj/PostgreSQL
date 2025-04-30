CREATE TABLE editora (
    editora_id SERIAL PRIMARY KEY,
    nome_editora VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    cnpj VARCHAR(14) UNIQUE NOT NULL
);

CREATE TABLE sexo (
    sexo_id SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE autor (
    autor_id SERIAL PRIMARY KEY,
    autor_nome VARCHAR(255) NOT NULL,
    autor_nascimento DATE NOT NULL,
    sexo_id INT NOT NULL,
    FOREIGN KEY (sexo_id) REFERENCES sexo(sexo_id)
);

CREATE TABLE titulo (
    isbn SERIAL PRIMARY KEY,
    nome_titulo VARCHAR(255) NOT NULL,
    ano_publicacao INT NOT NULL,
    descricao VARCHAR(255),
    palavras_chaves VARCHAR(255) NOT NULL,
    quantodade_exemplares INT NOT NULL,
    editora_id INT,
    FOREIGN KEY (editora_id) REFERENCES editora(editora_id)
);

CREATE TABLE usuario (
    usuario_id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    rg VARCHAR(10),
    cpf VARCHAR(11) UNIQUE,
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);

CREATE TABLE emprestimo (
    emprestimo_id SERIAL PRIMARY KEY,
    titulo_id INT NOT NULL,
    usuario_id INT NOT NULL,
    data_saida DATE NOT NULL,
    data_retorno DATE,
    FOREIGN KEY (titulo_id) REFERENCES titulo(isbn),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

CREATE TABLE autor_titulo (
    autor_titulo_id SERIAL PRIMARY KEY,
    isbn INT NOT NULL,
    autor_id INT NOT NULL,
    FOREIGN KEY (isbn) REFERENCES titulo(isbn),
    FOREIGN KEY (autor_id) REFERENCES Autor(autor_id)
);

INSERT INTO sexo (descricao) VALUES  
('Feminino'),
('Masculino'),
('Outro'),
('Não Binário'),
('Feminino'),
('Masculino'),
('Não Binário'),
('Outro'),
('Masculino'),
('Feminino'),
('Não Binário'),
('Prefiro não informar'),
('Masculino'),
('Feminino'),
('Prefiro não informar');

INSERT INTO Autor (autor_nome, autor_nascimento, sexo_id) VALUES 
('Tite', '1961-05-25', 1),
('Pia Sundhage', '1960-02-13', 2),
('Jorge Jesus', '1954-07-24', 1),
('Patricia Guzmán', '1975-11-30', 2),
('Fernando Diniz', '1974-03-27', 1),
('Sylvinho', '1974-04-12', 1),
('Renato Gaúcho', '1962-09-09', 1),
('Bev Priestman', '1986-04-29', 2),
('Abel Ferreira', '1978-12-22', 1),
('Emily Lima', '1980-09-29', 2),
('Luiz Felipe Scolari', '1948-11-09', 1),
('Jill Ellis', '1966-09-06', 2),
('Zé Roberto Guimarães', '1954-08-31', 1),
('Sarina Wiegman', '1969-10-26', 2),
('Marcelo Bielsa', '1955-07-21', 1);


INSERT INTO editora (nome_editora, endereco, telefone, cnpj) VALUES 
('Editora A', 'Rua das Acácias, 456 - São Paulo, SP', '(11) 98765-1234', '78965432000198'),
('Editora B', 'Av. Boa Vista, 12 - Rio de Janeiro, RJ', '(21) 96654-4321', '65498765000132'),
('Editora C', 'Rua da Liberdade, 101 - Belo Horizonte, MG', '(31) 95678-2345', '32165489000176'),
('Editora D', 'Av. Amazonas, 700 - Curitiba, PR', '(41) 93215-6789', '45678901000123'),
('Editora E', 'Rua das Flores, 300 - São Paulo, SP', '(11) 93123-0987', '12345678000121'),
('Editora F', 'Praça da Sé, 555 - Porto Alegre, RS', '(51) 95421-6789', '65432100000132'),
('Editora G', 'Rua João Pessoa, 400 - Goiânia, GO', '(62) 91123-4567', '32109876543210'),
('Editora H', 'Av. Brasil, 800 - Salvador, BA', '(71) 93678-1234', '56789012345678'),
('Editora I', 'Rua Paraguassu, 200 - Manaus, AM', '(92) 91234-5678', '76543210000143'),
('Editora J', 'Rua Rio Branco, 123 - Recife, PE', '(81) 92345-6789', '21098765432101'),
('Editora K', 'Praça XV de Novembro, 987 - Brasília, DF', '(61) 93123-7890', '54321098765432'),
('Editora L', 'Rua Dom Pedro II, 111 - Florianópolis, SC', '(48) 92234-5678', '87654321000121'),
('Editora M', 'Rua do Sol, 333 - Fortaleza, CE', '(85) 93456-9876', '10987654321012'),
('Editora N', 'Rua das Palmeiras, 222 - Vitória, ES', '(27) 93876-5432', '43210987654321'),
('Editora X', 'Praça da Liberdade, 66 - São Paulo, SP', '(11) 95678-1234', '09876543210987');

INSERT INTO titulo (nome_titulo, ano_publicacao, descricao, palavras_chaves, quantidades_exemplares, editora_id) VALUES
('Desenvolvimento Web', 2022, 'Conceitos fundamentais sobre desenvolvimento de sites e aplicativos.', 'web, programação, front-end', 12, 1),
('Sistemas Operacionais', 2019, 'Estudo de sistemas operacionais modernos e seus recursos.', 'sistemas operacionais, tecnologia, sistemas', 10, 2),
('Algoritmos e Estruturas de Dados', 2021, 'Introdução aos conceitos de algoritmos e estruturas de dados.', 'algoritmos, dados, tecnologia', 15, 3),
('Cálculo I', 2018, 'Teoria e práticas sobre cálculo diferencial e integral.', 'cálculo, matemática, diferencial', 8, 4),
('Engenharia de Requisitos', 2020, 'Estudo das metodologias de levantamento e gestão de requisitos.', 'engenharia, requisitos, software', 11, 5),
('Inteligência Artificial', 2023, 'Estudo das principais técnicas de IA e suas aplicações.', 'IA, inteligência artificial, aprendizado de máquina', 13, 6),
('Geografia do Brasil', 2020, 'Um estudo sobre a geografia brasileira e suas regiões.', 'geografia, Brasil, estudo', 18, 7),
('Literatura Brasileira', 2021, 'Estudo e análise das principais obras literárias brasileiras.', 'literatura, Brasil, análise', 5, 2),
('Eletromagnetismo', 2019, 'Estudo dos princípios de eletromagnetismo e suas aplicações.', 'eletromagnetismo, física, ciência', 9, 3),
('Bioquímica', 2018, 'Estudo das reações químicas e processos biológicos.', 'bioquímica, biologia, química', 7, 4),
('Gastronomia Internacional', 2022, 'Cozinha internacional com foco nas principais culinárias mundiais.', 'gastronomia, internacional, receitas', 10, 7),
('Publicidade e Propaganda', 2023, 'Técnicas e práticas de publicidade e propaganda no mercado atual.', 'publicidade, propaganda, marketing', 6, 5),
('Filosofia Contemporânea', 2017, 'Análise das correntes filosóficas contemporâneas.', 'filosofia, contemporânea, estudo', 8, 6),
('Direito Penal', 2022, 'Estudo dos fundamentos do direito penal brasileiro.', 'direito penal, legislação, justiça', 14, 8),
('Fotografia Digital', 2020, 'Introdução à fotografia digital e técnicas de captura.', 'fotografia, digital, técnica', 4, 9);

INSERT INTO autor_titulo (isbn, autor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

INSERT INTO usuario (nome, rg, cpf, endereco, telefone) VALUES
('Neymar Jr.', '1234567890', '10111213141', 'Rua Futebol, 10, São Paulo', '11987654321'),
('Cristiano Ronaldo', '2345678901', '12131415161', 'Av. Gol, 7, Rio de Janeiro', '21987654322'),
('Lionel Messi', '3456789012', '13141516171', 'Rua Camp Nou, 30, Belo Horizonte', '31987654323'),
('Marta Silva', '4567890123', '14151617181', 'Av. Goleira, 11, Porto Alegre', '51987654324'),
('Gabriel Jesus', '5678901234', '15161718191', 'Rua Esperança, 9, Curitiba', '61987654325'),
('Megan Rapinoe', '6789012345', '16171819201', 'Rua Campeã, 6, Campinas', '71987654326'),
('Vinícius Júnior', '7890123456', '17181920211', 'Rua Velocidade, 20, Recife', '81987654327'),
('Alex Morgan', '8901234567', '18192021222', 'Rua Força, 8, Salvador', '91987654328'),
('Kylian Mbappé', '9012345678', '19202122233', 'Av. Rápida, 7, Fortaleza', '92987654329'),
('Zlatan Ibrahimović', '0123456789', '20212223244', 'Rua Dominante, 5, Florianópolis', '93987654330'),
('Erling Haaland', '2233445566', '21222324355', 'Av. Impacto, 9, São Luís', '94987654331'),
('Ada Hegerberg', '4455667788', '22232425366', 'Rua Troféu, 12, Goiânia', '95987654332'),
('Alisson Becker', '6677889900', '23242526377', 'Av. Defesa, 1, Maceió', '96987654333'),
('Thiago Silva', '8899001122', '24252627388', 'Rua Capitão, 3, Natal', '97987654334'),
('Formiga Santos', '9900112233', '25262728399', 'Av. Eterna, 15, Vitória', '98987654335');


INSERT INTO emprestimo (titulo_id, usuario_id, data_saida, data_retorno) VALUES
(1, 1, '2024-12-01', '2024-12-15'),
(2, 2, '2024-12-02', '2024-12-16'),
(3, 3, '2024-12-03', '2024-12-17'),
(4, 4, '2024-12-04', '2024-12-18'),
(5, 5, '2024-12-05', '2024-12-19'),
(6, 6, '2024-12-06', '2024-12-20'),
(7, 7, '2024-12-07', '2024-12-21'),
(8, 8, '2024-12-08', '2024-12-22'),
(9, 9, '2024-12-09', '2024-12-23'),
(10, 10, '2024-12-10', '2024-12-24'),
(11, 11, '2024-12-11', '2024-12-25'),
(12, 12, '2024-12-12', '2024-12-26'),
(13, 13, '2024-12-13', '2024-12-27'),
(14, 14, '2024-12-14', '2024-12-28'),
(15, 15, '2024-12-15', '2024-12-29');


UPDATE Autor
SET autor_nascimento = '1933-03-03'
where sexo_id in (
    select sexo_id
    from sexo
    where descricao = 'Masculino'
);

DELETE FROM titulo
where editora_id = (
    select editora_id 
    from editora 
    where nome_editora = 'X'
);