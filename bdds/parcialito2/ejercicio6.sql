-- Listar el padrón de aquellos alumnos que, por lo menos, tienen nota en todas las
-- materias que aprobó el alumno de padrón 71000.

SELECT distinct n1.padron
FROM notas n1
WHERE NOT EXISTS(
    (
    SELECT codigo, numero
    FROM notas n2
    WHERE n2.padron = 71000 AND nota >= 4
    ) EXCEPT (
    SELECT codigo, numero
    FROM notas n3
    WHERE n1.padron = n3.padron
    )
) ORDER BY n1.padron;
 
-- Resultados --
-- padron 
----------
--  71000
--  72000
--  73000
--  75000
--  88000
--(5 rows)
