<%-- 
    Document   : jspReportMovimientos
    Created on : 20 ago. 2020, 1:33:52 p. m.
    Author     : hpulgar
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- Importamos las Libreria --%>   
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movimientos Almacen</title>
    </head>
    <body>
    <center> <h3>MOV DE ALMACEN DE SUPLIDOS Y REPUESTOS</h3> </center>
    </body>
    <%
        /* Parametros para realizar la conexion */
        Connection conexion;
        Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
        conexion = DriverManager.getConnection("jdbc:oracle:thin:@193.168.0.59:1521:DES112","OPS$DESSUP03","OPS$DESSUP03");
        
        /* Establecemos la ruta del reporte */
        /* Los siguientes ejemplos de reportes funcionaron correctamente en Bqto al 13 Abril 2018 */
        /* File reportFile = new File(application.getRealPath("/REPORTES//report1.jasper")); */
        File reportFile = new File(application.getRealPath("/REPORTES//MovimientosAlmacen.jasper"));
        
        /* No enviamos parametros porque nuetro reporte NO lo requiere */
        Map parametros = new HashMap();
        //System.out.println("tipoMov="+request.getParameter("tipo_mov")); 
        //System.out.println("fecha1="+request.getParameter("fecha1")); 
        //System.out.println("fecha2="+request.getParameter("fecha2")); 
        parametros.put("tipoMov",request.getParameter("tipo_mov") );
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");   
        parametros.put("fecha1", dFormat.parse( request.getParameter("fecha1") )); 
        //parametros.put("fecha2", request.getParameter("fecha2"));   // Error!!!!!!!
        //parametros.put("fecha2", dFormat.parse("2020-06-30"));
        parametros.put("fecha2", dFormat.parse(request.getParameter("fecha2") ));
        /* Enviamos el reporte ( ruta ), los parametrios y la conexion */
        byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, conexion);
        
        
        /* Indicamos que la respuesta va a ser en PDF */
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.write(bytes, 0, bytes.length);

        /* Limpiamos y cerramos los flujos de salida */
        outputStream.flush();
        outputStream.close();
    %>  
</html>