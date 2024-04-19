-- Mostrar el padrón, apellido y promedio para aquellos alumnos que tienen nota en más
-- de 3 materias y un promedio de al menos 5.

SELECT n.padron, a.apellido, ROUND(AVG(nota), 2) as promedio
FROM notas n
LEFT JOIN alumnos a ON n.padron = a.padron
GROUP BY n.padron, a.apellido
having COUNT(n.nota) > 3 AND AVG(n.nota) >= 5
ORDER BY padron;

-- Resultados --
--  padron | apellido  | promedio 
-- --------+-----------+----------
--   73000 | Molina    |     6.60
--   75000 | Onelli    |     5.20
--   83000 | Gómez     |     8.50
--   84000 | López     |     7.50
--   85000 | Fernández |     8.25
--   86000 | Díaz      |     7.80
--   87000 | Hernández |     7.50
--   88000 | Vargas    |     8.25
-- (8 rows)
