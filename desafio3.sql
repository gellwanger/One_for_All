SELECT 
    nome AS usuario,
    COUNT(historico_reproducao) AS qtde_musicas_ouvidas,
    ROUND(SUM(duracao_segundos) / 60, 2) AS total_minutos
FROM
    SpotifyClone.reproducao
        JOIN
    SpotifyClone.usuario ON usuario.usuario_id = reproducao.usuario_id
        JOIN
    SpotifyClone.musicas ON musicas.musica_id = reproducao.historico_reproducao
GROUP BY nome
ORDER BY nome;