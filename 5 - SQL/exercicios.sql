USE empresa;
-- 13.Mostre o nome, salário, número do departamento de todos os empregados que trabalhem no departamento Atores;

-- 14.Liste o nome, salário e data de nascimento dos empregados que ganham mais do que a Glória Maria eo Michael Jackson;

-- 15.Mostre o nome, número do departamento, e o nome e salário dos empregados cuja localização do departamento seja Congresso Nacional

-- 16.Liste o código, nome, sexo e salário dos empregados que são mais velhos do que todos os empregados do departamento Escola
SELECT codigo, nome, sexo, salario FROM empregado
	WHERE datanasc < ALL (SELECT datanasc FROM empregado
		WHERE depto_num = (
			SELECT numero FROM departamento 
				WHERE nome = 'Escola'));

-- 17.Liste o código e o nome dos empregados que trabalham em ao menos um projeto

-- 18.Liste o código e o nome dos departamentos que não possuem empregados trabalhando neles
SELECT numero, nome FROM departamento
	WHERE numero NOT IN (
		SELECT depto_num FROM empregado WHERE depto_num IS NOT NULL
    );
    
SELECT numero, nome FROM departamento d
	WHERE NOT EXISTS (
		SELECT 0 FROM empregado e WHERE e.depto_num = d.numero
	);
    
-- 19.Liste o nome de cada projeto existente, bem como o nome do departamento que o controla e quantidade de funcionarios que trabalha em cada projeto
SELECT p.nome, d.nome, count(*) FROM projeto p
	INNER JOIN departamento d ON p.depto_num = d.numero
    JOIN trabalha_em t ON t.projeto_num = p.numero
    GROUP BY p.nome, d.nome;

-- 20.Liste a quantidade de funcionarios que não gerenciam nenhum departamento
SELECT codigo from empregado
	WHERE codigo NOT IN (
		SELECT COALESCE(codigo_ger, -10) FROM departamento
    );
    
SELECT count(*) FROM empregado e
	WHERE NOT EXISTS (
		SELECT 1 FROM departamento d WHERE d.codigo_ger = e.codigo
    )