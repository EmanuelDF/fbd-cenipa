DELIMITER $$

CREATE PROCEDURE ocorrencias_aeronave_uf (IN uf TEXT)
BEGIN
SELECT * FROM cenipa.ocorrencia o
where o.ocorrencia_uf = uf;
END $$
DELIMITER ;