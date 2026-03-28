-- 1. Pacientes por médico
SELECT m.nombre, m.apellido, COUNT(p.id_paciente) AS total_pacientes
FROM medicos m
LEFT JOIN paciente p ON m.id_medico = p.id_medico_asignado
GROUP BY m.id_medico;

-- 2. Vacaciones por empleado
SELECT e.nombre, e.apellido, v.estado, SUM(v.dias) AS total_dias
FROM empleados e
JOIN vacaciones v ON e.id_empleado = v.id_persona
GROUP BY e.id_empleado, v.estado;

-- 3. Horas de consulta por médico
SELECT m.nombre, m.apellido,
SUM(TIME_TO_SEC(TIMEDIFF(h.hora_fin, h.hora_inicio))) / 3600 AS horas
FROM medicos m
JOIN horarios_consulta h ON m.id_medico = h.id_medico
GROUP BY m.id_medico
ORDER BY horas DESC;

-- 4. Sustituciones por médico sustituto
SELECT m.nombre, m.apellido, COUNT(s.id_sustitucion) AS total
FROM medicos m
JOIN sustituciones s ON m.id_medico = s.id_medico_sustituto
GROUP BY m.id_medico;

-- 5. Cuántos médicos están en sustitución hoy
SELECT COUNT(DISTINCT id_medico_sustituto) AS total
FROM sustituciones
WHERE CURDATE() BETWEEN fecha_inicio AND fecha_fin;

-- 6. Horas de consulta por médico y día
SELECT m.nombre, h.dia_semana,
SUM(TIME_TO_SEC(TIMEDIFF(h.hora_fin, h.hora_inicio))) / 3600 AS horas
FROM medicos m
JOIN horarios_consulta h ON m.id_medico = h.id_medico
GROUP BY m.id_medico, h.dia_semana;

-- 7. Médico con más pacientes
SELECT m.nombre, m.apellido, COUNT(p.id_paciente) AS total
FROM medicos m
LEFT JOIN paciente p ON m.id_medico = p.id_medico_asignado
GROUP BY m.id_medico
ORDER BY total DESC
LIMIT 1;

-- 8. Empleados con más de 10 días disfrutados
SELECT e.nombre, e.apellido, SUM(v.dias) AS total
FROM empleados e
JOIN vacaciones v ON e.id_empleado = v.id_persona AND v.estado = 'disfrutada'
GROUP BY e.id_empleado
HAVING SUM(v.dias) > 10;

-- 9. Médicos haciendo sustitución hoy
SELECT m.nombre, m.apellido, s.fecha_inicio, s.fecha_fin
FROM medicos m
JOIN sustituciones s ON m.id_medico = s.id_medico_sustituto
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;

-- 10. Vacaciones por tipo de empleado
SELECT e.tipo_empleado, v.estado, SUM(v.dias) AS total
FROM empleados e
JOIN vacaciones v ON e.id_empleado = v.id_persona
GROUP BY e.tipo_empleado, v.estado;

-- 11. Pacientes por tipo de médico
SELECT m.tipo, COUNT(p.id_paciente) AS total
FROM medicos m
LEFT JOIN paciente p ON m.id_medico = p.id_medico_asignado
GROUP BY m.tipo;

-- 12. Sustituciones por tipo de médico
SELECT m.tipo, COUNT(s.id_sustitucion) AS total
FROM medicos m
JOIN sustituciones s ON m.id_medico = s.id_medico_sustituto
GROUP BY m.tipo;

-- 13. Pacientes por médico y especialidad
SELECT m.nombre, m.especialidad, COUNT(p.id_paciente) AS total
FROM medicos m
LEFT JOIN paciente p ON m.id_medico = p.id_medico_asignado
GROUP BY m.id_medico;

-- 14. Empleados y médicos con más de 20 días planificados
SELECT 'empleado' AS tipo, e.nombre, SUM(v.dias) AS total
FROM empleados e
JOIN vacaciones v ON e.id_empleado = v.id_persona AND v.estado = 'planificada'
GROUP BY e.id_empleado
HAVING SUM(v.dias) > 20
UNION ALL
SELECT 'medico', m.nombre, SUM(v.dias)
FROM medicos m
JOIN vacaciones v ON m.id_medico = v.id_persona AND v.estado = 'planificada'
GROUP BY m.id_medico
HAVING SUM(v.dias) > 20;

-- 15. Horas de consulta por especialidad y día
SELECT m.especialidad, h.dia_semana,
SUM(TIME_TO_SEC(TIMEDIFF(h.hora_fin, h.hora_inicio))) / 3600 AS horas
FROM medicos m
JOIN horarios_consulta h ON m.id_medico = h.id_medico
GROUP BY m.especialidad, h.dia_semana;
