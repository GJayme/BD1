-- Liste o código e nome dos empregados que NÃO gerenciam NENHUM departamento
use empresa;


-- SUBCONSULTA CORRELACIONADA
-- EXISTS
-- NOT EXISTS
SELECT codigo, nome FROM empregado e
	WHERE EXISTS (SELECT 1 FROM departamento d WHERE d.codigo_ger = e.codigo);

SELECT codigo, nome FROM empregado e
	WHERE EXISTS (SELECT 1 FROM departamento d WHERE d.codigo_ger = e.codigo);

-- Liste as informações dos empregados que NÃO trabalham em NENHUM projeto
SELECT codigo, nome FROM empregado e
	WHERE NOT EXISTS (SELECT 1 FROM trabalha_em t WHERE t.codigo_emp = e.codigo);

-- OPERADORES DE CONJUNTO
-- Liste os nomes de todos os beneficiarios do plano de saúde
SELECT codigo cod_beneficiario FROM empregado
	UNION
SELECT codigo_emp FROM dependente
ORDER BY cod_beneficiario;


SELECT * FROM empregado;