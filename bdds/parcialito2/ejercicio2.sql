-- Obtener el padrón y apellido de aquellos alumnos que tienen nota en las materias 71.14
-- y 71.15 y no tienen nota ni en la materia 75.01 ni en 75.15.

-- SELECT padron, apellido
-- FROM alumnos
-- WHERE padron IN (
--         SELECT distinct padron
--         FROM notas
--         WHERE codigo = 71 AND numero = 14
--     INTERSECT
--         SELECT distinct padron
--         FROM notas
--         WHERE codigo = 71 AND numero = 15
-- ) AND padron NOT IN (
--     SELECT distinct padron
--     FROM notas
--     WHERE (codigo = 75 AND numero = 1) or
--         (codigo = 75 AND numero = 15)
-- );

SELECT padron, apellido
FROM alumnos a
WHERE NOT EXISTS (
    SELECT 71, 14 union SELECT 71, 15
    EXCEPT
    SELECT n.codigo, n.numero
    FROM notas n
    WHERE n.padron = a.padron AND (n.codigo = 71 AND n.numero IN (14, 15))
) AND NOT EXISTS (
    SELECT 1
    FROM notas n
    WHERE n.padron = a.padron AND (n.codigo = 75 AND n.numero IN (1, 15))
);

-- Resultados --
--  padron | apellido 
-- --------+----------
--   86000 | Díaz
-- (1 row)
