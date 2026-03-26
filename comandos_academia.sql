# Exercícios

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