<%-- 
    Document   : jspProductosAD
    Created on : 30 nov. 2023, 3:31:15 p. m.
    Author     : hpulgar
--%>

<%@page import="java.text.SimpleDateFormat"%>
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
            String reporte = "PedidosVenta_fecha.jasper";  
            
            /* Parametros para realizar la conexion */
            Connection conexion;
            /* 
            "com.mysql.jdbc.Driver"
            "org.postgresql.Driver"
            */ 
            Class.forName("org.postgresql.Driver").newInstance();
            File reportFile = null;  
            final String linkConexionProd = "jdbc:postgresql://192.168.1.2:5434/DDH";    // ADempeire en Prodccion. 
            final String linkConexionTest = "jdbc:postgresql://192.168.1.2:54323/DDH";   // ADempeire en desica-test 
            //*   
            conexion = DriverManager.getConnection( linkConexionProd,"adempiere","AzLY7Dzx59g" );
            //conexion = DriverManager.getConnection( linkConexionTest,"adempiere","adempiereTest" );
            //
            Map parametros = new HashMap();
            
            /* Establecemos la ruta del reporte */
            reportFile = new File( application.getRealPath("/REPORTES/"+reporte ) );
           
            //parametros.put("nombreParametro", "valorParametro");
            //String nroNota = request.getParameter("nro_ov");   
            //parametros.put( "p_orden_nro",nroNota );
            //parametros.put( "p_vendedor",request.getParameter("s_vendedor") );
            //parametros.put( "p_vendedor",tipoDoc );
            /*-*/
            Integer i = Integer.valueOf( request.getParameter("s_organizacion" ).substring(0, 7) );   
            
            parametros.put("p_org_id", i ); 
            // System.out.println("*****Organizacion");   revisar *No* funciona!!! 
            
            SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
            String f1 = request.getParameter("p_fecha1");
            parametros.put("p_fecha1", dFormat.parse( f1 ) ); 
            
            String f2 = request.getParameter("p_fecha2");
            parametros.put("p_fecha2" , dFormat.parse( f2 ) );  
             
            //parametros.put("p_msg", f1 +", "+ f2);  
            
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
