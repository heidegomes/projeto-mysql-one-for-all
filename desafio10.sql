SELECT C.nome_cancao AS 'nome', COUNT(H.cancoes_reproduzidas) AS 'reproducoes'
FROM SpotifyClone.Cancoes AS C
INNER JOIN SpotifyClone.Historico_de_reproducoes AS H ON C.id_cancoes = H.cancoes_reproduzidas
INNER JOIN SpotifyClone.Perfil_do_usuario AS P ON P.id_usuario = H.id_usuario
WHERE P.id_plano = 1 OR P.id_plano = 4
GROUP BY C.nome_cancao
ORDER BY C.nome_cancao;