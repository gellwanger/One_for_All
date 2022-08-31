SELECT 
    MIN(valor_plano) AS faturamento_minimo,
    ROUND(MAX(valor_plano), 2) AS faturamento_maximo,
    ROUND(AVG(valor_plano), 2) AS faturamento_medio,
    ROUND(SUM(plano.valor_plano), 2) AS faturamento_total
FROM
    SpotifyClone.plano
        JOIN
    SpotifyClone.usuario ON usuario.plano = plano.plano_id;