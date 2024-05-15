<%-- 
    Document   : jspProductosAD
    Created on : 30 nov. 2023, 3:31:15 p. m.
    Author     : hpulgar
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%> 
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
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
                        
                        <sql:setDataSource var= "myPSGcon" driver = "org.postgresql.Driver"
                                   url="jdbc:postgresql://192.168.1.2:54323/DDH"
                                   user = "adempiere"  password = "adempiereTest" />    
                        
                         <c:set var = "constClientID" value = "1000000" /> 

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
                          
                        <br/>
                        <label for="nro_ov">Nro Nota de Entrega: </label>: 
                        <input type="text" name="nro_nota_entrega" id="nro_nota_entrega" value="EVNF-9"  >
                        <br/>
                   
                         <p><input type="submit" value="ENVIAR" class="miBoton" ></p> 
                    </form>  
                    </td>
                </tr>
        </tbody>
    </table>
    </body>
</html>
