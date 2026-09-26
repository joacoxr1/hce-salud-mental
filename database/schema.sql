-- BASE DE DATOS Demo
CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo VARCHAR(50),
    contacto_familiar VARCHAR(255),
    fecha_alta_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol ENUM('MEDICO_GUARDIA', 'PSIQUIATRA', 'PSICOLOGO', 'ENFERMERIA', 'ADMIN') NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE profesional (
    id_profesional INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    matricula VARCHAR(50) UNIQUE,
    id_rol INT NOT NULL,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);

CREATE TABLE internacion (
    id_internacion INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_profesional_guardia INT NOT NULL,
    fecha_ingreso_guardia DATETIME DEFAULT CURRENT_TIMESTAMP,
    motivo_consulta_guardia TEXT,
    resumen_entrevista_guardia TEXT,
    derivado_a_pabellon BOOLEAN DEFAULT FALSE,
    fecha_ingreso_pabellon DATETIME NULL,
    id_profesional_tratante INT NULL,
    estado ENUM('EN_GUARDIA', 'INTERNADO', 'DE_ALTA') DEFAULT 'EN_GUARDIA',
    es_reingreso BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_profesional_guardia) REFERENCES profesional(id_profesional),
    FOREIGN KEY (id_profesional_tratante) REFERENCES profesional(id_profesional)
);

CREATE TABLE diagnostico (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    id_internacion INT NOT NULL,
    id_profesional INT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    descripcion TEXT NOT NULL,
    vigente BOOLEAN DEFAULT TRUE,
    id_diagnostico_anterior INT NULL,
    FOREIGN KEY (id_internacion) REFERENCES internacion(id_internacion),
    FOREIGN KEY (id_profesional) REFERENCES profesional(id_profesional),
    FOREIGN KEY (id_diagnostico_anterior) REFERENCES diagnostico(id_diagnostico)
);

CREATE TABLE indicacion_medica (
    id_indicacion INT AUTO_INCREMENT PRIMARY KEY,
    id_internacion INT NOT NULL,
    id_profesional INT NOT NULL,
    fecha_indicacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    droga VARCHAR(100) NOT NULL,
    dosis VARCHAR(100) NOT NULL,
    frecuencia VARCHAR(100) NOT NULL,
    via_administracion VARCHAR(100),
    estado ENUM('ACTIVA', 'MODIFICADA', 'SUSPENDIDA') DEFAULT 'ACTIVA',
    id_indicacion_anterior INT NULL,
    origen ENUM('TRATANTE', 'CONSULTA_GUARDIA') NOT NULL,
    FOREIGN KEY (id_internacion) REFERENCES internacion(id_internacion),
    FOREIGN KEY (id_profesional) REFERENCES profesional(id_profesional),
    FOREIGN KEY (id_indicacion_anterior) REFERENCES indicacion_medica(id_indicacion)
);

CREATE TABLE administracion_medicacion (
    id_administracion INT AUTO_INCREMENT PRIMARY KEY,
    id_indicacion INT NOT NULL,
    id_profesional INT NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    administrada BOOLEAN NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_indicacion) REFERENCES indicacion_medica(id_indicacion),
    FOREIGN KEY (id_profesional) REFERENCES profesional(id_profesional)
);

CREATE TABLE evolucion (
    id_evolucion INT AUTO_INCREMENT PRIMARY KEY,
    id_internacion INT NOT NULL,
    id_profesional INT NOT NULL,
    tipo ENUM('MEDICA', 'ENFERMERIA_COMPORTAMIENTO') NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    contenido TEXT NOT NULL,
    id_evolucion_corregida INT NULL,
    FOREIGN KEY (id_internacion) REFERENCES internacion(id_internacion),
    FOREIGN KEY (id_profesional) REFERENCES profesional(id_profesional),
    FOREIGN KEY (id_evolucion_corregida) REFERENCES evolucion(id_evolucion)
);

CREATE TABLE permiso_salida (
    id_permiso INT AUTO_INCREMENT PRIMARY KEY,
    id_internacion INT NOT NULL,
    id_profesional INT NOT NULL,
    fecha_solicitud DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_autorizacion DATETIME NULL,
    condiciones TEXT,
    estado ENUM('SOLICITADO', 'AUTORIZADO', 'DENEGADO', 'USADO') DEFAULT 'SOLICITADO',
    FOREIGN KEY (id_internacion) REFERENCES internacion(id_internacion),
    FOREIGN KEY (id_profesional) REFERENCES profesional(id_profesional)
);

CREATE TABLE consulta_guardia_excepcion (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_internacion INT NOT NULL,
    id_profesional_enfermeria INT NOT NULL,
    id_profesional_guardia INT NOT NULL,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    motivo TEXT NOT NULL,
    decision TEXT NOT NULL,
    id_indicacion_generada INT NULL,
    FOREIGN KEY (id_internacion) REFERENCES internacion(id_internacion),
    FOREIGN KEY (id_profesional_enfermeria) REFERENCES profesional(id_profesional),
    FOREIGN KEY (id_profesional_guardia) REFERENCES profesional(id_profesional),
    FOREIGN KEY (id_indicacion_generada) REFERENCES indicacion_medica(id_indicacion)
);

CREATE TABLE egreso (
    id_egreso INT AUTO_INCREMENT PRIMARY KEY,
    id_internacion INT NOT NULL,
    id_profesional INT NOT NULL,
    fecha_egreso DATETIME DEFAULT CURRENT_TIMESTAMP,
    motivo_egreso TEXT NOT NULL,
    indicaciones_post_alta TEXT,
    FOREIGN KEY (id_internacion) REFERENCES internacion(id_internacion),
    FOREIGN KEY (id_profesional) REFERENCES profesional(id_profesional)
);