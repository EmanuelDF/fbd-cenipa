create view ocorrencias_fatais_aeronaves as
select 
a.codigo_ocorrencia2 as ocorrencia, 
a.aeronave_registro_categoria as categoria,
a.aeronave_tipo_veiculo as tipo_aeronave, 
a.aeronave_fabricante as fabricante,
a.aeronave_modelo as modelo,
a.aeronave_motor_quantidade as motor,
a.aeronave_pais_fabricante as pais_fabricante,
a.aeronave_tipo_operacao as tipo_operacao,
a.aeronave_fatalidades_total as qtd_fatalidades,
o.ocorrencia_pais as local_ocorrencia,
o.investigacao_aeronave_liberada as aeronave_liberada,
o.divulgacao_dia_publicacao as divulgacao_ocorrencia
 from aeronave a
 inner join ocorrencia o on(a.codigo_ocorrencia2 = o.codigo_ocorrencia2) 
 where a.aeronave_fatalidades_total > 0;
 
 
 select * from cenipa.ocorrencias_fatais_aeronaves;