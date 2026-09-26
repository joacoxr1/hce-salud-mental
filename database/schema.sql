-- Prototipo base de datos

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    rol ENUM('MEDICO_GUARDIA', 'PSIQUIATRA', 'PSICOLOGO', 'ENFERMERO', 'ADMIN') NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE internaciones (
    id_internacion INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico_ingreso INT NOT NULL,
    id_profesional_tratante INT,
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_egreso DATETIME NULL,
    estado ENUM('ACTIVA', 'EGRESADA', 'DERIVADA') DEFAULT 'ACTIVA',
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_medico_ingreso) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_profesional_tratante) REFERENCES usuarios(id_usuario)
);

CREATE TABLE evoluciones (
    id_evolucion INT AUTO_INCREMENT PRIMARY KEY,
    id_internacion INT NOT NULL,
    id_autor INT NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    tipo_evolucion ENUM('MEDICA', 'ENFERMERIA', 'INDICACION_GUARDIA') NOT NULL,
    descripcion TEXT NOT NULL,
    estado ENUM('ORIGINAL', 'CORREGIDA', 'ANULADA') DEFAULT 'ORIGINAL',
    id_evolucion_referencia INT NULL,
    FOREIGN KEY (id_internacion) REFERENCES internaciones(id_internacion),
    FOREIGN KEY (id_autor) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_evolucion_referencia) REFERENCES evoluciones(id_evolucion)
);