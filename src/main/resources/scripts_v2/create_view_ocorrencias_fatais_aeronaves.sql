CREATE VIEW view_ocorrencias_fatais_por_aeronave AS
    SELECT a.codigo_ocorrencia2     AS ocorrencia,
    a.aeronave_registro_categoria   AS categoria,
    a.aeronave_tipo_veiculo         AS tipo_aeronave,
    a.aeronave_fabricante           AS fabricante,
    a.aeronave_modelo               AS modelo,
    a.aeronave_motor_quantidade     AS motor,
    a.aeronave_pais_fabricante      AS pais_fabricante,
    a.aeronave_tipo_operacao        AS tipo_operacao,
    a.aeronave_fatalidades_total    AS qtd_fatalidades,
    o.ocorrencia_pais               AS local_ocorrencia,
    o.investigacao_aeronave_liberada AS aeronave_liberada,
    o.divulgacao_dia_publicacao     AS divulgacao_ocorrencia
 FROM       aeronave a
 INNER JOIN ocorrencia o
    ON (a.codigo_ocorrencia2 = o.codigo_ocorrencia2)
 WHERE a.aeronave_fatalidades_total > 0;

SELECT * FROM view_ocorrencias_fatais_por_aeronave;