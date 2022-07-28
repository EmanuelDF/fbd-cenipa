DELIMITER $$

CREATE PROCEDURE Ocorrencias_Aeronave_porUF (IN uf TEXT)
BEGIN
SELECT * FROM cenipa.ocorrencia o
where o.ocorrencia_uf = uf;
END $$
DELIMITER ;