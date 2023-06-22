SELECT  COUNT(DISTINCT cancoes.id_cancoes) AS 'cancoes', COUNT(DISTINCT artistas.id_artista) AS 'artistas', COUNT(DISTINCT albuns.id_album) AS 'albuns'
FROM SpotifyClone.Album AS albuns
INNER JOIN SpotifyClone.Artista AS artistas ON albuns.id_artista = artistas.id_artista 
INNER JOIN SpotifyClone.Cancoes AS cancoes ON cancoes.id_album = albuns.id_album;

SELECT (P.nome_usuario) AS 'usuario', COUNT(H.id_usuario) AS 'qt_de_musicas_ouvidas', ROUND (SUM(C.duracao_segundos)/60, 2) AS 'total_minutos'
FROM SpotifyClone.Perfil_do_usuario AS P
INNER JOIN SpotifyClone.Historico_de_reproducoes AS H ON P.id_usuario = H.id_usuario 
INNER JOIN SpotifyClone.Cancoes AS C ON C.id_cancoes = H.cancoes_reproduzidas
GROUP BY P.nome_usuario
ORDER BY P.nome_usuario;

SELECT (P.nome_usuario) AS 'usuario', 
IF (YEAR(MAX(H.data_reproducao)) >= '2021', 'usuario ativo', 'ususario inativo') AS 'status_usuario'
FROM SpotifyClone.Perfil_do_usuario AS P
INNER JOIN SpotifyClone.Historico_de_reproducoes AS H ON P.id_usuario = H.id_usuario 
GROUP BY P.nome_usuario
ORDER BY P.nome_usuario;

SELECT (C.nome_cancao) AS 'cancao',COUNT(H.id_usuario) AS 'reproducoes'
FROM SpotifyClone.Cancoes AS C
INNER JOIN SpotifyClone.Historico_de_reproducoes AS H ON C.id_cancoes = H.cancoes_reproduzidas
GROUP BY C.nome_cancao
ORDER BY COUNT(H.id_usuario) DESC, C.nome_cancao
LIMIT 2;
 
SELECT MIN(ROUND(P.valor_plano)) AS 'faturamento_minimo', ROUND(MAX(P.valor_plano),2) AS 'faturamento_maximo', ROUND(AVG(P.valor_plano),2) AS 'faturamento_medio', ROUND(SUM(P.valor_plano),2) AS 'faturamento_total'
FROM SpotifyClone.Plano AS P
INNER JOIN SpotifyClone.Perfil_do_usuario AS U ON P.id_plano = U.id_plano;

SELECT (A.nome_artista) AS 'artista', Al.nome_album AS 'album', COUNT(S.seguindo_artistas) AS 'seguidores'
FROM SpotifyClone.Artista AS A
INNER JOIN SpotifyClone.Album AS Al ON A.id_artista = Al.id_artista
INNER JOIN SpotifyClone.Seguindo AS S ON Al.id_artista = S.seguindo_artistas
GROUP BY Al.id_album
ORDER BY COUNT(S.seguindo_artistas) DESC, A.nome_artista, Al.nome_album;

SELECT (A.nome_artista) AS 'artista', Al.nome_album AS 'album'
FROM SpotifyClone.Artista AS A
INNER JOIN SpotifyClone.Album AS Al ON A.id_artista = Al.id_artista
WHERE A.nome_artista = 'Elis Regina';

SELECT COUNT(H.cancoes_reproduzidas) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.Historico_de_reproducoes AS H
INNER JOIN SpotifyClone.Perfil_do_usuario AS P ON H.id_usuario = P.id_usuario
WHERE P.nome_usuario = 'Barbara Liskov';

SELECT C.nome_cancao AS 'nome', COUNT(H.cancoes_reproduzidas) AS 'reproducoes'
FROM SpotifyClone.Cancoes AS C
INNER JOIN SpotifyClone.Historico_de_reproducoes AS H ON C.id_cancoes = H.cancoes_reproduzidas
INNER JOIN SpotifyClone.Perfil_do_usuario AS P ON P.id_usuario = H.id_usuario
WHERE P.id_plano = 1 OR P.id_plano = 4
GROUP BY C.nome_cancao
ORDER BY C.nome_cancao;