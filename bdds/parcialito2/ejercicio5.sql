-- Para cada nota del alumno más antiguo, mostrar su padrón, código de departamento,
-- número de materia y el valor de la nota.
-- Nota: En caso de que sean más de uno los alumnos más antiguos, mostrar dichos datos
-- para todos esos alumnos.
-- Nota 2: Si bien en la realidad puede darse que los valores de padrón sean estrictamente
-- crecientes en el tiempo. NO utilizar este criterio para determinar al alumno
-- más antiguo.

select n.padron, n.codigo, n.numero, n.nota
from notas n
where n.padron in (
    select padron
    from alumnos
    where fecha_ingreso = (
        select min(fecha_ingreso)
        from alumnos
    )
);

-- Resultados --
-- padron | codigo | numero | nota 
----------+--------+--------+------
--  71000 |     75 |      1 |    4
--  71000 |     75 |      6 |    2
--  71000 |     75 |      6 |    6
--  71000 |     71 |     14 |    7
--(4 rows)
