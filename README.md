# hce-salud-mental
Sistema de Gestión de Historias Clínicas Electrónicas para Pabellón de Salud Mental - Pichulman Miguel, Rodriguez Joaquin UTN FRC.
# Identificación de la problemática y propuesta de solución
El presente proyecto aborda una problemática observada en el pabellón de internación de
una institución de salud mental ubicada en la provincia de Mendoza. Actualmente, la gestión
clínica y administrativa de los pacientes se realiza mediante documentación física, utilizando
hojas de papel y carpetas archivadas. Este método de trabajo, sostenido principalmente por
prácticas establecidas a lo largo del tiempo, genera diversas dificultades en la operatoria diaria de
la institución.
<p>La manipulación constante de la documentación provoca el deterioro progresivo del
material y aumenta el riesgo de extravío o deterioro de registros clínicos relevantes. El uso de
carpetas físicas limita el acceso simultáneo a los datos, por ejemplo, cuando un profesional
dispone de la carpeta de un paciente para realizar una consulta o actualización, el resto del
personal debe esperar para acceder a esa misma documentación. A esto se suma que la consulta
de internaciones anteriores, antecedentes y tratamientos requiere realizar búsquedas manuales
dentro de los archivos, lo que incrementa el tiempo necesario para recuperar estos expedientes y
puede favorecer errores u omisiones. Esta problemática afecta a distintos actores que intervienen
en la atención y monitoreo de los pacientes. Entre ellos se encuentran los médicos de guardia,
responsables de la evaluación inicial y de determinar la necesidad de internación; los
profesionales de planta, incluyendo psiquiatras y psicólogos, que participan en el diagnóstico,
supervisión, indicación de tratamientos y procesos de internación; y el personal de enfermería,
que realiza el control continuo de los pacientes y registra notas de evolución durante los distintos
turnos. Ante este escenario, la solución no consiste únicamente en trasladar los formularios
físicos a un formato digital, sino en transformar el proceso de gestión de la documentación
clínica mediante una plataforma centralizada. El software contemplará un registro unificado que
permita almacenar, consultar y actualizar los historiales de los pacientes de manera estructurada
y controlada. Uno de los principales aportes de la solución será permitir el acceso concurrente a
los expedientes por parte de distintos profesionales autorizados, eliminando la dependencia de
una única carpeta física.
<p>De esta manera, médicos y personal de enfermería podrán consultar y registrar novedades
desde diferentes terminales de acuerdo con sus permisos de acceso. La centralización de la
información también permitirá reducir los tiempos asociados a la búsqueda de antecedentes e
internaciones previas, disminuir el riesgo de pérdida o deterioro de documentación y facilitar el
análisis de la evolución de cada paciente. Por lo tanto, el valor agregado de la propuesta no se
encuentra únicamente en digitalizar la documentación existente, sino en mejorar la
disponibilidad, organización y gestión de los recursos para apoyar el trabajo cotidiano del
personal involucrado.

# Definición y justificación del stack tecnológico
Para la construcción de la solución se utilizará el lenguaje Java, junto con el framework
Spring Boot para implementar el backend y la lógica de negocio. La elección de este stack
responde a que el software requiere manejar distintas entidades relacionadas, controlar las
operaciones que pueden realizar los usuarios y aplicar reglas de acceso según el rol de cada
profesional. Además, Spring Boot permite organizar la aplicación en diferentes componentes,
facilitando la separación entre la lógica de negocio, el acceso a los datos y la gestión de las
solicitudes realizadas desde la interfaz. En cuanto a la persistencia de los registros, se utilizará
MySQL, gestor de bases de datos relacional. La elección responde a que la información
gestionada por la aplicación presenta una estructura definida y relaciones claras entre sus
entidades, como pacientes, internaciones, profesionales, diagnósticos, medicaciones y notas de
evolución. Si bien se consideró el uso de una base de datos no relacional como MongoDB, se
optó por MySQL debido a que las características del proyecto requieren mantener relaciones e
integridad entre las distintas entidades.
<p>Por su parte, la interfaz de usuario se desarrollará utilizando HTML5, CSS3 y JavaScript,
con Bootstrap para facilitar la construcción de una interfaz adaptable a las distintas resoluciones
de los equipos utilizados en el pabellón. También se evaluará la implementación de Thymeleaf,
un motor de plantillas para Java que permite generar páginas HTML dinámicas a partir de los
datos procesados por el backend de Spring Boot. Su utilización permitiría integrar la generación
de las vistas con la lógica del servidor sin incorporar un framework adicional para el frontend,
manteniendo un stack acotado y acorde al alcance del proyecto. La plataforma de despliegue
seleccionada será Render, utilizando su modalidad de Plataforma como Servicio (PaaS). Se
eligió esta plataforma porque permite desplegar la aplicación sin administrar directamente un
servidor, simplificando la configuración y puesta en funcionamiento de la herramienta. Además,
facilita la integración con el repositorio del proyecto y permite contar con una versión accesible
desde internet para realizar pruebas y demostraciones durante el avance de la tesina.
<p>Debido a que la plataforma manejará datos clínicos sensibles, la seguridad será
considerada tanto en la arquitectura como durante la implementación del software. El acceso al
sistema estará protegido mediante autenticación y autorización por roles, de modo que cada
usuario pueda acceder únicamente a las funcionalidades y datos correspondientes a sus
responsabilidades. También se contemplará el almacenamiento seguro de las contraseñas, la
validación de los datos recibidos por la aplicación, la protección de las comunicaciones mediante
HTTPS y el control de las operaciones realizadas sobre la historia clínica.
<p>Estas medidas estarán orientadas a reducir el riesgo de accesos no autorizados,
modificación indebida de registros o exposición de datos sensibles, teniendo en consideración la
legislación nacional aplicable al tratamiento de documentación clínica y datos personales,
particularmente la Ley de Protección de los Datos Personales (Ley 25.326) y la Ley de Derechos
del Paciente, Historia Clínica y Consentimiento Informado (Ley 26.529). En función de estos
requerimientos, el diseño del software buscará preservar la confidencialidad e integridad de la
información y establecer controles de acceso acordes a las responsabilidades de cada usuario.
Dado que se trata de un proyecto académico, las pruebas y demostraciones de la herramienta se
realizarán utilizando datos ficticios, sin incluir información correspondiente a pacientes reales.