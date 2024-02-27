<%-- 
    Document   : jspProductosAD
    Created on : 30 nov. 2023, 3:31:15 p. m.
    Author     : hpulgar
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="hojaEstilo.css">
        <title>PARAMETROS</title>
    </head>
    <body>
        <table border="1" class="miTablaModelo1" >
            <thead>
                <tr>
                    <hr style="color: #0056b2;" />
                    <h1> PARAMETROS DE TU INFORME </h1>  
                    <hr style="color: #0056b2;" />
                    <br/>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td> 
                    <form action="./jspRepNotaEntregaAD(v2).jsp" method="post">
                        <%--
                        Nombre:
                        <input type="text" name="nombre" id="nombre" value="Eulalio Prueba"  >
                        <br/>
                        Apellido:
                        <input type="text" name="apellido" id="apellido" value="" >
                        <br/>
                        Lenguaje de mi Preferencia:  
                        <select name="lenguaje">
                            <option value="java">java
                            <option value="jsp" selected>jsp
                            <option value="php">php
                            <option value="C/C++">C/C++
                            <option value="C#">C#
                            <option value="Asp">Asp
                            <option value="AS3">AS3
                        </select>
                        --%>
                        <%--
                        <label for="s_tipo_mov">Tipo de Movimiento ( E)ntrada / S)alida / A)juste ) </label>:
                        <select name="tipo_mov">
                            <option value="E">Entrada
                            <option value="S" selected>Consumo
                            <option values="A">Ajuste   
                        </select>
                        --%>
                        
                        <label for="nro_ov">Nro Nota de Entrega: </label>: 
                        <input type="text" name="nro_nota_entrega" id="nro_nota_entrega" value="EVNF-9"  >
                        <br/>
                     
                        <%--
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
                        --%>
                        <%--       
                        Ejemplo Fecha ...-> https://developer.mozilla.org/es/docs/Web/HTML/Elemento/input/date
                        <label for="start">Fecha:</label>
                        <input type="date" id="start" name="trip-start"
                           value="2018-07-22"
                           min="2018-01-01" max="2018-12-31">
                        --%>
                        <%--
                        <label for="i_fecha1">Fecha inicial:</label>
                        <input type="date" id="i_fecha1" name="fecha1">
                        <br/>
                        <br/>
                        <label for="i_fecha2">Fecha final:</label>
                        <input type="date" id="i_fecha1" name="fecha2">
                        <br/>
                        <br/>
                         --%>
                        <%-- 
                        <p><input type="submit" value="Enviar" width="100" ></p> 
                        --%>
                        <%--  
                             HJPB: didn't work :-(
                        <p><button type="submit" value="Enviar" width="600" button/></p> 
                        --%>
                        <p><input type="submit" value="ENVIAR" class="miBoton" ></p> 
                    </form>  
                    </td>
                </tr>
        </tbody>
    </table>
    </body>
</html>
