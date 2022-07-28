/* ocorrencias agrupadas  por tipo, com classificacao grave no ano de 2021 */

select ot.ocorrencia_tipo as motivo,
count(o.codigo_ocorrencia1) as QtOcorrencias
from ocorrencia_tipo ot
inner join ocorrencia o on(o.codigo_ocorrencia1 = ot.codigo_ocorrencia1)
where 
o.ocorrencia_classificacao = 'INCIDENTE GRAVE'
and SUBSTRING(o.ocorrencia_dia, 7,10) = '2021'
group by ot.ocorrencia_tipo
order by 2 desc;