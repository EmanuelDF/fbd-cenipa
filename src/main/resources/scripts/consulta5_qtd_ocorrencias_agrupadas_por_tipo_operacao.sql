 /* Quantidade de ocorrencias agrupadas por tipo de operacao*/
 select 
a.aeronave_tipo_operacao as tipo_operacao,
count(o.codigo_ocorrencia2) as QtOcorrencias
from  aeronave a
inner join ocorrencia o on(o.codigo_ocorrencia2 = a.codigo_ocorrencia2)
group by a.aeronave_tipo_operacao
order by 2 desc;