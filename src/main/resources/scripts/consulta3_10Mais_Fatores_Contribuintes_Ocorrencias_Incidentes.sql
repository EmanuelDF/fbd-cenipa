/* Os 10 principais fatores contribuintes para gerar ocorrencias de incidentes */
select 
fc.fator_area as fator_area,
fc.fator_nome as fator_nome,
count(o.codigo_ocorrencia3) as QtOcorrencias
from fator_contribuinte fc
inner join ocorrencia o on(o.codigo_ocorrencia3 = fc.codigo_ocorrencia3)
where o.ocorrencia_classificacao LIKE '%INCIDENTE%'
group by fator_area, fc.fator_nome
order by 3 desc
LIMIT 10;