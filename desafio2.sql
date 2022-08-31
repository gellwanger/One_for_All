SELECT 
    COUNT(musica_id) AS cancoes,
    (SELECT 
            COUNT(artista_nome)
        FROM
            SpotifyClone.artista) AS artistas,
    (SELECT 
            COUNT(album_id)
        FROM
            SpotifyClone.album) AS albuns
FROM
    SpotifyClone.musicas;