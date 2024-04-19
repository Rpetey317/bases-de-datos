-- Obtener el padrón y apellido de el/los alumno/s que tenga/n la mayor cantidad de
-- materias aprobadas.

SELECT n.padron, a.apellido
FROM notas n
LEFT JOIN alumnos a ON n.padron = a.padron
WHERE n.nota >= 4
GROUP BY n.padron, a.apellido
HAVING COUNT(n.nota) >= ALL (
        SELECT COUNT(nota)
        FROM notas
        WHERE nota >= 4
        GROUP BY padron
    );

-- Resultados --
--  padron | apellido 
-- --------+----------
--   73000 | Molina
--   86000 | Díaz
-- (2 rows)
