// b) Percentual de ocorrências graves por tipo.

SELECT  motivo,
        CONCAT(
            REPLACE(
                TRUNCATE(quantidade_ocorrencias * 100 / total.soma, 2),
            '.', ','),
        '%') AS percentual
FROM    ocorrencias_graves_por_tipo_2021
CROSS JOIN (
    SELECT SUM(quantidade_ocorrencias) AS soma
    FROM ocorrencias_graves_por_tipo_2021) total
ORDER BY quantidade_ocorrencias DESC;
