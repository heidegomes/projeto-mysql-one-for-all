SELECT (A.nome_artista) AS 'artista', Al.nome_album AS 'album'
FROM SpotifyClone.Artista AS A
INNER JOIN SpotifyClone.Album AS Al ON A.id_artista = Al.id_artista
WHERE A.nome_artista = 'Elis Regina';