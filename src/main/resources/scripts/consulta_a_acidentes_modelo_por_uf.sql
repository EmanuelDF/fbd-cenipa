// a) Acidentes por modelo agrupados por UF.

SELECT  a.aeronave_tipo_veiculo           AS tipo_aeronave,
        a.aeronave_modelo                 AS modelo,
        o.ocorrencia_uf,
        SUM(a.aeronave_fatalidades_total) AS quantidade_fatalidades
FROM        aeronave a
INNER JOIN  ocorrencia o
        ON  (a.codigo_ocorrencia2 = o.codigo_ocorrencia2)
WHERE   a.aeronave_fatalidades_total > 0
AND     o.ocorrencia_classificacao = 'ACIDENTE'
GROUP BY a.aeronave_tipo_veiculo, a.aeronave_modelo, o.ocorrencia_uf
ORDER BY 3;