SELECT 
    musica_nome AS nome, 
    COUNT(musica_id) AS reproducoes
FROM
    SpotifyClone.musicas
        JOIN
    SpotifyClone.reproducao ON historico_reproducao = musica_id
        JOIN
    SpotifyClone.usuario ON reproducao.usuario_id = usuario.usuario_id
WHERE
    plano IN (1 , 3)
GROUP BY musica_nome
ORDER BY musica_nome;