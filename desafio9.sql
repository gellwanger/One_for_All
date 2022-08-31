SELECT 
    COUNT(historico_reproducao) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.usuario
        JOIN
    SpotifyClone.reproducao ON usuario.usuario_id = reproducao.usuario_id
WHERE
    nome = 'Bill';