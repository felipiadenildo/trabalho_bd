SELECT i.cpf, i.nome
FROM individuo i
LEFT JOIN processo_judicial pj ON i.cpf = pj.individuo
WHERE pj.individuo IS NULL
AND i.cpf NOT IN (
    SELECT c.individuo
    FROM candidato c
);
