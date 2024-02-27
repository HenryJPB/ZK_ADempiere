<%-- 
    Document   : jspPrueba
    Created on : 20 ago. 2020, 10:06:10 a. m.
    Author     : hpulgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%--
    <form action="proceso.jsp" method="post">
    --%>
    <form action="./jspReportMovimientos.jsp" method="post">
        Nombre:
        <input type="text" name="nombre" id="nombre" value="Eulalio Prueba"  >
        <br/>
        Apellido:
        <input type="text" name="apellido" id="apellido" value="" >
        <br/>
        Edad:
        <input type="text" name="edad">

        <br/>
        Lenguaje preferido:
        <select name="lenguaje">
            <option value="java">java
            <option value="jsp" selected>jsp
            <option value="php">php
            <option value="C/C++">C/C++
            <option value="C#">C#
            <option value="Asp">Asp
            <option value="AS3">AS3
        </select>
        <br/>
        Me gusta el:
        <br/>
        <input type="Radio" name="preferencia" value= "Diseño"checked>Diseño
        <br/>
        <input type="Radio" name= "preferencia"value="Programacion">Programacion
        <br/>
        <input type="Radio" name= "preferencia"value="Modelado">Modelado
        <br/>
        <input type="Radio" name= "preferencia"value="Gerencia">Gerencia de proyectos
        <br/>
        <%--       
                Ejemplo Fecha ...-> https://developer.mozilla.org/es/docs/Web/HTML/Elemento/input/date
                <label for="start">Fecha:</label>
                <input type="date" id="start" name="trip-start"
                       value="2018-07-22"
                       min="2018-01-01" max="2018-12-31">
        --%>
        <label for="i_fecha1">Fecha inicial:</label>
        <input type="date" id="i_fecha1" name="fecha1">

        <p><input type="submit" value="Enviar"></p>    
    </form>
    <%
        System.out.println("HELO WORLD!!!!");
        // ESTO NO FUNCIONA Aqui. ..... (Bqto, 20/08/2020 )
        System.out.println("Mi nombre=" + request.getParameter("nombre") + "****");
        System.out.println("Mi nombre=" + "${nombre}" + "****");
    %> 
</html>
