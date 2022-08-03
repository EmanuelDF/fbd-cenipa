# Percentual de ocorrências graves por tipo.

SELECT  motivo,
        CONCAT(
            REPLACE(
                TRUNCATE(quantidade_ocorrencias * 100 / total.soma, 2),
            '.', ','),
        '%') AS percentual
FROM    view_ocorrencias_graves_por_tipo_em_2021
CROSS JOIN (
    SELECT SUM(quantidade_ocorrencias) AS soma
    FROM view_ocorrencias_graves_por_tipo_em_2021) total
ORDER BY quantidade_ocorrencias DESC;
