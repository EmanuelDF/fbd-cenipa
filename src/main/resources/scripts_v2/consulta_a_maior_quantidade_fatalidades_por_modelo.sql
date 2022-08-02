# Modelos de aeronaves ordenados por maior quantidade de fatalidades.

SELECT  CONCAT(a.aeronave_tipo_veiculo,' ',a.aeronave_modelo) AS aeronave_modelo,
        SUM(a.aeronave_fatalidades_total) AS quantidade_fatalidades,
        o.ocorrencia_uf
FROM        aeronave a
INNER JOIN  ocorrencia o
        ON  (a.codigo_ocorrencia2 = o.codigo_ocorrencia2)
WHERE   a.aeronave_fatalidades_total > 0
AND     o.ocorrencia_classificacao = 'ACIDENTE'
GROUP BY a.aeronave_tipo_veiculo, a.aeronave_modelo, o.ocorrencia_uf
ORDER BY quantidade_fatalidades DESC;