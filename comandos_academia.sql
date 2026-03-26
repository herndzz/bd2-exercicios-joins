# ~~~~~~~~~~~~~~~~~~~~~~~~~ [ Exercícios ] ~~~~~~~~~~~~~~~~~~~~~~~~~

# 1 - Crie uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo das pessoas associadas a academia, uma coluna com o logradouro e outra com o número. Utilize as tabelas Pessoa_Associada e Endereco.
SELECT 
    CONCAT(Pessoa_Associada.Nome, " ", Pessoa_Associada.Sobrenome) AS `Nome Completo`, 
    Endereco.Logradouro AS Logradouro, 
    Endereco.Numero AS `Número`
FROM
    Pessoa_Associada
INNER JOIN
    Endereco 
    ON Pessoa_Associada.Endereco_ID = Endereco.Endereco_ID;

# 2 - Escreva uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo das pessoas associadas a academia, uma coluna com o nome do plano dessa pessoa. Utilize as tabelas Pessoa_Associada e Plano.
SELECT
    PA.Pessoa_Associada_ID AS `Pessoa_ID`,
    CONCAT(PA.Nome, " ", PA.Sobrenome) AS `Nome Completo`,
    P.Nome_plano
FROM
    Pessoa_Associada AS PA
INNER JOIN
    Plano AS P 
    ON PA.Plano_ID = P.Plano_ID;

# 3 - Escreva uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo das pessoas associadas a academia, uma coluna com telefone e outra com o cep dessa pessoa. Utilize as tabelas Pessoa_Associada, Telefone e Endereco.
SELECT 
    PA.Pessoa_Associada_ID AS `Pessoa_ID`,
    CONCAT(PA.Nome, " ", PA.Sobrenome) AS `Nome Completo`,
    T.Telefone_Contato AS `Telefone`,
    E.CEP AS `CEP`
FROM
    Pessoa_Associada AS PA
INNER JOIN
    Telefone AS T 
    ON PA.Telefone_ID = T.Telefone_ID
INNER JOIN
    Endereco AS E 
    ON PA.Endereco_ID = E.Endereco_ID;

# 4 - Escreva uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo das pessoas associadas a academia, uma coluna com telefone de contato e outra com o cep dessa pessoa. Utilize as tabelas Pessoa_Associada, Telefone e Endereco.
SELECT 
    PA.Pessoa_Associada_ID AS `Pessoa_ID`,
    CONCAT(PA.Nome, " ", PA.Sobrenome) AS `Nome Completo`,
    T.Telefone_Contato AS `Telefone`,
    E.CEP AS `CEP`
FROM
    Pessoa_Associada AS PA
INNER JOIN
    Telefone AS T 
    ON PA.Telefone_ID = T.Telefone_ID
INNER JOIN
    Endereco AS E 
    ON PA.Endereco_ID = E.Endereco_ID;

# 5 - Crie uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo de todas as pessoas associadas a academia, e uma coluna com o telefone de emergência dessa pessoa, caso a pessoa não tiver telefone de emergência, exiba 'PEDENTE', nomeie essa coluna como 'Telefone de Emergência'. Utilize as tabelas Pessoa_Associada e Telefone.
SELECT 
    PA.Pessoa_Associada_ID AS `Pessoa_ID`,
    CONCAT(PA.Nome, " ", PA.Sobrenome) AS `Nome Completo`,
    IFNULL(T.Telefone_Emergencia, "PENDENTE") AS `Telefone Emergência`
FROM
    Pessoa_Associada AS PA
INNER JOIN
    Telefone AS T 
    ON PA.Telefone_ID = T.Telefone_ID;

# 6 - Crie uma query que retorne duas coluna com os nomes das pessoas associadas que possuem o mesmo endereço. Porém, não deixe que o mesmo nome se repita na mesma linha.
SELECT
    CONCAT(P1.Nome, " ", P1.Sobrenome) AS `Nome 1`,
    CONCAT(P2.Nome, " ", P2.Sobrenome) AS `Nome 2`
FROM
    Pessoa_Associada AS P1
INNER JOIN
    Pessoa_Associada AS P2 
    ON P1.Endereco_ID = P2.Endereco_ID
    AND P1.Pessoa_Associada_ID < P2.Pessoa_Associada_ID;

# 7 - Crie uma query que retorne duas coluna com os nomes das pessoas treinadoras que possuem o mesmo endereço. Porém, não deixe que o mesmo nome se repita na mesma linha.
SELECT
    CONCAT(P1.Nome, " ", P1.Sobrenome) AS `Nome 1`,
    CONCAT(P2.Nome, " ", P2.Sobrenome) AS `Nome 2`
FROM
    Pessoa_Treinadora AS P1
INNER JOIN
    Pessoa_Treinadora AS P2 
    ON P1.Endereco_ID = P2.Endereco_ID
    AND P1.Pessoa_Treinadora_ID < P2.Pessoa_Treinadora_ID;

# 8 - Crie uma query que retorne uma coluna com o nome dos planos outra que com a quantidade de pessoas associadas que possuem esse plano, nomeie como 'Pessoas Inclusas'.
SELECT
    P.Nome_plano AS `Nome dos Planos`,
    COUNT(PA.Pessoa_Associada_ID) AS `Pessoas Inclusas`
FROM 
    Plano AS P
LEFT JOIN 
    Pessoa_Associada AS PA 
    ON PA.Plano_ID = P.Plano_ID
GROUP BY 
    P.Nome_plano;

# 9 - Crie uma query que retorne uma coluna nomeada como 'Nome Completo', com o nome completo das pessoas associadas a academia, e uma coluna com o período dessa pessoa. Utilize as tabelas Pessoa_Associada, Treino e Horario.
SELECT 
    CONCAT(PA.Nome, " ", PA.Sobrenome) AS `Nome Completo`,
    H.Periodo AS `Periodo`
FROM 
    Pessoa_Associada AS PA 
LEFT JOIN 
    Treino AS T 
    ON PA.Pessoa_Associada_ID = T.Pessoa_Associada_ID
LEFT JOIN 
    Horario AS H 
    ON T.Horario_ID = H.Horario_ID;

# 10 - Crie uma query que retorne uma coluna nomeada como 'Nome Completo' com o nome completo de todas as pessoas associadas a academia e uma coluna com o nome 'Horario', mostrando o período dessa pessoa. Caso a pessoa não tiver período estipulado, exiba 'LIVRE'. Utilize as tabelas Pessoa_Associada, Aula e Horario.
SELECT 
    CONCAT(PA.Nome, ' ', PA.Sobrenome) AS `Nome Completo`,
    IFNULL(H.Periodo, 'LIVRE') AS `Horario`
FROM 
    Pessoa_Associada AS PA
LEFT JOIN 
    Aula AS A 
    ON PA.Pessoa_Associada_ID = A.Horario_ID
LEFT JOIN 
    Horario AS H 
    ON A.Horario_ID = H.Horario_ID;

# ~~~~~~~~~~~~~~~~~~~~~~~~~ [ Bônus ] ~~~~~~~~~~~~~~~~~~~~~~~~~

# 1 - Mostre o nome da pessoa treinadora e a modalidade em que atua, de modo que a mesma informação não se repita na tabela. Use as tabelas Pessoa_Treinadora, Aula, Modalidade.
SELECT DISTINCT
    CONCAT(PT.Nome, ' ', PT.Sobrenome) AS `Nome Treinadora`,
    M.Nome_modalidade AS `Modalidade`
FROM
    Pessoa_Treinadora AS PT
INNER JOIN
    Aula AS A 
    ON PT.Pessoa_Treinadora_ID = A.Pessoa_Treinadora_ID
INNER JOIN
    Modalidade AS M 
    ON A.Modalidade_ID = M.Modalidade_ID;

# 2 - Retorne o nome da pessoa treinadora e o período em que atua. Utilize as tabelas Pessoa_Treinadora, Aula, Horario.
SELECT
    CONCAT(PT.Nome, ' ', PT.Sobrenome) AS `Nome Treinadora`,
    H.Periodo
FROM
    Pessoa_Treinadora AS PT
INNER JOIN
    Aula AS A 
    ON PT.Pessoa_Treinadora_ID = A.Pessoa_Treinadora_ID
INNER JOIN
    Horario AS H 
    ON A.Horario_ID = H.Horario_ID;

# 3 - Retorne o nome de todas pessoas treinadoras e uma coluna com o nome 'Horario', mostrando o período em que a pessoa atua. Caso não tenha um horário estipulado, mostre 'EVENTUAL'. Por fim, ordene em forma alfabética-invertida pelo nome da pessoa. Utilize as tabelas Pessoa_Treinadora, Aula, Horario.
SELECT
    CONCAT(PT.Nome, ' ', PT.Sobrenome) AS `Nome Treinadora`,
    IFNULL(H.Periodo, 'EVENTUAL') AS `Horario`
FROM
    Pessoa_Treinadora AS PT
LEFT JOIN
    Aula AS A 
    ON PT.Pessoa_Treinadora_ID = A.Pessoa_Treinadora_ID
LEFT JOIN
    Horario AS H 
    ON A.Horario_ID = H.Horario_ID
ORDER BY
    `Nome Treinadora` DESC;

# 4 - Retorne o nome da modalidade e a quantidade de pessoas que a praticam, nomeie essa coluna como 'Pessoas' e ordena por essa coluna em ordem crescente. Utilize as Tabelas Modalidade e Treino.
SELECT
    M.Nome_modalidade AS `Modalidade`,
    COUNT(T.Pessoa_Associada_ID) AS `Pessoas`
FROM
    Modalidade AS M
LEFT JOIN
    Treino AS T 
    ON M.Modalidade_ID = T.Modalidade_ID
GROUP BY
    M.Nome_modalidade
ORDER BY
    `Pessoas` ASC;

# 5 - Retorne o nome da pessoa treinadora e a quantidade de pessoas associadas que participam de suas aulas, nomeie essa coluna como 'Pessoas'. Utilize as tabelas Pessoa_Treinadora, Treino, Aula.
SELECT
    CONCAT(PT.Nome, ' ', PT.Sobrenome) AS `Nome Treinadora`,
    COUNT(T.Pessoa_Associada_ID) AS `Pessoas`
FROM
    Pessoa_Treinadora AS PT
INNER JOIN
    Aula AS A 
    ON PT.Pessoa_Treinadora_ID = A.Pessoa_Treinadora_ID
INNER JOIN
    Treino AS T 
    ON A.Modalidade_ID = T.Modalidade_ID
GROUP BY
    PT.Pessoa_Treinadora_ID;

# 6 - Escreva uma query que retorne o nome da pessoa associada e o nome da pessoa treinadora responável pelo seu treino de acordo com a modalidade e o horário.
SELECT
    CONCAT(PA.Nome, ' ', PA.Sobrenome) AS `Nome Associado`,
    CONCAT(PT.Nome, ' ', PT.Sobrenome) AS `Nome Treinadora`
FROM
    Pessoa_Associada AS PA
INNER JOIN
    Treino AS T 
    ON PA.Pessoa_Associada_ID = T.Pessoa_Associada_ID
INNER JOIN
    Aula AS A 
    ON T.Modalidade_ID = A.Modalidade_ID
    AND T.Horario_ID = A.Horario_ID
INNER JOIN
    Pessoa_Treinadora AS PT 
    ON A.Pessoa_Treinadora_ID = PT.Pessoa_Treinadora_ID;
    