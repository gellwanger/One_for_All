SELECT 
    artista_nome AS artista,
    album_nome AS album,
    COUNT(seguindo_artistas) AS seguidores
FROM
    SpotifyClone.artista
        JOIN
    SpotifyClone.album ON album.artista = artista.artista_id
        JOIN
    SpotifyClone.seguindo ON artista.artista_id = seguindo.seguindo_artistas
GROUP BY album_nome , artista_nome
ORDER BY seguidores DESC , artista, album_nome;