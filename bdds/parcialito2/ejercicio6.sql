-- Listar el padrón de aquellos alumnos que, por lo menos, tienen nota en todas las
-- materias que aprobó el alumno de padrón 71000.

select distinct n1.padron
from notas n1
where not exists(
    (
    select codigo, numero
    from notas n2
    where n2.padron = 71000 and nota >= 4
    ) except (
    select codigo, numero
    from notas n3
    where n1.padron = n3.padron
    )
) order by n1.padron;
 
-- Resultados --
-- padron 
----------
--  71000
--  72000
--  73000
--  75000
--  88000
--(5 rows)
