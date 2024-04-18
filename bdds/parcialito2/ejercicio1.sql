-- Obtener el padrón y apellido de el/los alumno/s que tenga/n la mayor cantidad de
-- materias aprobadas.

select padron, apellido
from alumnos
where padron in (
    select padron
    from notas
    group by padron
    having count(nota) >= all (
                select count(nota)
                from notas
                group by padron
                )
);
