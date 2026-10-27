<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String context = request.getContextPath();
    int iteraciones = 100000;
    String valor = request.getParameter("iteraciones");
    try {
        if (valor != null) iteraciones = Integer.parseInt(valor);
    } catch (NumberFormatException e) { iteraciones = 100000; }
    if (iteraciones < 1000) iteraciones = 1000;
    if (iteraciones > 1000000) iteraciones = 1000000;
    long inicio = System.nanoTime();
    long resultado = 0;
    for (int i = 1; i <= iteraciones; i++) {
        resultado += (long) i * (i % 7 + 1);
    }
    long fin = System.nanoTime();
    double milisegundos = (fin - inicio) / 1000000.0;
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Prueba de rendimiento | Tomcat Lab</title><link rel="stylesheet" href="<%= context %>/css/styles.css">
</head>
<body>
<header class="top"><div class="wrap"><p class="eyebrow">PRUEBA 02</p><h1>Prueba de <span>rendimiento</span></h1><p>Cálculo repetitivo ejecutado en el servidor.</p></div></header>
<main class="wrap narrow">
  <section class="card">
    <h2>Resultado de la medición</h2>
    <div class="metrics">
      <div><span class="metric"><%= iteraciones %></span><small>iteraciones</small></div>
      <div><span class="metric"><%= String.format(java.util.Locale.US, "%.3f", milisegundos) %> ms</span><small>tiempo aproximado</small></div>
    </div>
    <p>Valor calculado: <strong><%= resultado %></strong></p>
    <p class="note">El tiempo depende del equipo, la carga del servidor, la JVM y otras tareas en ejecución. Esta prueba es orientativa y no sustituye una herramienta profesional de carga.</p>
    <form action="<%= context %>/rendimiento.jsp" method="get">
      <label for="iteraciones">Repetir con otro número de iteraciones</label>
      <select name="iteraciones" id="iteraciones">
        <option value="10000">10.000 (rápida)</option>
        <option value="100000">100.000 (normal)</option>
        <option value="500000">500.000 (intensiva)</option>
        <option value="1000000">1.000.000 (máxima)</option>
      </select>
      <button class="button" type="submit">Volver a medir</button>
    </form>
    <a class="back" href="<%= context %>/">← Volver al inicio</a>
  </section>
</main>
<footer><div class="wrap">Tomcat Lab · Aplicación didáctica de ejemplo</div></footer>
</body></html>
