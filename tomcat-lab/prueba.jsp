<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String context = request.getContextPath();
    String nombre = request.getParameter("nombre");
    String mensaje = null;
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        if (nombre != null) nombre = nombre.trim();
        if (nombre == null || nombre.length() == 0) {
            mensaje = "Escribe un nombre para completar la prueba.";
        } else {
            mensaje = "¡Correcto, " + nombre.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;").replace("'","&#39;") + "! El formulario ha llegado al servidor y se ha procesado.";
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Prueba funcional | Tomcat Lab</title><link rel="stylesheet" href="<%= context %>/css/styles.css">
</head>
<body>
<header class="top"><div class="wrap"><p class="eyebrow">PRUEBA 01</p><h1>Prueba <span>funcional</span></h1><p>Formulario enviado al servidor mediante HTTP POST.</p></div></header>
<main class="wrap narrow">
  <section class="card">
    <h2>Comprueba el procesamiento</h2>
    <p>Introduce un nombre de prueba y envía el formulario. El servidor responderá con un mensaje.</p>
    <% if (mensaje != null) { %><div class="result"><%= mensaje %></div><% } %>
    <form action="<%= context %>/prueba.jsp" method="post">
      <label for="nombre">Nombre de prueba</label>
      <input id="nombre" name="nombre" maxlength="60" required>
      <button class="button" type="submit">Enviar formulario</button>
    </form>
    <a class="back" href="<%= context %>/">← Volver al inicio</a>
  </section>
</main>
<footer><div class="wrap">Tomcat Lab · Aplicación didáctica de ejemplo</div></footer>
</body></html>
