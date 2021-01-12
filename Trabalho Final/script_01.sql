CREATE DATABASE pastelaria;
USE pastelaria;

CREATE TABLE pessoa(
	cpf		VARCHAR(14) UNIQUE NOT NULL,
    sexo	CHAR(1) DEFAULT 'M',
    nome 	VARCHAR(40) NOT NULL,
    CONSTRAINT pessoa_pk PRIMARY KEY(cpf),
    CHECK (sexo in ('M', 'F', 'm', 'f'))
);

CREATE TABLE funcionario(
	cpf 			VARCHAR(14) UNIQUE NOT NULL,
    salario			DECIMAL(15,2),
    dt_nascimento	DATE,
    telefone		BIGINT,
    rua				VARCHAR(100),
    numero			INT,
    cep				INT,
    bairro			VARCHAR(50),    
    CONSTRAINT cpf_funcionario FOREIGN KEY(cpf) REFERENCES pessoa(cpf),
    PRIMARY KEY(cpf)
);

CREATE TABLE cliente(
	cpf 				VARCHAR(14) UNIQUE NOT NULL,
    pontos_fidelidade	BIGINT,
    CONSTRAINT cpf_cliente FOREIGN KEY(cpf) REFERENCES pessoa(cpf),
    PRIMARY KEY(cpf)
);

CREATE TABLE venda(
	id 				INT UNIQUE NOT NULL AUTO_INCREMENT,
    valor_pedido	DECIMAL(13,4),
    tipo_pagamento	VARCHAR(50),
    data_pedido		TIMESTAMP,
    cpf_cliente		VARCHAR(14) NOT NULL,
    cpf_funcionario	VARCHAR(14) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT venda_cpf_cliente FOREIGN KEY(cpf_cliente) REFERENCES cliente(cpf),
    CONSTRAINT venda_cpf_funcionario FOREIGN KEY(cpf_funcionario) REFERENCES funcionario(cpf)
);

CREATE TABLE produto(
	id				INT UNIQUE NOT NULL AUTO_INCREMENT,
    nome			VARCHAR(50),
    descricao		VARCHAR(100),
    valor_produto	DECIMAL(13,4),
    tipo_produto	VARCHAR(20),
    PRIMARY KEY(id)
);

CREATE TABLE ingrediente(
	id			INT UNIQUE NOT NULL AUTO_INCREMENT,
    nome		VARCHAR(50),
    descricao	VARCHAR(80),
    PRIMARY KEY (id)
);

CREATE TABLE venda_produto(
	id_venda		INT,
    id_produto		INT,
    qtde_produto	INT,
    CONSTRAINT id_venda_venda FOREIGN KEY(id_venda) REFERENCES venda(id),
    CONSTRAINT id_produto_venda FOREIGN KEY(id_produto) REFERENCES produto(id),
    PRIMARY KEY(id_venda, id_produto)
);

CREATE TABLE produto_ingrediente(
	id_produto		INT,
    id_ingrediente	INT,
    CONSTRAINT id_ingrediente FOREIGN KEY(id_ingrediente) REFERENCES ingrediente(id),
    CONSTRAINT id_produto_ingrediente FOREIGN KEY(id_produto) REFERENCES produto(id),
    PRIMARY KEY(id_ingrediente, id_produto)
);

-- INSERT PESSOAS
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('40726674800', 'M', 'Gabriel Jayme');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('66666666666', 'F', 'Gabriela Jayme');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('10101010101', 'F', 'Laura');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('12345678903', 'F', 'Livia Trevisani');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('34335627375', 'M', 'Leonardo Freitas');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('84376769346', 'M', 'Charles Souza');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('34587347853', 'M', 'Vinicius Shultz');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('11209834732', 'M', 'Gustavo Eduardo');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('23423948753', 'F', 'Tania Maria');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('34344565894', 'M', 'Antônio Luis');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('11111111111', 'F', 'Ana Carolina');
INSERT INTO pessoa (cpf, sexo, nome) VALUES ('22222222222', 'F', 'Zé lelé');

-- INSERT CLIENTES
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('40726674800', 112);
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('66666666666', 22);
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('10101010101', 2);
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('12345678903', 332);
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('34335627375', 56);
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('22222222222', null);

-- INSERT FUNCIONARIOS
INSERT INTO funcionario (cpf, salario ,dt_nascimento, telefone, rua, numero, cep, bairro) VALUES ('84376769346', 2000.00, '1985-05-07', 5516947585933 , 'Rua sem fim', 000, 14140000, 'Além');
INSERT INTO funcionario (cpf, salario ,dt_nascimento, telefone, rua, numero, cep, bairro) VALUES ('34587347853', 1500.00, '1900-01-01', 5516894867233 ,'Rua dos condenados', 666, 15147030 ,'Inferno');
INSERT INTO funcionario (cpf, salario ,dt_nascimento, telefone, rua, numero, cep, bairro) VALUES ('11209834732', 1800.00, '1991-09-23', 5516983745563 ,'Av Mala sem alça', 24, '11146030', 'Sai daqui');
INSERT INTO funcionario (cpf, salario ,dt_nascimento, telefone, rua, numero, cep, bairro) VALUES ('23423948753', 5000.00, '1964-01-14', 5516916747543 ,'Rua Saudade Grande', 917,'15851111', 'Centro');
INSERT INTO funcionario (cpf, salario ,dt_nascimento, telefone, rua, numero, cep, bairro) VALUES ('34344565894', 3000.00, '1965-06-13', 5516999999933 ,'Av Orgulho', 1314, 13159560,'Jd Santana') ;
INSERT INTO funcionario (cpf, salario ,dt_nascimento, telefone, rua, numero, cep, bairro) VALUES ('11111111111', 500.00, '2001-08-15', 5516666634567,'Rua dos esplorados', 1, 13141680,'Trabalhador');

-- INSERT PRODUTOS
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (1, 'Pastel de carne', 'Pastel com recheio de carne', 7.50, 'Pastel');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (2, 'Pastel de queijo', 'Pastel com recheio de queijo', 8.50, 'Pastel');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (3, 'Pastel de bacalhau', 'Pastel com recheio de bacalhau', 10.50, 'Pastel');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (4, 'Pastel de Pizza', 'Pastel com recheio de pizza', 7.50, 'Pastel');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (5, 'Cerveja', 'Cerveja trincando', 7.00, 'Bebida');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (6, 'Coca cola', 'Coca cola', 7.50, 'Bebida');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (7, 'Fanta', 'Fanta', 7.50, 'Bebida');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (8, 'Caldo de cana com limão', 'Caldo de cana com limão', 11.50, 'Bebida');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (9, 'Bolo de chocolate', 'Bolo de chocolate', 5.50, 'Sobremesa');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (10, 'Sorvete', 'Sorvete', 9.50, 'Sobremesa');
INSERT INTO produto (id, nome, descricao, valor_produto, tipo_produto) VALUES (11, null, 'Vai saber o que é isso', 9.50, 'Sobremesa');

-- INSERT INGREDIENTES
INSERT INTO ingrediente (id, nome, descricao) VALUES (1, 'Carne', 'Carne moída');
INSERT INTO ingrediente (id, nome, descricao) VALUES (2, 'Quiejo', 'Queijo mussarela');
INSERT INTO ingrediente (id, nome, descricao) VALUES (3, 'Bacalhau', 'Bacalhau');
INSERT INTO ingrediente (id, nome, descricao) VALUES (4, 'Pizza', 'Presunto, mussarela, oregano, tomate, cebola');

-- INSERT PRODUTO_INGREDIENTE
INSERT INTO produto_ingrediente(id_produto, id_ingrediente) VALUES (1, 1);
INSERT INTO produto_ingrediente(id_produto, id_ingrediente) VALUES (2, 2);
INSERT INTO produto_ingrediente(id_produto, id_ingrediente) VALUES (3, 3);
INSERT INTO produto_ingrediente(id_produto, id_ingrediente) VALUES (4, 4);

-- INSERT VENDA
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (1, 7.50, 'Dinheiro', '2020-01-01 10:10:10', '40726674800', '84376769346');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (2, 8.50, 'Cartão de Credito', '2020-01-01 11:11:10', '66666666666', '34587347853');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (3, 10.50, 'Cartão de Credito', '2020-01-01 11:16:05', '12345678903', '34344565894');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (4, 7.00, 'Cartão de Debito', '2020-01-01 10:20:10', '34335627375', '23423948753');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (5, 19.00, 'Dinheiro', '2020-01-02 10:10:10', '40726674800', '23423948753');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (6, 7.00, 'Dinheiro', '2020-01-02 10:10:10', '34335627375', '84376769346');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (7, 14.00, 'Dinheiro', '2020-01-02 10:10:10', '34335627375', '34344565894');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (8, 7.00, 'Dinheiro', '2020-01-02 10:10:10', '34335627375', '23423948753');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (9, 21.00, 'Dinheiro', '2020-01-02 10:10:10', '34335627375', '84376769346');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (10, 7.00, 'Dinheiro', '2020-01-02 10:10:10', '34335627375', '34344565894');
INSERT INTO venda(id, valor_pedido, tipo_pagamento, data_pedido, cpf_cliente, cpf_funcionario) VALUES (11, 9.50, 'Cartão de Debito', '2020-01-03 10:10:10', '40726674800', '34344565894');

-- INSERT VENDA_PRODUTO
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (1, 1, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (2, 2, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (3, 3, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (4, 5, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (5, 1, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (5, 8, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (6, 5, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (7, 5, 2);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (8, 5, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (9, 5, 3);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (10, 5, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (11, 11, 1);
