SELECT
    i.cpf,
    i.nome AS nome_candidato,
    i.data_nasc,
    i.nacionalidade,
    i.telefone,
    ca.nome AS nome_cargo,
    c.ano,
    p.resultado_votos
FROM
    candidatura c
    JOIN individuo i ON c.candidato = i.cpf
    JOIN cargo ca ON c.cargo = ca.codigo
    JOIN pleito p ON c.pleito = p.codigo
WHERE
    (c.cargo, c.ano, p.resultado_votos) IN (
        SELECT
            c2.cargo,
            c2.ano,
            MAX(p2.resultado_votos)
        FROM
            candidatura c2
            JOIN pleito p2 ON c2.pleito = p2.codigo
        GROUP BY
            c2.cargo,
            c2.ano
    );