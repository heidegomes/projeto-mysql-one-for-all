SELECT (P.nome_usuario) AS 'usuario', COUNT(H.id_usuario) AS 'qt_de_musicas_ouvidas', ROUND (SUM(C.duracao_segundos)/60, 2) AS 'total_minutos'
FROM SpotifyClone.Perfil_do_usuario AS P
INNER JOIN SpotifyClone.Historico_de_reproducoes AS H ON P.id_usuario = H.id_usuario 
INNER JOIN SpotifyClone.Cancoes AS C ON C.id_cancoes = H.cancoes_reproduzidas
GROUP BY P.nome_usuario
ORDER BY P.nome_usuario;