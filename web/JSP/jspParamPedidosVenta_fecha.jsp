<%-- 
    Document   : jspProductosAD
    Created on : 30 nov. 2023, 3:31:15 p. m.
    Author     : hpulgar
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%> 
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%-- NOTA,,,,, OJO:   *****
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
    Error: org.apache.jasper.JasperException: La uri absoluta: [http://java.sun.com/jsp/jstl/core] no puede resolverse o en web.xml o el los archivos jar desplegados con esta aplicación 
    Posibles
    SOLUCIONES :  'https://app.aluracursos.com/forum/topico-duda-uri-absoluta-http-java-sun-com-jsp-jstl-core-no-puede-resolverse-o-en-web-xml-o-el-los-archivos-jar-desplegados-con-esta-aplicacion-210196' dice:  
              - El error que estás experimentando se debe a que la versión de JSTL que estás utilizando no es compatible con Tomcat 10.1 y Java 11. 
              - Agregar los siguientes jar's a tu proyecto: taglibs-standard-impl-1.2.5.jar, taglibs-standard-jstlel-1.2.5.jar, 
                taglibs-standard-spec-1.2.5.jar ubicados en la carpeta '/home/hpulgar/Instaladores/Linux/JSP_standard_taglibs/'.  

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
         <%--
         <sql:setDataSource var= "myPSGconTest" driver = "org.postgresql.Driver"
                    url="jdbc:postgresql://192.168.1.2:54323/DDH"
                    user = "adempiere"  password = "adempiereTest" />    
         --%>
         <sql:setDataSource var= "myPSGcon" driver = "org.postgresql.Driver"
                           url="jdbc:postgresql://192.168.1.2:5434/DDH"
                           user = "adempiere"  password = "AzLY7Dzx59g" />    
         <c:set var = "constClientID" value = "1000000" />
         <c:set var = "constOrgID" value = "1000004" />

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
                    <form action="./jspRepPedidosVenta_fecha.jsp" method="post">
                         <%--
                         <c:set var = "constClientID" value = "1000000" />
                         --%>
                         <sql:query dataSource = "${myPSGcon}" var = "organizacion">
                           select CAST( ad_org.ad_org_id AS VARCHAR) || ' ' || ad_org.name as nombre_organizacion 
                           from   ad_org
                           where  ad_org.ad_client_id = ${constClientID}
                           and    ad_org.isactive = 'Y'
                           order  by ad_org.name 
                         </sql:query>   
                           
                        <br> 
                         Organizacion:
                         <select name="s_organizacion" >
                            <c:forEach var="row" items="${organizacion.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option value="<c:out value="${column}" />"> <c:out value="${column}"/> </option>
                                </c:forEach>
                            </c:forEach>        
                         </select> 
                        <br/>
                          
                        <br>
                          <%--
                           <input type="date" id="start" name="trip-start"
                                  accept=""value="2018-07-22"
                                    min="2018-01-01" max="2018-12-31">
                          --%>
                           <label for="fecha1"> Desde Fecha :</label>
                           <input type="date" id="fecha1" name="p_fecha1" min="2014-04-01" max="2099-12-31">
                           
                           <label for="fecha2">Hasta Fecha:</label>
                           <input type="date" id="fecha2" name="p_fecha2" min="2014-04-15" max="2099-12-31">
                        <br/>
                        
                        <p><input type="submit" value="ENVIAR" class="miBoton" ></p> 
                        
                    </form>  
                    </td>
                </tr>
            </tbody>
          </table>
                        
    </body>                                          
</html>
