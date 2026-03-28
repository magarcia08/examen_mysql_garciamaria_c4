CREATE DATABASE IF NOT EXISTS examenn;

USE examenn;

CREATE TABLE empleados (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  nombre  VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  tipo_empleado ENUM('ATS', 'auxiliar_enfermeria', 'celador', 'administrativo') NOT NULL
);

CREATE TABLE medicos (
  id_medico INT AUTO_INCREMENT PRIMARY KEY,
  id_empleado_supervisor INT,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  tipo  ENUM('titular', 'interino', 'sustituto') NOT NULL,
  especialidad VARCHAR(100),
  FOREIGN KEY (id_empleado_supervisor) REFERENCES empleados(id_empleado)
);

CREATE TABLE paciente (
  id_paciente  INT AUTO_INCREMENT PRIMARY KEY,
  id_medico_asignado INT,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE,
  FOREIGN KEY (id_medico_asignado) REFERENCES medicos(id_medico)
);

CREATE TABLE horarios_consulta (
  id_horario INT AUTO_INCREMENT PRIMARY KEY,
  id_medico INT NOT NULL,
  dia_semana ENUM('Lunes','Martes','Miercoles', 'Jueves','Viernes') NOT NULL,
  hora_inicio TIME NOT NULL,
  hora_fin TIME NOT NULL,
  FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

CREATE TABLE sustituciones (
  id_sustitucion INT AUTO_INCREMENT PRIMARY KEY,
  id_medico_titular INT NOT NULL,
  id_medico_sustituto INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  FOREIGN KEY (id_medico_titular)   REFERENCES medicos(id_medico),
  FOREIGN KEY (id_medico_sustituto) REFERENCES medicos(id_medico)
);

CREATE TABLE vacaciones (
  id_vacacion INT AUTO_INCREMENT PRIMARY KEY,
  id_persona INT NOT NULL,
  tipo_persona ENUM('medico', 'empleado') NOT NULL,
  dias INT NOT NULL,
  estado ENUM('planificada', 'disfrutada') NOT NULL,
  fecha_inicio DATE,
  fecha_fin DATE
);
