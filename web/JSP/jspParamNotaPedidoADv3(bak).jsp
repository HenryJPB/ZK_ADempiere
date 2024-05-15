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
         
         <sql:setDataSource var= "myPSGcon" driver = "org.postgresql.Driver"
                    url="jdbc:postgresql://192.168.1.2:54323/DDH"
                    user = "adempiere"  password = "adempiereTest" />    
         
         <sql:query dataSource = "${myPSGcon}" var = "vendedor">
            select ad_user.name as nombre_usuario
            from   c_order, ad_user
            where  c_order.ad_client_id = 1000000
            and    c_order.ad_org_id  = 1000000
            and    c_order.documentno  = 'PVNF-3'      
            and    ad_user.ad_client_id = c_order.ad_client_id
            and    ad_user.ad_user_id = c_order.createdby
          </sql:query>     
           
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
                    <form action="./jspRepNotaPedidoAD.jsp" method="post">
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
                        
                        <br> 
                        <label for="nro_ov">Nro Orden de Venta</label>: 
                        <input type="text" name="nro_ov" id="nro_ov" var="nro_ov" value="PVF-9" size="7px" onkeyup="this.value = this.value.toUpperCase();"  >
                        <br/>
                        <%--
                        Nombre:
                        <input type="text" name="p_vendedor" id="vendedor" value="Luis Oliveiras"  >
                        <br/>  
                        <c:set var = "varNroOv" value = "PVNF-3" />
                        --%>  
                        <sql:query dataSource = "${myPSGcon}" var = "vendedor">
                           select ad_user.name as nombre_usuario
                           from   c_order, ad_user
                           where  c_order.ad_client_id = ${constClientID}
                           --and    c_order.ad_org_id  = 1000000
                           --and    c_order.documentno  = '${nro_ov}'     -- No fifa ?????
                           --and    c_order.documentno  = '${varNroOv}'      -- Fino, fino c/Bambino.      
                           and    ad_user.ad_client_id = c_order.ad_client_id
                           and    ad_user.ad_user_id = c_order.createdby
                         </sql:query>   
                           
                         <c:set var = "constSalesGroupID" value = "1000004" />
                         <sql:query dataSource = "${myPSGcon}" var = "vendedores">
                            select  ad_user.name as nombre_usuario
                            from   ad_user, c_bpartner
                            where  ad_user.ad_client_id = ${constClientID}
                            --and    ad_user.ad_org_id  = 1000000   
                            and    c_bpartner.ad_client_id = ad_user.ad_client_id
                            and    ad_user.isactive = 'Y'
                            and    ad_user.c_bpartner_id = c_bpartner.c_bpartner_id 
                            and    ( c_bpartner.c_bp_salesgroup_id is not null and 
                                     c_bpartner.c_bp_salesgroup_id = ${constSalesGroupID} )
                         </sql:query>   
                         <br>
                         Vendedor :
                         <select name="s_vendedor" >
                            <c:forEach var="row" items="${vendedores.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option value="<c:out value="${column}" />"> <c:out value="${column}"/> </option>
                                </c:forEach>
                            </c:forEach>        
                         </select> 
                        <br/>
                        <p><input type="submit" value="ENVIAR" class="miBoton" ></p> 
                        
                    </form>  
                    </td>
                </tr>
            </tbody>
          </table>
                        
    </body>                                          
</html>
