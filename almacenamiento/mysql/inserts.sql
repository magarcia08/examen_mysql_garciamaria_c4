USE examenn;

INSERT INTO empleados(id_empleado, nombre, apellido, tipo_empleado) VALUES 
(null, 'Jorge Alberto', 'Rita', 'celador'), 
(null, 'Alejandra Martinez', 'Gilberta', 'auxiliar_enfermeria'), 
(null, 'Fabio Toloza', 'Valderrama', 'celador'), 
(null, 'Karla Martinez','Rueda' , 'celador'), 
(null, 'Andrea', 'Merchan', 'auxiliar_enfermeria'), 
(null, 'patricia', 'rueda', 'administrativo');


INSERT INTO medicos (id_medico,  id_empleado_supervisor, nombre, apellido, tipo, especialidad ) VALUES 
(null, 2,'Maria', 'Garcia', 'titular' , 'Medicina General'), 
(null, 1,'Andres', 'Gelvez' , 'interino', 'Pediatria'),
(null, 1,'Fabian Andres', 'Carrillo', 'titular', 'Medicina General'), 
(null, 2,'Carrillo', 'Gomez' , 'interino', 'Optometria '), 
(null, 1,'Carlos', 'Alvarez', 'sustituto', 'Medicina General'),
(null, 2,'Camilo Andres', 'Suareaz' , 'sustituto', 'Medicina');


INSERT INTO paciente (id_paciente,  id_medico_asignado , nombre, apellido, fecha_nacimiento) VALUES
(null, 1 ,'Alberto', 'Jimenez', '2003-10-10'), 
(null, 2 ,'Felipe' ,'Ardila', '2001-11-11'), 
(null, 3 ,'felipe', 'aguila' , '1990-03-08'), 
(null, 1 ,'Camilo', 'Garcia', '2004-06-08');


INSERT INTO horarios_consulta (id_horario,id_medico, dia_semana, hora_inicio, hora_fin) VALUES 
(null, 2,'Lunes', '10:00', '10:30'),
(null, 2, 'Martes', '11:30', '12:00'),
(null, 1,'Jueves', '01:00', '01:30'),
(null, 3 ,'Miercoles', '02:00', '02:30'),
(null, 3, 'Viernes', '04:00', '04:30');
  
  

INSERT INTO sustituciones (id_sustitucion, id_medico_titular, id_medico_sustituto, fecha_inicio, fecha_fin) VALUES
(null, 1, 3, '2026-01-01', '2026-01-10'),
(null, 2, 1, '2026-02-03', '2026-02-12'),
(null, 3, 2, '2026-03-15', '2026-03-24');

 
INSERT INTO vacaciones (id_vacacion, id_persona, tipo_persona, dias, estado, fecha_inicio, fecha_fin) VALUES
(null, 3,  'medico', 5 , 'disfrutada', '2026-02-10', '2026-02-15'),
(null, 2, 'medico', 6, 'planificada', '2026-03-01', '2026-03-08'),
(null, 1, 'empleado', 10, 'disfrutada', '2026-03-15', '2026-03-25');
