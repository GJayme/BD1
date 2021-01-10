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


