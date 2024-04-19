-- Obtener el padrón y apellido de aquellos alumnos que tienen nota en las materias 71.14
-- y 71.15 y no tienen nota ni en la materia 75.01 ni en 75.15.

-- select padron, apellido
-- from alumnos
-- where padron in (
--         select distinct padron
--         from notas
--         where codigo = 71 and numero = 14
--     INTERSECT
--         select distinct padron
--         from notas
--         where codigo = 71 and numero = 15
-- ) and padron not in (
--     select distinct padron
--     from notas
--     where (codigo = 75 and numero = 1) or
--         (codigo = 75 and numero = 15)
-- );

select padron, apellido
from alumnos a
where not exists (
    select 71, 14 union select 71, 15
    except
    select n.codigo, n.numero
    from notas n
    where n.padron = a.padron and (n.codigo = 71 and n.numero in (14, 15))
) and not exists (
    select 1
    from notas n
    where n.padron = a.padron and (n.codigo = 75 and n.numero in (1, 15))
);

-- Resultados --
--  padron | apellido 
-- --------+----------
--   86000 | Díaz
-- (1 row)
