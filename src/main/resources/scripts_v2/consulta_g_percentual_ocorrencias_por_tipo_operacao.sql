// Percentual de ocorrências agrupadas por tipo de operação.

SELECT  tipo_operacao,
        CONCAT(
            REPLACE(
                TRUNCATE(quantidade_ocorrencias * 100 / total.soma, 2),
            '.', ','),
        '%') AS percentual
FROM    view_sumario_ocorrencias_por_tipo
    CROSS JOIN (
    SELECT SUM(quantidade_ocorrencias) AS soma
    FROM view_sumario_ocorrencias_por_tipo) total
ORDER BY quantidade_ocorrencias DESC;