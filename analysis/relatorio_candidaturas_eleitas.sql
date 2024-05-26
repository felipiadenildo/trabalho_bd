SELECT c.codigo, i.nome AS candidato, ca.nome AS cargo, i_vice.nome AS vice_candidato
FROM candidatura c
JOIN individuo i ON c.candidato = i.cpf
JOIN cargo ca ON c.cargo = ca.codigo
LEFT JOIN individuo i_vice ON c.vice_candidato = i_vice.cpf
WHERE c.codigo IN (
    SELECT c.codigo
    FROM candidatura c
    JOIN pleito p ON c.pleito = p.codigo
    WHERE p.resultado_votos > 0 -- Assumindo que um resultado positivo indica uma eleição
);