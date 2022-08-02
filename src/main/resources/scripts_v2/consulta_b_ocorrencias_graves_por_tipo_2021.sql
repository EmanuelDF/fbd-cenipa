# Ocorrências agrupadas por tipo, com classificação grave no ano de 2021.

SELECT  ot.ocorrencia_tipo AS motivo,
        COUNT(o.codigo_ocorrencia1) AS quantidade_ocorrencias
FROM        ocorrencia_tipo ot
INNER JOIN  ocorrencia o
        ON  (o.codigo_ocorrencia1 = ot.codigo_ocorrencia1)
WHERE   o.ocorrencia_classificacao = 'INCIDENTE GRAVE'
AND     SUBSTRING(o.ocorrencia_dia, 7,10) = '2021'
GROUP BY ot.ocorrencia_tipo
ORDER BY quantidade_ocorrencias DESC;