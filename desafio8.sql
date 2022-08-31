SELECT 
    artista_nome AS artista, album_nome AS album
FROM
    SpotifyClone.artista
        JOIN
    SpotifyClone.album ON album.artista = artista.artista_id
WHERE
    artista_nome = 'Walter Phoenix'
ORDER BY album_nome;