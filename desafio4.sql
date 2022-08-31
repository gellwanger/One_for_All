SELECT 
    nome AS usuario,
    CASE
        WHEN MAX(YEAR(data_ultima_reproducao)) = 2021 THEN 'Usuário ativo'
        ELSE 'Usuário inativo'
    END AS condicao_usuario
FROM
    SpotifyClone.reproducao
        JOIN
    SpotifyClone.usuario ON usuario.usuario_id = reproducao.usuario_id
GROUP BY nome
ORDER BY nome;