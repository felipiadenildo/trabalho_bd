SELECT c.ano, i.nome AS candidato, ca.nome AS cargo
FROM candidatura c
JOIN individuo i ON c.candidato = i.cpf
JOIN cargo ca ON c.cargo = ca.codigo
ORDER BY ca.nome;