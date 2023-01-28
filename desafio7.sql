SELECT (A.nome_artista) AS 'artista', Al.nome_album AS 'album', COUNT(S.seguindo_artistas) AS 'seguidores'
FROM SpotifyClone.Artista AS A
INNER JOIN SpotifyClone.Album AS Al ON A.id_artista = Al.id_artista
INNER JOIN SpotifyClone.Seguindo AS S ON Al.id_artista = S.seguindo_artistas
GROUP BY Al.id_album
ORDER BY COUNT(S.seguindo_artistas) DESC, A.nome_artista, Al.nome_album;