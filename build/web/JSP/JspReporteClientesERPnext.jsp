<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<%-- Importamos las Libreria --%>   
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>CLIENTES ERPnext</title>
</head>
	<body>
	<%
		/* Parametros para realizar la conexion */
	    Connection conexion;
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	    conexion = DriverManager.getConnection("jdbc:mysql://193.168.0.57:3306/erpnextDB","root","root");
	    
	    /* Establecemos la ruta del reporte */
	    File reportFile = new File(application.getRealPath("/REPORTES/reportClientesERPnext.jasper"));
	    
	    /* Parametros  */
        Map parametros = new HashMap();
	    
        /* Enviamos el reporte ( ruta ), los parametrios y la conexion */
        byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, conexion);
        
        /* Indicamos que la respuesta va a ser en PDF */
        response.setContentType("application/pdf");
        response.setContentLength(bytes.length);
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.write(bytes, 0, bytes.length);

        /* Limpiamos y cerramos los flujos de salida */
        outputStream.flush();
        outputStream.close();;
    %>  
	</body>
</html>