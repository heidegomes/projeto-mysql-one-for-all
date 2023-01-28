SELECT  COUNT(DISTINCT cancoes.id_cancoes) AS 'cancoes', COUNT(DISTINCT artistas.id_artista) AS 'artistas', COUNT(DISTINCT albuns.id_album) AS 'albuns'
FROM SpotifyClone.Album AS albuns
INNER JOIN SpotifyClone.Artista AS artistas ON albuns.id_artista = artistas.id_artista 
INNER JOIN SpotifyClone.Cancoes AS cancoes ON cancoes.id_album = albuns.id_album;