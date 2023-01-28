SELECT COUNT(H.cancoes_reproduzidas) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.Historico_de_reproducoes AS H
INNER JOIN SpotifyClone.Perfil_do_usuario AS P ON H.id_usuario = P.id_usuario
WHERE P.nome_usuario = 'Barbara Liskov';