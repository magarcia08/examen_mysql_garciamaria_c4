-- 1. Número de pacientes atendidos por cada médico.
SELECT m.nombre, m.apellido, p.nombre, p.apellido
FROM medicos m
JOIN paciente p ON m.id_medico = p.id_medico_asignado;


-- 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado.
SELECT e.nombre, e.apellido, v.dias, v.estado
FROM empleados e
JOIN vacaciones v ON e.id_empleado = v.id_persona
WHERE v.tipo_persona = 'empleado';


-- 3. Médicos con mayor cantidad de horas de consulta en la semana.
SELECT m.nombre, m.apellido, h.dia_semana, h.hora_inicio, h.hora_fin
FROM medicos m
JOIN horarios_consulta h ON m.id_medico = h.id_medico;


-- 4. Número de sustituciones realizadas por cada médico sustituto.
SELECT t.nombre  AS titular,
       s2.nombre AS sustituto,
       s.fecha_inicio,
       s.fecha_fin
FROM sustituciones s
JOIN medicos t  ON s.id_medico_titular   = t.id_medico
JOIN medicos s2 ON s.id_medico_sustituto = s2.id_medico;


-- 5. Número de médicos que están actualmente en sustitución.
SELECT m.nombre, m.apellido
FROM medicos m
JOIN sustituciones s ON m.id_medico = s.id_medico_sustituto
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;


-- 6. Horas totales de consulta por médico por día de la semana.
SELECT m.nombre, m.apellido, h.hora_inicio, h.hora_fin
FROM medicos m
JOIN horarios_consulta h ON m.id_medico = h.id_medico
WHERE h.dia_semana = 'Lunes';


-- 7. Médico con mayor cantidad de pacientes asignados.
SELECT m.nombre, m.apellido, COUNT(p.id_paciente) AS total_pacientes
FROM medicos m
LEFT JOIN paciente p ON m.id_medico = p.id_medico_asignado
GROUP BY m.id_medico;
