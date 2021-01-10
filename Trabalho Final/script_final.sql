USE pastelaria;

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

-- INSERT CLIENTES
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('40726674800', 112);
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('66666666666', 22);
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('10101010101', 2);
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('12345678903', 332);
INSERT INTO cliente (cpf, pontos_fidelidade) VALUES ('34335627375', 56);

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

-- INSERT VENDA_PRODUT
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (1, 1, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (2, 2, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (3, 3, 1);
INSERT INTO venda_produto(id_venda, id_produto, qtde_produto) VALUES (4, 5, 1);

-- 3 consultas simples (em uma única tabela) e que façam filtros utilizando AND e OR. No mínimo uma delas deve usar a cláusula ORDER BY.
	-- Pegar produtos que sejam pasteis com valor igual a 8.50 ou bebidas que custam 7.50.
SELECT * FROM produto
	WHERE tipo_produto = 'Pastel' AND valor_produto = 8.50
    OR (tipo_produto = 'Bebida' AND valor_produto = 7.50)
    ORDER BY valor_produto DESC;
	-- Pegar produtos que sejam pasteis com valor igual a 8.50 ou sobremesas que custam menos que 7.50.
SELECT * FROM produto
	WHERE tipo_produto = 'Pastel' AND valor_produto = 8.50
    OR (tipo_produto = 'Sobremesa' AND valor_produto > 7.50)
	ORDER BY valor_produto DESC;
	-- Pegar produtos que sejam bebidas com valor menor que 8.50 ou sobremesas que custam mais que 7.50.
SELECT * FROM produto
	WHERE tipo_produto = 'Bebida' AND valor_produto < 7.50
    OR (tipo_produto = 'Sobremesa' AND valor_produto > 7.50)
	ORDER BY valor_produto DESC;

-- 2 consultas que utilizem funções de manipulação de caracteres (LIKE, SUBSTR, LENGTH, UPPER, etc)
	-- Pegar a rua de funcionarios e apresentar o cpf, o nome da rua e o nome da rua partindo do 8º caracter.
SELECT cpf, rua,substr(rua, 8) rua_substr FROM funcionario;
	-- Pegar o nome e o tamanho do nome da tabela de pessoa.
SELECT nome, length(nome) tamanho_nome FROM pessoa;

-- 2 consultas que utilizem inner join de duas tabelas
	-- pegar o id e o valor da tabela venda e o nome do cliente da tabela pessoa.
SELECT venda.id, venda.valor_pedido, pessoa.nome FROM venda
	JOIN pessoa on venda.cpf_cliente = pessoa.cpf;
	-- pegar o id da tabela produto_ingrediente e o nome do ingrediente na tabela ingrediente.
SELECT produto_ingrediente.id_produto, ingrediente.nome FROM produto_ingrediente
	JOIN ingrediente on ingrediente.id = produto_ingrediente.id_ingrediente;
-- 2 consultas que utilizem inner join de três ou mais tabelas
-- 2 consultas que utilizem outer join (left ou right) de tabelas
-- 2 consultas que utilizem GROUP BY e funções agregadas (SUM, COUNT, MAX, MIN, AVG)
-- 2 consultas que utilizem a cláusula HAVING juntamente com GROUP BY
-- 4 consultas que utilizem subconsultas, sendo que ao menos duas delas utilizem os operadores IN, ANY, ALL para tartar subconsultas que retornam mais de 1 registro
-- 1 consulta que utilize o operador UNION
-- 1 consulta que utilize o operador EXISTS ou NOT EXISTS


