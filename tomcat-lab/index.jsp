<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String server = application.getServerInfo();
    String javaVersion = System.getProperty("java.version");
    String osName = System.getProperty("os.name");
    String context = request.getContextPath();
    Integer visits = (Integer) session.getAttribute("visits");
    if (visits == null) visits = 0;
    visits++;
    session.setAttribute("visits", visits);
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Tomcat Lab | Aplicación de prueba</title>
  <link rel="stylesheet" href="<%= context %>/css/styles.css">
</head>
<body>
<header class="top">
  <div class="wrap">
    <p class="eyebrow">PRÁCTICA DAW · DESPLIEGUE WEB</p>
    <h1>Tomcat <span>Lab</span></h1>
    <p>Aplicación de ejemplo para comprobar el despliegue y el funcionamiento del servidor.</p>
  </div>
</header>
<main class="wrap">
  <section class="status">
    <div>
      <p class="eyebrow">ESTADO DE LA APLICACIÓN</p>
      <h2><span class="dot"></span> Aplicación ejecutándose</h2>
      <p>Si puedes ver esta página, Tomcat ha desplegado y está sirviendo la aplicación correctamente.</p>
    </div>
    <div class="pill">JSP · WAR</div>
  </section>

  <section class="grid">
    <article class="card">
      <p class="eyebrow">01 · INFORMACIÓN</p>
      <h3>Entorno del servidor</h3>
      <dl>
        <dt>Servidor</dt><dd><%= server %></dd>
        <dt>Versión de Java</dt><dd><%= javaVersion %></dd>
        <dt>Sistema operativo</dt><dd><%= osName %></dd>
        <dt>Sesión actual</dt><dd><%= visits %> visita(s) a esta página</dd>
      </dl>
    </article>
    <article class="card accent">
      <p class="eyebrow">02 · FUNCIONALIDAD</p>
      <h3>Prueba de respuesta</h3>
      <p>Abre una segunda página dinámica para comprobar que el formulario y el procesamiento del servidor funcionan.</p>
      <a class="button" href="<%= context %>/prueba.jsp">Ejecutar prueba funcional →</a>
    </article>
    <article class="card">
      <p class="eyebrow">03 · RENDIMIENTO</p>
      <h3>Prueba de cálculo</h3>
      <p>Ejecuta una operación repetitiva en el servidor y muestra el tiempo aproximado que tarda.</p>
      <form action="<%= context %>/rendimiento.jsp" method="get">
        <label for="iteraciones">Número de iteraciones</label>
        <select name="iteraciones" id="iteraciones">
          <option value="10000">10.000 (rápida)</option>
          <option value="100000" selected>100.000 (normal)</option>
          <option value="500000">500.000 (intensiva)</option>
        </select>
        <button class="button" type="submit">Medir rendimiento →</button>
      </form>
    </article>
  </section>
  <p class="note">Práctica académica: no introduzcas datos personales ni contraseñas en esta aplicación.</p>
</main>
<footer><div class="wrap">Tomcat Lab · Aplicación didáctica de ejemplo</div></footer>
</body>
</html>
