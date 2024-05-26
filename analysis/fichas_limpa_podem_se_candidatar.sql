SELECT
    i.cpf,
    i.nome,
    i.data_nasc,
    i.nacionalidade,
    i.telefone
FROM
    individuo i
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            processo_judicial pj
        WHERE
            pj.individuo = i.cpf
            AND (
                pj.data_termino IS NULL -- Processos em aberto
                OR pj.data_termino > CURRENT_DATE - INTERVAL '5 years' -- Processos encerrados nos últimos 5 anos              OR (pj.procedencia = 'culpado' AND pj.data_termino > CURRENT_DATE - INTERVAL '5 years') -- Culpado nos últimos 5 anos
            )
    )
    AND (
        EXISTS (
            SELECT
                1
            FROM
                processo_judicial pj
            WHERE
                pj.individuo = i.cpf
                AND (
                    pj.data_termino < CURRENT_DATE - INTERVAL '5 years' -- Processos encerrados há mais de 5 anos
                    OR pj.procedencia = 'inocente' -- Considerado inocente              )
                )
                OR NOT EXISTS (
                    SELECT
                        1
                    FROM
                        processo_judicial pj
                    WHERE
                        pj.individuo = i.cpf
                )
        )
    );