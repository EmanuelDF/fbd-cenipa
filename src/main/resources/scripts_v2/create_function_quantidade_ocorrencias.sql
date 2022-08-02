DELIMITER $$
CREATE FUNCTION quantidade_ocorrencias(tipoAeronave CHAR(70))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE qtd INT;
    SELECT SUM(a.aeronave_fatalidades_total) AS qtd_fatalidades
    FROM aeronave a
        INNER JOIN ocorrencia o
        ON (a.codigo_ocorrencia2 = o.codigo_ocorrencia2)
    WHERE a.aeronave_tipo_veiculo = tipoAeronave
    INTO qtd;
    RETURN qtd;
END $$
DELIMITER ;

SELECT quantidade_ocorrencias('AVIÃO') AS quantidade_ocorrencias_por_aviao
FROM dual;