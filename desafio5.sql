SELECT (C.nome_cancao) AS 'cancao',COUNT(H.id_usuario) AS 'reproducoes'
FROM SpotifyClone.Cancoes AS C
INNER JOIN SpotifyClone.Historico_de_reproducoes AS H ON C.id_cancoes = H.cancoes_reproduzidas
GROUP BY C.nome_cancao
ORDER BY COUNT(H.id_usuario) DESC, C.nome_cancao
LIMIT 2;