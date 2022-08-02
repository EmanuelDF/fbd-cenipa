CREATE VIEW view_sumario_ocorrencias_por_tipo AS
    SELECT  a.aeronave_tipo_operacao    AS  tipo_operacao,
            COUNT(o.codigo_ocorrencia2) AS  quantidade_ocorrencias
    FROM    aeronave a
                INNER JOIN ocorrencia o
                           ON(o.codigo_ocorrencia2 = a.codigo_ocorrencia2)
    GROUP BY a.aeronave_tipo_operacao
    ORDER BY quantidade_ocorrencias DESC;

SELECT * FROM cenipa.ocorrencias_fatais_aeronaves;