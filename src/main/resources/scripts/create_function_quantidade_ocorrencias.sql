DELIMITER $$
CREATE FUNCTION qtd_ocorrencias (tipoAeronave CHAR(70))
RETURNS INT
DETERMINISTIC
BEGIN
 DECLARE qtd int;
select 
sum(a.aeronave_fatalidades_total) as qtd_fatalidades
 from aeronave a
 inner join ocorrencia o on(a.codigo_ocorrencia2 = o.codigo_ocorrencia2) 
 where a.aeronave_tipo_veiculo = tipoAeronave
 into qtd;
 return qtd;
END $$
DELIMITER