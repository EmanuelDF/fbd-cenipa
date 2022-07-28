
select 
a.aeronave_tipo_veiculo as tipo_aeronave, 
a.aeronave_modelo as modelo,
o.ocorrencia_uf,
sum(a.aeronave_fatalidades_total) as qtdFatalidade
 from aeronave a
 inner join ocorrencia o on(a.codigo_ocorrencia2 = o.codigo_ocorrencia2) 
 where a.aeronave_fatalidades_total > 0
 and o.ocorrencia_classificacao = 'ACIDENTE'
 group by a.aeronave_tipo_veiculo, a.aeronave_modelo, o.ocorrencia_classificacao
 order by 4 DESC;