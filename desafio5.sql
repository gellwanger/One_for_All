SELECT 
    musica_nome AS cancao, COUNT(musica_id) AS reproducoes
FROM
    SpotifyClone.musicas
        JOIN
    SpotifyClone.reproducao ON reproducao.historico_reproducao = musicas.musica_id
GROUP BY musica_nome
ORDER BY reproducoes DESC , musica_nome
LIMIT 2;