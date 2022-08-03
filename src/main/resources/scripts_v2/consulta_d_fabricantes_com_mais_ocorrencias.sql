# Fabricantes de aeronave com mais ocorrencias de acidente.

SELECT  a.aeronave_fabricante,
        COUNT(o.codigo_ocorrencia2) AS quantidade_ocorrencias
FROM        aeronave a
INNER JOIN  ocorrencia o
        ON(o.codigo_ocorrencia2 = a.codigo_ocorrencia2)
WHERE       o.ocorrencia_classificacao LIKE '%ACIDENTE%'
GROUP BY    a.aeronave_fabricante
ORDER BY    quantidade_ocorrencias DESC;