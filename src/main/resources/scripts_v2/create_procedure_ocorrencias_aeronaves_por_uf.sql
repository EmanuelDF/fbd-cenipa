DELIMITER $$
    CREATE PROCEDURE ocorrencias_aeronave_uf (IN uf TEXT)
    BEGIN
    SELECT * FROM cenipa.ocorrencia o
    WHERE o.ocorrencia_uf = uf;
END $$
DELIMITER ;

CALL ocorrencias_aeronave_uf('MG');