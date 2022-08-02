DELIMITER $
CREATE TRIGGER incluir_ocorrencia AFTER INSERT
ON aeronave
FOR EACH ROW
BEGIN
    INSERT INTO ocorrencia_fatalidade_quantidade
        (ocorrencia_fatalidade_quantidade_tipo, ocorrencia_fatalidade_quantidade_qtd)
    VALUES
        (new.aeronave_tipo_veiculo,
        (select quantidade_ocorrencias(new.aeronave_tipo_veiculo) from dual));
END$
DELIMITER ;

