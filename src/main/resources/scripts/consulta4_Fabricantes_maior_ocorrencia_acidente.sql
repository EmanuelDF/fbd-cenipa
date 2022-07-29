 /* Fabricantes de aeronave com mais ocorrencias de acidente*/
 select 
a.aeronave_fabricante,
count(o.codigo_ocorrencia2) as QtOcorrencias
from  aeronave a
inner join ocorrencia o on(o.codigo_ocorrencia2 = a.codigo_ocorrencia2)
where o.ocorrencia_classificacao LIKE '%ACIDENTE%'
group by a.aeronave_fabricante
order by 2 desc
LIMIT 2;