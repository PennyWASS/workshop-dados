CREATE DATABASE Fabrica;
USE fabrica;

CREATE TABLE Produtos (
    nomeProduto VARCHAR(30),
    quantitdadeArmazenada INTEGER,
    id_produto VARCHAR(10) PRIMARY KEY,
    preco FLOAT
);

CREATE TABLE Materiais (
    nomeMaterial VARCHAR(30),
    quantidadeArmazenada INTEGER,
    preco FLOAT,
    id_materiais VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Funcionarios (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(30),
    funcao VARCHAR(30),
    genero VARCHAR(10),
    salario FLOAT
);

CREATE TABLE Contato (
    email VARCHAR(30) PRIMARY KEY,
    telefone VARCHAR(30)
);

CREATE TABLE Endereco (
    rua VARCHAR(30),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    cep VARCHAR(30),
    numero INTEGER,
    estado VARCHAR(30),
    id_endereco VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Funcao (
    nomeFuncao VARCHAR(30),
    tipoFuncao VARCHAR(30),
    id_funcao VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Vendas (
    quantidadeVendida INTEGER,
    lucro FLOAT,
    idVendas VARCHAR(10) PRIMARY KEY,
    precisaRepor BOOLEAN
);

CREATE TABLE quantidade_em_estoque_Produtos_Materiais_Vendas (
    fk_Produtos_id_produto VARCHAR(30),
    fk_Materiais_id_materiais VARCHAR(30),
    fk_Vendas_idVendas VARCHAR(30)
);

CREATE TABLE fabricacao_Funcionarios_Funcao_Vendas (
    fk_Funcionarios_cpf VARCHAR(30),
    fk_Funcao_id_funcao VARCHAR(30),
    fk_Vendas_idVendas VARCHAR(30)
);

CREATE TABLE Informacoes (
    fk_Contato_email VARCHAR(30),
    fk_Endereco_id_endereco VARCHAR(30),
    fk_Funcionarios_cpf VARCHAR(30)
);

INSERT INTO Produtos VALUES('Toalha de Banho', 40,'1', 20),
('Conjunto de cozinha', 100,'2', 30),
('Colcha de cama', 30,'3', 50),
('Pano de prato', 100,'4', 10),
('Lençol', 60,'5', 20),
('Cortina', 10,'6', 30);

INSERT INTO Materiais VALUES('Bico', 100, 7, '1'),
('Viés', 30, 5, '2'),
('Fita', 50, 5, '3'),
('Passamanaria', 10, 3, '4'),
('Tecido', 70, 10, '5'),
('Linha', 90, 4, '6');

INSERT INTO Funcionarios VALUES('111.111.111-11', 'João', 'Pintura', 'M', 500),
('222.222.222-22', 'Maria', 'Costura reta', 'F', 600),
('333.333.333-33', 'José', 'Sublimação', 'M', 700),
('444.444.444-44', 'Pedro', 'Cortar tecido', 'M', 500),
('555.555.555-55', 'Ana', 'Costura overloue', 'F', 700),
('666.666.666-66', 'Alicia', 'Embalar', 'F', 500);

INSERT INTO Contato VALUES('joao@gmail.com', '(83) 92874-7855'),
('maria@gmail.com', '(83) 93383-8285'),
('jose@gmail.com', '(83) 93113-1232'),
('pedro@gmail.com', '(83) 93232-6508'),
('ana@gmail.com', '(83) 92952-2557'),
('alicia@gmail.com', '(83) 92377-7648');

INSERT INTO Endereco VALUES('Antonio Dutra', 'Centro', 'Brejo do Cruz', '58890-000', 123, 'PB', '1'),
('Eilzo Afonso', 'Água Fria', 'João Pessoa', '58053-018', 456, 'PB', '2'),
('Antonio Dutra', 'Centro', 'Brejo do Cruz', '58890-000', 789, 'PB', '3'),
('Antonio Dutra', 'Centro', 'Brejo do Cruz', '58890-000', 987, 'PB', '4'),
('Eilzo Afonso', 'Água Fria', 'João Pessoa', '58053-018', 654, 'PB', '5'),
('Antonio Dutra', 'Centro', 'Brejo do Cruz', '58890-000', 321, 'PB', '6');

INSERT INTO Funcao VALUES('Pintura', 'Mesa', '1'),
('Costura Reta', 'Máquina', '2'),
('Sublimação', 'Máquina', '3'),
('Costura rverloque', 'Mesa', '4'),
('Cortar tecido', 'Mesa', '5'),
('Embalar', 'Mesa', '6');

INSERT INTO Vendas VALUES(20, 400, '1', FALSE),
(50, 1000, '2', FALSE),
(30, 1500, '3', TRUE),
(50, 100, '4', FALSE),
(30, 600, '5', FALSE),
(5, 150, '6', FALSE);

#Selecionando todos os produtos que começam com a letra "C":
SELECT * FROM Produtos WHERE nomeProduto LIKE 'C%';

#Mostrando todos os funcionários que começam com a letra "A" e possuem 3 letras:
SELECT * FROM Funcionarios WHERE nome LIKE 'A__';

#Mostrando todos os funcionários que não começam com a letra "A":
SELECT * FROM Funcionarios WHERE nome NOT LIKE 'A%';

#Verificando se há algum produto com o valor nulo: 
SELECT * FROM Produtos WHERE preco IS NULL;

#Mostrando os funcionários do gênero feminino com salário igual ou acima de 600:
SELECT * FROM Funcionarios WHERE salario >= 600 AND genero = 'F';

#Mostrando todos os materiais com valor entre 5 e 10 reais
SELECT * FROM Materiais WHERE preco BETWEEN 5 AND 10 ORDER BY preco ASC;

#Exibindo a quantos produtos essa fábrica vende produtos:
SELECT COUNT(*) AS Quantidade FROM Produtos;

#Exibindo o lucro total da fábrica:
SELECT SUM(lucro) AS Total FROM Vendas;

#Exibindo a média dos salários dos funcionários
SELECT AVG(salario) AS 'Média dos salários' FROM Funcionarios;

#Exibindo o valor do material mais caro:
SELECT MAX(preco) AS 'Material mais caro' FROM Materiais;

#Exibindo o valor do material mais barato
SELECT MIN(preco) AS 'Material mais barato' FROM Materiais;



ALTER TABLE quantidade_em_estoque_Produtos_Materiais_Vendas ADD CONSTRAINT FK_quantidade_em_estoque_Produtos_Materiais_Vendas_1
    FOREIGN KEY (fk_Produtos_id_produto)
    REFERENCES Produtos (id_produto)
    ON DELETE NO ACTION;
 
ALTER TABLE quantidade_em_estoque_Produtos_Materiais_Vendas ADD CONSTRAINT FK_quantidade_em_estoque_Produtos_Materiais_Vendas_2
    FOREIGN KEY (fk_Materiais_id_materiais)
    REFERENCES Materiais (id_materiais)
    ON DELETE NO ACTION;
 
ALTER TABLE quantidade_em_estoque_Produtos_Materiais_Vendas ADD CONSTRAINT FK_quantidade_em_estoque_Produtos_Materiais_Vendas_3
    FOREIGN KEY (fk_Vendas_idVendas)
    REFERENCES Vendas (idVendas)
    ON DELETE NO ACTION;
 
ALTER TABLE fabricacao_Funcionarios_Funcao_Vendas ADD CONSTRAINT FK_fabricacao_Funcionarios_Funcao_Vendas_1
    FOREIGN KEY (fk_Funcionarios_cpf)
    REFERENCES Funcionarios (cpf)
    ON DELETE NO ACTION;
 
ALTER TABLE fabricacao_Funcionarios_Funcao_Vendas ADD CONSTRAINT FK_fabricacao_Funcionarios_Funcao_Vendas_2
    FOREIGN KEY (fk_Funcao_id_funcao)
    REFERENCES Funcao (id_funcao)
    ON DELETE NO ACTION;
 
ALTER TABLE fabricacao_Funcionarios_Funcao_Vendas ADD CONSTRAINT FK_fabricacao_Funcionarios_Funcao_Vendas_3
    FOREIGN KEY (fk_Vendas_idVendas)
    REFERENCES Vendas (idVendas)
    ON DELETE NO ACTION;
 
ALTER TABLE Informacoes ADD CONSTRAINT FK_Informacoes_1
    FOREIGN KEY (fk_Contato_email)
    REFERENCES Contato (email)
    ON DELETE NO ACTION;
 
ALTER TABLE Informacoes ADD CONSTRAINT FK_Informacoes_2
    FOREIGN KEY (fk_Endereco_id_endereco)
    REFERENCES Endereco (id_endereco)
    ON DELETE NO ACTION;
 
ALTER TABLE Informacoes ADD CONSTRAINT FK_Informacoes_3
    FOREIGN KEY (fk_Funcionarios_cpf)
    REFERENCES Funcionarios (cpf)
    ON DELETE NO ACTION;