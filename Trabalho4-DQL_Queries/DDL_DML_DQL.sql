CREATE TABLE Pessoa (
	id_pessoa 		SERIAL PRIMARY KEY,
	tipo			varchar(50),
	nome_ficticio	varchar(200),
	nome_real		varchar(200),
	poder			integer,
	poderes			varchar(300),
	gênero			varchar(50),
	peso			float,
	altura			float,
	idade			integer,
	naturalidade	varchar(200)
);


CREATE TABLE Cidade (
	id_cidade		SERIAL PRIMARY KEY,
	nome			varchar(150),
	estado			varchar(150),
	país			varchar(150),
	pib				integer,
	idh				float,
	população		integer,
	área			float,
	altitude		float,
	prefeito		varchar(127)
);


CREATE TABLE Oponentes (
	id_oponentes	SERIAL PRIMARY KEY,
	id_pessoa1	integer,
	id_pessoa2	integer,
	CONSTRAINT fkoponente1 FOREIGN KEY (id_pessoa1) REFERENCES pessoa(id_pessoa),
	CONSTRAINT fkoponente2 FOREIGN KEY (id_pessoa2) REFERENCES pessoa(id_pessoa)
);


CREATE TABLE Cidade_Defensor (
	id_cidade_defensor	SERIAL PRIMARY KEY,
	id_cidade			integer,
	id_pessoa		integer,
	CONSTRAINT fkCidade_Defensor FOREIGN KEY (id_cidade) REFERENCES Cidade(id_cidade),
	CONSTRAINT fkDefensor_Cidade FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
);


CREATE TABLE Batalha(
	id_batalha		SERIAL PRIMARY KEY,
	id_cidade		integer,
	nome			varchar(200),
	data_inicio		date,
	data_fim		date,
	fatalidades		integer,
	tipo_batalha	varchar(100),
	consequencias	varchar(200),
	dano_material	float,
	status_batalha 	varchar(50),
	duração			interval,
	localização		varchar(100),
	CONSTRAINT fkCidade_Batalha FOREIGN KEY (id_cidade) REFERENCES Cidade(id_cidade)
);


CREATE TABLE Batalha_Heroi(
	id_batalha_heroi	SERIAL PRIMARY KEY,
	id_batalha			integer,
	id_pessoa		integer,
	CONSTRAINT fkbatalha FOREIGN KEY (id_batalha) REFERENCES Batalha(id_batalha),
	CONSTRAINT fkpessoa   FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);


CREATE TABLE Batalha_Vilao(
	id_batalha_vilao	SERIAL PRIMARY KEY,
	id_batalha			integer,
	id_pessoa			integer,
	CONSTRAINT fkBatalha FOREIGN KEY (id_batalha) REFERENCES Batalha(id_batalha),
	CONSTRAINT fkpessoa   FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa)
);


CREATE TABLE Frase (
	id_frase		SERIAL PRIMARY KEY,
	id_pessoa		integer,
	frases			varchar(255),
	CONSTRAINT fkpessoa FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa)
);


INSERT INTO Pessoa (tipo, nome_ficticio, nome_real, poder, poderes, gênero, peso, altura, idade, naturalidade)
VALUES
('herói', 'Superman', 'Clark Kent', 10000, 'Força, Voo', 'Masculino', 95.5, 1.85, 35, 'EUA'),
('herói', 'Goku', 'Kakarot', 12000, 'Força, Ki, Voo', 'Masculino', 62.0, 1.75, 45, 'Planeta Vegeta'),
('herói', 'Batman', 'Bruce Wayne', 8000, 'Intelecto, Combate', 'Masculino', 85.0, 1.88, 34, 'Gotham'),
('herói', 'Homem de Ferro', 'Tony Stark', 8500, 'Tecnologia, Intelecto', 'Masculino', 85.0, 1.85, 40, 'EUA'),
('herói', 'Capitão América', 'Steve Rogers', 7000, 'Força, Luta', 'Masculino', 85.0, 1.90, 40, 'EUA'),
('herói', 'Thor', 'Thor Odinson', 13000, 'Força, Relâmpago, Voo', 'Masculino', 100.0, 1.98, 1500, 'Asgard');
('vilão', 'Coringa', 'Coringa', 5000, 'Inteligência, Caos', 'Masculino', 70.0, 1.75, 40, 'Gotham'),
('vilão', 'Vegeta', 'Príncipe Vegeta IV', 8000, 'Força, Ki', 'Masculino', 75.0, 1.70, 35, 'Planeta Vegeta'),
('vilão', 'Lex Luthor', 'Alexander Luthor', 9500, 'Intelecto, Estratégia', 'Masculino', 80.0, 1.85, 45, 'EUA'),
('vilão', 'Thanos', 'Thanos', 15000, 'Força, Poder cósmico', 'Masculino', 120.0, 2.00, 50, 'Titã'),
('vilão', 'Duende Verde', 'Norman Osborn', 6000, 'Tecnologia, Psicose', 'Masculino', 85.0, 1.80, 50, 'EUA'),
('vilão', 'Magneto', 'Erik Lehnsherr', 9500, 'Controle do magnetismo', 'Masculino', 90.0, 1.82, 60, 'Alemanha');


INSERT INTO Cidade (nome, estado, país, pib, idh, população, área, altitude, prefeito)
VALUES
('Gotham City', 'Nova York', 'EUA', 50000000, 0.85, 2500000, 600.0, 50.0, 'James Gordon'),
('Metrópolis', 'Metrópolis', 'EUA', 100000000, 0.92, 3500000, 800.0, 100.0, 'Amanda Waller'),
('Asgard', 'Asgard', 'Asgardiano', 200000000, 1.00, 500000, 1500.0, 500.0, 'Odin'),
('Xique-Xique', 'Bahia', 'Brasil', 15000000, 0.75, 50000, 1000.0, 400.0, 'Jair Bolsonaro'),
('Nova York', 'Nova York', 'EUA', 1500000000, 0.95, 8500000, 789.0, 10.0, 'Barack Obama'),
('Wakanda', 'Wakanda', 'Wakanda', 150000000, 1.00, 2000000, 500.0, 1000.0, 'Shuri'),
('Central City', 'New York', 'EUA', 45000000, 0.88, 700000, 300.0, 20.0, 'Sylvester Stallone'),
('Star City', 'Star', 'EUA', 35000000, 0.90, 1200000, 400.0, 40.0, 'Oliver Queen'),
('Krypton', 'Krypton', 'Kryptoniano', 80000000, 0.98, 3000000, 2000.0, 1500.0, 'Jor-El'),
('Vormir', 'Vormir', 'Vormir', 0, 0.0, 0, 1000.0, 300.0, 'Thanos');


INSERT INTO Oponentes (id_pessoa1, id_pessoa2)
VALUES
(1, 10),
(2, 8),
(3, 7),
(4, 9),
(5, 11),
(6, 8),
(1, 7),
(2, 10),
(3, 8),
(4, 11);


INSERT INTO Cidade_Defensor (id_cidade, id_pessoa)
VALUES
(1, 1), 
(2, 2), 
(3, 6), 
(4, 3), 
(5, 4), 
(6, 5), 
(7, 1), 
(8, 4), 
(9, 6), 
(10, 7);


INSERT INTO Batalha (id_cidade, nome, data_inicio, data_fim, fatalidades, tipo_batalha, consequencias, dano_material, status_batalha, duração, localização)
VALUES
(1, 'Revolta do Coringa', '2025-01-01', '2025-01-02', 10, 'Combate direto', 'Dois prédios caídos, Batman sai vitorioso', 5000000, 'Concluída', INTERVAL '1 day', 'Centro de Gotham'),
(2, 'Invasão alienígena', '2025-02-01', '2025-02-02', 15, 'Combate direto', 'Metrópolis severamente danificada, Goku vence', 6000000, 'Concluída', INTERVAL '1 day', 'Metrópolis'),
(3, 'Ragnarok', '2025-03-01', '2025-03-02', 5, 'Invasão de Asgard por Surtur', 'Asgard destruída', 8000000, 'Concluída', INTERVAL '1 day', 'Asgard'),
(4, 'Batalha em Xique-Xique', '2025-04-01', '2025-04-01', 0, 'Invasão do ET Bilu', 'Cidade preservada, Batman derrota ET Bilu', 1000000, 'Concluída', INTERVAL '0 day', 'Periferias'),
(5, 'Invasão do Loki', '2025-05-01', '2025-05-03', 20, 'Invasão', 'Nova York devastada, Vingadores vencem', 12000000, 'Concluída', INTERVAL '2 days', 'Nova York'),
(6, 'Invasão do Thanos', '2025-06-01', '2025-06-02', 8, 'Ataque surpresa', 'Wakanda quase destruída, vingadores vencem', 5000000, 'Concluída', INTERVAL '1 day', 'Wakanda'),
(7, 'Ataque', '2025-07-01', '2025-07-01', 2, 'Defesa de cidade', 'Central City em ruínas, Superman vence', 2000000, 'Concluída', INTERVAL '0 day', 'Central City'),
(8, 'Invasão alienígena', '2025-08-01', '2025-08-02', 10, 'Confronto entre heróis', 'Cidade intacta, Homem de ferro derrotado.', 7000000, 'Concluída', INTERVAL '1 day', 'Centro'),
(9, 'Batalha em Krypton', '2025-09-01', '2025-09-01', 50, 'Invasão', 'Krypton destruída, poucos sobreviventes', 15000000, 'Concluída', INTERVAL '0 day', 'Krypton'),
(10, 'Duelo em Voromir', '2025-10-01', '2025-10-02', 100, 'Confronto final', 'Vormir arrasada, Capitão América derrota vilões', 20000000, 'Concluída', INTERVAL '1 day', 'Vormir');


INSERT INTO Batalha_Heroi (id_batalha, id_pessoa)
VALUES
(1, 3),  
(2, 2),  
(3, 6),  
(4, 3),  
(5, 4),  
(6, 5),  
(7, 1),  
(8, 4),  
(9, 1),  
(10, 5); 


INSERT INTO Batalha_Vilao (id_batalha, id_pessoa)
VALUES
(1, 7), 
(2, 8), 
(3, 8), 
(4, 11),
(5, 9), 
(6, 10),
(7, 7), 
(8, 9), 
(9, 10),
(10, 9);


INSERT INTO Frase (id_pessoa, frases)
VALUES
(1, 'Verdade, justiça, e um amanhã melhor'),
(2, 'Ossu!'),
(3, 'Eu sou a noite. Eu sou a vingança. Eu sou o Batman'),
(4, 'Eu sou o Homem de Ferro'),
(5, 'Eu posso fazer isso o dia todo'),
(6, 'Por Asgard!'),
(7, 'Por que tão sério?'),
(8, 'Eu sou o príncipe dos Saiyajins'),
(10, 'Eu sou inevitável');


UPDATE Pessoa SET nome_ficticio = 'Homi-murcego' WHERE nome_ficticio = 'Batman';


UPDATE Pessoa SET poder = poder + 8000 WHERE nome_ficticio = 'Vegeta';


ALTER TABLE Cidade ADD COLUMN clima VARCHAR(100);


ALTER TABLE Pessoa ADD CONSTRAINT chk_poder CHECK (poder >= 300);


ALTER TABLE Pessoa ALTER COLUMN tipo SET NOT NULL,
ALTER TABLE Pessoa ALTER COLUMN nome_ficticio SET NOT NULL,
ALTER TABLE Pessoa ALTER COLUMN nome_real SET NOT NULL,
ALTER TABLE Pessoa ALTER COLUMN poder SET NOT NULL,
ALTER TABLE Pessoa ALTER COLUMN poderes SET NOT NULL,
ALTER TABLE Pessoa ALTER COLUMN gênero SET NOT NULL,
ALTER TABLE Pessoa ALTER COLUMN peso SET NOT NULL,
ALTER TABLE Pessoa ALTER COLUMN altura SET NOT NULL,
ALTER TABLE Pessoa ALTER COLUMN idade SET NOT NULL,
ALTER TABLE Pessoa ALTER COLUMN naturalidade SET NOT NULL;


ALTER TABLE Cidade ALTER COLUMN nome SET NOT NULL,
ALTER TABLE Cidade ALTER COLUMN estado SET NOT NULL,
ALTER TABLE Cidade ALTER COLUMN país SET NOT NULL,
ALTER TABLE Cidade ALTER COLUMN pib SET NOT NULL,
ALTER TABLE Cidade ALTER COLUMN idh SET NOT NULL,
ALTER TABLE Cidade ALTER COLUMN população SET NOT NULL,
ALTER TABLE Cidade ALTER COLUMN área SET NOT NULL,
ALTER TABLE Cidade ALTER COLUMN altitude SET NOT NULL,
ALTER TABLE Cidade ALTER COLUMN prefeito SET NOT NULL;


ALTER TABLE Oponentes ALTER COLUMN id_pessoa1 SET NOT NULL,
ALTER TABLE Oponentes ALTER COLUMN id_pessoa2 SET NOT NULL;


ALTER TABLE Cidade_Defensor ALTER COLUMN id_cidade SET NOT NULL,
ALTER TABLE Cidade_Defensor ALTER COLUMN id_pessoa SET NOT NULL;


ALTER TABLE Batalha ALTER COLUMN id_cidade SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN nome SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN data_inicio SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN data_fim SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN fatalidades SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN tipo_batalha SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN consequencias SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN dano_material SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN status_batalha SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN duração SET NOT NULL,
ALTER TABLE Batalha ALTER COLUMN localização SET NOT NULL;


ALTER TABLE Batalha_Heroi ALTER COLUMN id_batalha SET NOT NULL,
ALTER TABLE Batalha_Heroi ALTER COLUMN id_pessoa SET NOT NULL;


ALTER TABLE Batalha_Vilao ALTER COLUMN id_batalha SET NOT NULL,
ALTER TABLE Batalha_Vilao ALTER COLUMN id_pessoa SET NOT NULL;


ALTER TABLE Frase ALTER COLUMN id_pessoa SET NOT NULL,
ALTER TABLE Frase ALTER COLUMN frases SET NOT NULL;


CREATE TABLE Grupinho (
	id_grupinho SERIAL PRIMARY KEY,
	nome		varchar(100)
);


CREATE TABLE Grupinho_Pessoa (
	id_grupinho_pessoa	SERIAL PRIMARY KEY,
	id_grupinho			integer,
	id_pessoa			integer,
	CONSTRAINT fkgrupinho FOREIGN KEY (id_grupinho) REFERENCES Grupinho(id_grupinho),
	CONSTRAINT fkpessoa FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa),
);


INSERT INTO Grupinho (nome)
VALUES
('Vingadores'),
('Liga da Justiça'),
('Guerreiros Z');


INSERT INTO Grupinho_Pessoa (id_grupinho, id_pessoa)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(1, 10);


SELECT DISTINCT p.nome_ficticio FROM Pessoa p JOIN Batalha_Vilao bv ON bv.id_pessoa = p.id_pessoa JOIN Batalha b ON bv.id_batalha = b.id_batalha WHERE b.nome = 'Batalha em Xique-Xique';


SELECT frases FROM Frase WHERE id_pessoa = (SELECT id_pessoa FROM Pessoa WHERE nome_ficticio = 'Homem de Ferro');


SELECT v.nome FROM Vilao v JOIN Batalha_Vilao bv ON v.id_vilao = bv.id_vilao JOIN Batalha b ON bv.id_batalha = b.id_batalha JOIN Heroi h ON b.id_heroi = h.id_heroi WHERE h.nome = 'Batman';