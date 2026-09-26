# Sistema de Gestión de Historias Clínicas Electrónicas para Pabellón de Salud Mental (HCE - Salud Mental)

Universidad Tecnológica Nacional - Facultad Regional San Nicolás

Tecnicatura Universitaria en Programación A distancia

Miguel Pichulman, Joaquín Gabriel Rodríguez

**Tutor:**
 Oscar Londero  

---

## 1. Identificación de la problemática y propuesta de solución

El presente proyecto aborda una problemática observada en el pabellón de internación de una institución de salud mental ubicada en la provincia de Mendoza. Actualmente, la gestión clínica y administrativa de los pacientes se realiza de forma manual, mediante hojas de papel en las que los profesionales registran a mano la información correspondiente a cada paciente y que posteriormente son organizadas y almacenadas en carpetas físicas.

La utilización constante de estas carpetas provoca el deterioro progresivo de las hojas y aumenta el riesgo de pérdida o extravío de información. El uso de una carpeta física para concentrar los registros de cada paciente también limita el acceso simultáneo a los datos; cuando un profesional necesita consultar o actualizar la documentación, el resto del personal debe esperar para acceder a esa misma información. A esto se suma que la consulta de internaciones anteriores requiere buscar y revisar manualmente las hojas almacenadas en las carpetas, lo que incrementa el tiempo necesario para recuperar antecedentes y registros de tratamientos previos.

### Propuesta de valor

La propuesta consiste en desarrollar una plataforma para gestionar la información clínica de los pacientes, permitiendo registrar, almacenar y consultar los datos de forma organizada. Los profesionales autorizados podrán acceder a la información según sus roles y realizar las operaciones correspondientes desde distintos equipos, evitando depender de una única carpeta física para consultar o actualizar los registros. Permitiendo asi reducir la necesidad de trasladar carpetas y buscar documentación entre los distintos sectores de la institución, facilitando el acceso a la información necesaria durante la atención y seguimiento de los pacientes.


> **Atención:** Al ser un proyecto académico, el sistema funcionará exclusivamente con datos ficticios.

## 2. Dominio y Alcance (Proceso Clínico)

A partir del relevamiento real, el sistema distingue claramente al **paciente** de la **internación**.

Un mismo paciente puede internarse más de una vez. Por lo tanto, la estructura de datos conservará la trazabilidad:

    Paciente
       ├── Internación 1
       │      ├── Evolución
       │      ├── Evolución
       │      └── ...
       │
       ├── Internación 2
       │      ├── Evolución
       │      ├── Evolución
       │      └── ...
       │
       └── ...

### Recorrido principal

El recorrido principal a cerrar en el prototipo será:

**Admisión (guardia) → Internación (pabellón) → Evolución (tratamiento/enfermería) → Egreso → Consulta histórica**

### Trazabilidad y permisos concretos

#### Seguridad y auditoría

El acceso concurrente se resuelve mediante trazabilidad. Cada evolución será un registro que contendrá:

- Autor.
- Fecha y hora.
- Tipo de profesional.
- Información correspondiente a la evolución clínica.

De esta manera, se construye una línea temporal de las acciones realizadas sobre cada internación.

#### Correcciones sin `DELETE`

Los datos clínicos no desaparecerán mediante operaciones `DELETE`.

Toda corrección deberá preservar la trazabilidad mediante:

- Versionado de registros.
- Referencias al registro original.
- Identificación del usuario que realizó la modificación.
- Fecha y hora de la modificación.

### Roles definidos

| **Rol** | **Responsabilidades** |
|---|---|
| **Médico de Guardia** | Define la internación, registra los primeros datos y la medicación inicial. |
| **Profesional Tratante del Pabellón** | Informa la evolución, diagnostica y decide el alta. |
| **Enfermería** | Suministra medicación y registra el comportamiento diario. |

## 3. Stack Tecnológico

| **Área** | **Tecnología** | **Uso** |
|---|---|---|
| **Backend** | Java | Lenguaje principal del sistema. |
| **Framework Backend** | Spring Boot | Implementación de la lógica de negocio y API/web. |
| **Base de datos** | MySQL | Persistencia de pacientes, internaciones, evoluciones y demás entidades. |
| **Frontend** | HTML5 | Estructura de las interfaces. |
| **Estilos** | CSS3 | Diseño y presentación de las interfaces. |
| **Frontend** | JavaScript | Interactividad y comportamiento del cliente. |
| **Framework CSS** | Tailwind CSS | Diseño responsive ágil mediante clases de utilidad. |
| **Motor de plantillas** | Thymeleaf | Generación de vistas dinámicas desde Spring Boot. |
| **Seguridad** | Spring Security | Autenticación y autorización basada en roles. |
| **Despliegue** | Render | Despliegue de la aplicación mediante PaaS. |

### Seguridad

- Autenticación de usuarios.
- Autorización mediante roles.
- Contraseñas almacenadas de forma segura.
- Control de acceso según el tipo de profesional.
- Registro de acciones relevantes.
- Comunicación mediante HTTPS en el entorno desplegado.

### Base de datos

Se utilizará MySQL para almacenar la información del sistema y mantener las relaciones entre las principales entidades:

- Pacientes.
- Internaciones.
- Evoluciones.
- Profesionales.
- Medicaciones.
- Antecedentes.
- Registros de auditoría.


## 4. Conocimiento del Stack del Equipo

| **Tecnología**        | **Joaquín Gabriel Rodríguez** | **Miguel Pichulman** |
| --------------------- | ----------------------------- | -------------------- |
| **Java**              | Intermedio                    | Intermedio           |
| **Spring Boot**       | Intermedio                    | Intermedio           |
| **Spring Security**   | Intermedio                    | Intermedio           |
| **MySQL**             | Intermedio                    | Intermedio           |
| **HTML / JavaScript** | Intermedio                    | Intermedio           |
| **CSS**               | Intermedio                    | Intermedio           |
| **Testing**           | Intermedio                    | Intermedio           |
| **Deployment**        | Intermedio                    | Intermedio           |



## 5. Organización de Sprints

El proyecto se gestionará mediante Scrum, dividiendo el desarrollo en distintos sprints. Cada sprint tendrá objetivos y funcionalidades definidos, permitiendo organizar el desarrollo de forma progresiva e incorporar nuevas funcionalidades sobre la versión existente del sistema.


### Sprint 1 — Gestión de Pacientes e Internaciones

#### Backend

- Configuración inicial de Spring Boot.
- Organización de la estructura del proyecto.
- Implementación de las entidades `Paciente` e `Internacion`.
- Implementación de repositorios, servicios y controladores.
- Desarrollo de las operaciones para registrar y consultar pacientes e internaciones.

#### Base de datos

- Configuración de MySQL.
- Creación de las tablas correspondientes a pacientes e internaciones.
- Definición de las relaciones entre ambas entidades.

#### Frontend

- Estructura inicial de las vistas utilizando HTML, CSS, Tailwind CSS y Thymeleaf.
- Implementación del inicio de sesión.
- Pantallas para registrar y consultar pacientes.
- Pantallas para abrir y consultar internaciones.

#### Seguridad y testing

- Configuración inicial de Spring Security.
- Implementación de la autenticación de usuarios.
- Pruebas de registro, consulta y persistencia de pacientes e internaciones.

### Sprint 2 — Evolución y Tratamiento

#### Backend

- Implementación de las entidades `Profesional`, `Evolucion` y `Medicacion`.
- Implementación de repositorios, servicios y controladores correspondientes.
- Definición de las relaciones entre internaciones, profesionales, evoluciones y medicaciones.
- Implementación de las reglas de negocio para el registro de evoluciones y tratamientos.

#### Base de datos

- Incorporación de las nuevas tablas y relaciones.
- Definición de claves y restricciones necesarias para mantener la integridad de los datos.

#### Frontend

- Implementación de las vistas para registrar y consultar evoluciones.
- Implementación de las vistas para gestionar medicación.
- Integración de las nuevas funcionalidades con las desarrolladas en el Sprint 1.

#### Seguridad y testing

- Configuración de permisos según el rol del profesional.
- Registro del autor y fecha/hora de las evoluciones.
- Pruebas de las nuevas funcionalidades y su integración con las existentes.

### Sprint 3 — Historial, Egreso y Auditoría

#### Backend

- Implementación de las funcionalidades para consultar antecedentes e internaciones anteriores.
- Desarrollo del proceso de egreso.
- Implementación de los registros de auditoría.
- Incorporación de los mecanismos necesarios para preservar la trazabilidad de las modificaciones.
- Integración de las nuevas funcionalidades con las desarrolladas anteriormente.

#### Base de datos

- Incorporación de las entidades y relaciones necesarias para antecedentes, egresos y auditoría.
- Implementación de los campos necesarios para registrar fecha, hora y usuario asociado a las operaciones.
- Revisión de la integridad de las relaciones entre las entidades.

#### Frontend

- Implementación de las vistas para consultar antecedentes e internaciones anteriores.
- Implementación de la pantalla para registrar el egreso.
- Visualización de la información histórica y de las acciones registradas.

#### Seguridad y testing

- Revisión de los permisos de acceso a la información clínica.
- Pruebas de trazabilidad y auditoría.
- Pruebas de integración del recorrido completo del sistema.
- Correcciones y ajustes finales sobre las funcionalidades desarrolladas.

## 6. Recorrido General del Sistema


    ┌───────────────┐
    │     Login     │
    └───────┬───────┘
            ↓
    ┌───────────────┐
    │   Paciente    │
    └───────┬───────┘
            ↓
    ┌───────────────┐
    │   Admisión    │
    │    Guardia    │
    └───────┬───────┘
            ↓
    ┌───────────────┐
    │  Internación  │
    │    Pabellón   │
    └───────┬───────┘
            ↓
    ┌───────────────┐
    │   Evolución   │
    │  Tratamiento  │
    │  Enfermería   │
    └───────┬───────┘
            ↓
    ┌───────────────┐
    │   Medicación  │
    └───────┬───────┘
            ↓
    ┌───────────────┐
    │     Egreso    │
    └───────┬───────┘
            ↓
    ┌───────────────┐
    │    Consulta   │
    │   Histórica   │
    └───────────────┘
