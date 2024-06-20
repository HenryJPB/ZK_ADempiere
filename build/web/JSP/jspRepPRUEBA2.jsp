<%-- 
    Document   : jspPRUEBA
    Created on : 15-05-2024 11:43 
    Author     : hpulgar
    NOTA IMPORTANTE:  Esta prueba de Reporte fue realizada utilizando el 
    Editor de Reportes 'TIBCO JasperSoft Studio CE v.6.21.2 >>>> Generando salidas Indeseables ???
    ERROR: 'java.lang.IllegalStateException: getOutputStream() ...' ????
    >>>> **Sujeto a Revision**
    Posible solucion:  utilizar comando Java , 'byte[] bytes = JasperRunManager.(CompileReport), .. OJO!!!
--%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%-- 
<%@page import="java.util.System.out"%> 
--%>
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
            String reporte = "NotaPedido(v3-JSS6.11).jasper";  
            /* Parametros para realizar la conexion */
            Connection conexion;
            /* 
            "com.mysql.jdbc.Driver"
            "org.postgresql.Driver"
            */ 
            Class.forName("org.postgresql.Driver").newInstance();
            final String linkConexionProd = "jdbc:postgresql://192.168.1.2:5434/DDH";    // ADempeire en Prodccion. 
            final String linkConexionTest = "jdbc:postgresql://192.168.1.2:54323/DDH";   // ADempeire en desica-test 
            //*   
            conexion = DriverManager.getConnection( linkConexionProd,"adempiere","AzLY7Dzx59g" );
            //conexion = DriverManager.getConnection( linkConexionTest,"adempiere","adempiereTest" );
            //*  
            /*-*/
            /* Establecemos la ruta del reporte */
            File reportFile = new File( application.getRealPath("/REPORTES/"+reporte ) );
            /*-*/
            /* No enviamos parametros porque nuetro reporte NO lo requiere */
              
            Map parametros = new HashMap();
            Integer i = 1000004; 
            parametros.put("p_org_id", i );
            //parametros.put("nombreParametro", "valorParametro");
            String nroNota = "PVNF-95"; 
            parametros.put( "p_orden_nro",nroNota );
            //parametros.put( "p_vendedor",request.getParameter("s_vendedor") );
            parametros.put( "p_vendedor","version JSS6.11" );
            /*-*/
            //Integer i = Integer.valueOf( request.getParameter("s_organizacion" ).substring(0, 7) );   
            // Integer i = Integer.valueOf( "1000000" );   
            //parametros.put("p_org_id", i ); 
            // System.out.println("*****Organizacion");   revisar *No* funciona!!! 
            //out.println("*****Organizacion"+request.getParameter("s_organizacion") );  // No genera errores pero no produce salida ?????????????????????????? 
            /* Enviamos el reporte ( ruta ), los parametrios y la conexion */
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, conexion);
            /* Indicamos que la respuesta va a ser en PDF */
            response.setContentType("application/pdf");
            // response.setHeader( "Content-Disposition", "attachment; filename="+ nroNota + ".pdf" );  // Eeexitooooo 👍 !!!!
            response.setContentLength(bytes.length);
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes, 0, bytes.length);
            /*-*/    
            /* Limpiamos y cerramos los flujos de salida */
            outputStream.flush();
            outputStream.close();
            conexion.close();
        %> 
       
    </body>
</html>
