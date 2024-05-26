SELECT i.cpf, i.nome
FROM individuo i
WHERE i.cpf NOT IN (
    SELECT p.individuo
    FROM processo_judicial p
    WHERE p.procedencia = 'culpado'
)
AND i.cpf NOT IN (
    SELECT c.individuo
    FROM candidato c
);