-- Se necesita saber el promedio general para cada carrera y cada departamento.
-- Devolviendo código de carrera, código de departamento, y el promedio de notas para
-- todos los alumnos de cada departamneto, ordenados por carrera y departamento.
-- Nota: no considerar combinaciones de departamento / carrera tal que no haya alumnos
-- de dicha carrera con notas en dicho departamento.
-- Nota 2: Si un alumno está inscripto en más de una carrera, sus notas aportan a los
-- promedios de todas esas carreras.

SELECT i.codigo as codigo_carrera, n.codigo as codigo_dpto, ROUND(AVG(nota), 2) as promedio
FROM notas n
LEFT JOIN inscripto_en i ON n.padron = i.padron
GROUP BY i.codigo, n.codigo
ORDER BY codigo_carrera, codigo_dpto;

-- Resultados --
--  codigo_carrera | codigo_dpto | promedio 
-- ----------------+-------------+----------
--               5 |          61 |     7.00
--               5 |          62 |     7.25
--               6 |          61 |     8.80
--               6 |          62 |     7.00
--               9 |          71 |     6.71
--               9 |          75 |     6.69
--              10 |          71 |     6.75
--              10 |          75 |     6.50
-- (8 rows)
