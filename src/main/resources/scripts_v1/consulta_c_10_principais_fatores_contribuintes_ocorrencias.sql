// c) Os 10 principais fatores contribuintes geradores de ocorrências de incidentes.

SELECT  fc.fator_area AS fator_area,
        fc.fator_nome AS fator_nome,
        COUNT(o.codigo_ocorrencia3) AS quantidade_ocorrencias
FROM    fator_contribuinte fc
INNER JOIN  ocorrencia o
        ON  (o.codigo_ocorrencia3 = fc.codigo_ocorrencia3)
WHERE       o.ocorrencia_classificacao LIKE '%INCIDENTE%'
GROUP BY    fator_area, fc.fator_nome
ORDER BY    3 DESC
LIMIT 10;