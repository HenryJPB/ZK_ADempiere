<%-- 
    Document   : jspProductosAD
    Created on : 30 nov. 2023, 3:31:15 p. m.
    Author     : hpulgar
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<%-- Importamos las Libreria --%>   
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
    </head>
    <body>
        <%
            /* Parametros para realizar la conexion */
            Connection conexion;
            /* 
            "com.mysql.jdbc.Driver"
            "org.postgresql.Driver"
            */ 
            Class.forName("org.postgresql.Driver").newInstance();
            final String linkConexionProd = "jdbc:postgresql://192.168.1.2:5434/DDH";    // ADempeire en Prodccion. 
            final String linkConexionTest = "jdbc:postgresql://192.168.1.2:54323/DDH";   // ADempeire en desica-test 
            // *
            conexion = DriverManager.getConnection( linkConexionProd,"adempiere","AzLY7Dzx59g" );
            //conexion = DriverManager.getConnection( linkConexionTest,"adempiere","adempiereTest" );
            //*   
            /*-*/
            /* Establecemos la ruta del reporte */
            File reportFile = new File( application.getRealPath("/REPORTES/Productos(v2-JSS6.11).jasper") );
            /*-*/
            /* No enviamos parametros porque nuetro reporte NO lo requiere */
            Map parametros = new HashMap();
            //parametros.put("nombreParametro", "valorParametro");
            /*-*/
            /* Enviamos el reporte ( ruta ), los parametrios y la conexion */
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, conexion);
            /* Indicamos que la respuesta va a ser en PDF */
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes, 0, bytes.length);
            /*-*/    
            /* Limpiamos y cerramos los flujos de salida */
            outputStream.flush();
            outputStream.close();
            conexion.close();
        %> 
        <h3> Aqui vamos </h3>
    </body>
</html>
