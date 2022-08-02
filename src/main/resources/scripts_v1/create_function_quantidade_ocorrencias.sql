DELIMITER $$
CREATE FUNCTION quantidade_ocorrencias(tipoAeronave CHAR(70))
    RETURNS INT
    DETERMINISTIC
BEGIN
    DECLARE quantidade INT;
    SELECT SUM(a.aeronave_fatalidades_total) AS quantidade_fatalidades
    FROM aeronave a
        INNER JOIN ocorrencia o
        ON (a.codigo_ocorrencia2 = o.codigo_ocorrencia2)
    WHERE a.aeronave_tipo_veiculo = tipoAeronave
    INTO quantidade;
    RETURN quantidade;
END $$
DELIMITER ;