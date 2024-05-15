<%-- 
    Document   : jspProductosAD
    Created on : 30 nov. 2023, 3:31:15 p. m.
    Author     : hpulgar
--%>

<%@page import="net.sf.jasperreports.engine.export.JRRtfExporter"%>
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
            String filename = "";   // Nombre del archivo de salida
            //*   
            //conexion = DriverManager.getConnection( linkConexionProd,"adempiere","AzLY7Dzx59g" );
            conexion = DriverManager.getConnection( linkConexionTest,"adempiere","adempiereTest" );
            //*  
            /*-*/
            /* Establecemos la ruta del reporte */
            File reportFile = new File( application.getRealPath("/REPORTES/NotaEntrega.jasper") );
            /*-*/
            /* No enviamos parametros porque nuetro reporte NO lo requiere */
            Map parametros = new HashMap();
            //parametros.put("nombreParametro", "valorParametro");
            parametros.put("p_orden_nro",request.getParameter("nro_ne") );
            /*-*/
            /* Enviamos el reporte ( ruta ), los parametrios y la conexion */
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, conexion);
            //byte[] bytes = JasperRunManager.runReportToHtmlFile( reportFile.getPath(), parametros, conexion).getBytes();
            /* Indicamos que la respuesta va a ser en PDF */
            // response.setContentType("application/rtf");  // ???? 
            // response.setContentType("application/pdf");
            // response.setContentType("text/plain");  // -- Loquera ???? 
            // response.setContentType("text/rtf");
            // response.setContentType("text/html");
            response.setContentType( "application/pdf" );
            filename = request.getParameter("nro_ne") + ".pdf";   
            response.setHeader( "Content-Disposition", "attachment; filename=" + filename );

            response.setContentLength(bytes.length);
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes, 0, bytes.length);
             
            /* ***********NO funciono ***************** */ 
            // String r = reportFile.toString();   
            // JasperPrint jasperPrint = JasperFillManager.fillReport( "/home/hpulgar/Ireportes/5.6.0/PostGreSQL/ADempiere/NotaEntrega.jasper" , parametros, conexion );  // java.io.FileNotFoundException: /REPORTES/NotaEntrega.jasper 
            // JasperPrint jasperPrint = JasperFillManager.fillReport( rutaAbs+reporte, parametros, conexion );     // java.io.Fil
            /*
            JasperPrint jasperPrint = JasperFillManager.fillReport( r, parametros, conexion );     // java.io.F
            JRRtfExporter exporter = new JRRtfExporter();
            
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME,  "r.rtf");		    		   
            exporter.exportReport();
            */   
            /*-*/    
            //JasperViewer.viewReport(jasperPrint);
            /* Limpiamos y cerramos los flujos de salida */
            outputStream.flush();
            outputStream.close();
            conexion.close();
        %> 
    </body>
</html>
