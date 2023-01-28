SELECT (P.nome_usuario) AS 'usuario', 
IF (YEAR(MAX(H.data_reproducao)) >= '2021', 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.Perfil_do_usuario AS P
INNER JOIN SpotifyClone.Historico_de_reproducoes AS H ON P.id_usuario = H.id_usuario 
GROUP BY P.nome_usuario
ORDER BY P.nome_usuario;