SELECT ROUND(MIN(P.valor_plano),2) AS 'faturamento_minimo', ROUND(MAX(P.valor_plano),2) AS 'faturamento_maximo', ROUND(AVG(P.valor_plano),2) AS 'faturamento_medio', ROUND(SUM(P.valor_plano),2) AS 'faturamento_total'
FROM SpotifyClone.Plano AS P
INNER JOIN SpotifyClone.Perfil_do_usuario AS U ON P.id_plano = U.id_plano;