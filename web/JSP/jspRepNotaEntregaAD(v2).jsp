<%-- 
    Document   : jspProductosAD
    Created on : 30 nov. 2023, 3:31:15 p. m.
    Author     : hpulgar
    *NOTA IMPORTANTE: El proceso utilizado para ejecutar el metodo 
     JasperViewer / JRViewer funciona solo del lado del Servidor---
     *no del lado del cliente*********
--%>

<%@page import="org.zkoss.zk.ui.Executions"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<%-- Importamos las Libreria --%>   
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%
    // Doc:  https://stackoverflow.com/questions/15405173/send-jasperreport-as-html 
    /* Parametros para realizar la conexion */
    Connection conexion;
    /* 
    "com.mysql.jdbc.Driver"
    "org.postgresql.Driver"
    */ 
    Class.forName("org.postgresql.Driver").newInstance();
    final String linkConexionProd = "jdbc:postgresql://192.168.1.2:5434/DDH";    // ADempeire en Prodccion. 
    final String linkConexionTest = "jdbc:postgresql://192.168.1.2:54323/DDH";   // ADempeire en desica-test 
    final String reporte = "NotaEntrega(v2).jasper";  
    //*   
    conexion = DriverManager.getConnection( linkConexionProd,"adempiere","AzLY7Dzx59g" );
    //conexion = DriverManager.getConnection( linkConexionTest,"adempiere","adempiereTest" );
    
    // System.out.println( conexion ); 
    
    /*-*/
    // JasperReport jasperReporte = JasperCompileManager.compileReport("/REPORTES/NotaEntrega.jrxml");
    // InputStream inputStream = new FileInputStream ("/home/hpulgar/Ireportes/5.6.0/PostGreSQL/ADempiere/NotaEntrega.jrxml");
    // InputStream inputStream = new FileInputStream ("/NotaEntrega.jrxml"); // ???????????? Problema con la ubicacion del archivo, Revisar ???? 

    // JasperReport jasperReporte = JasperCompileManager.compileReport("/home/hpulgar/Ireportes/5.6.0/PostGreSQL/ADempiere/NotaEntrega.jrxml");

    // JasperDesign jasperDesign = JRXmlLoader.load(inputStream);

    // JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);

    File reportFile = new File( application.getRealPath("/REPORTES/"+reporte ) ); 

    Map parametros = new HashMap(); 
    Integer i = Integer.valueOf( request.getParameter("s_organizacion" ).substring(0, 7) );    
    parametros.put( "p_org_id", i ); 
    parametros.put( "p_nro_entrega", request.getParameter("nro_nota_entrega") ); 
    // JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, conexion );

    // JasperPrint jasperPrint = JasperFillManager.fillReport("/REPORTES/NotaEntrega.jasper", parametros, conexion );

    // JasperPrint jasperPrint = JasperFillManager.fillReport("/home/hpulgar/Ireportes/5.6.0/PostGreSQL/ADempiere/NotaEntrega.jasper", parametros, conexion );
    // JasperPrint jasperPrint = JasperFillManager.fillReport( application.getRealPath("/REPORTES/NotaEntrega.jasper" ), parametros, conexion );   // No funciono,... 

    // System.err.println( reportFile.getAbsolutePath() );
    // System.out.println( application.getRealPath("/REPORTES/NotaEntrega.jasper") );

    // File f = new File("REPORTES/NotaEntrega.jrxml");
    // System.out.println( f.getAbsolutePath().toString() ); 

    //String rutaAbs = "/home/hpulgar/ApacheNetbeans19Projects(openJDK17)/ZK_ADempiere/web/REPORTES/"; 
    // String reporte = "NotaEntrega.jasper";  
    // System.out.println("HOLA");   // ????? Hell..!! What's Wrong ???????????????? 
    // String r = reportFile.getAbsolutePath().toString();     // No funciono ???? 
    String r = reportFile.toString();   
    // JasperPrint jasperPrint = JasperFillManager.fillReport( "/home/hpulgar/Ireportes/5.6.0/PostGreSQL/ADempiere/NotaEntrega.jasper" , parametros, conexion );  // java.io.FileNotFoundException: /REPORTES/NotaEntrega.jasper 
    // JasperPrint jasperPrint = JasperFillManager.fillReport( rutaAbs+reporte, parametros, conexion );     // java.io.Fil
    JasperPrint jasperPrint = JasperFillManager.fillReport( r, parametros, conexion );     // java.io.Fil

    // JasperExportManager.exportReportToPdfFile(jasperPrint, "testjasper.pdf"); 

    // JasperViewer.viewReport(jasperPrint);

    JasperViewer jviewer=new JasperViewer(jasperPrint,false);

    jviewer.setTitle("IMPRIMIR NOTA DE ENTREGA vADempiere");

    jviewer.setVisible(true);

    // JasperPrintManager.printReport(jasperPrint, true);
    /*-*/
    conexion.close();
    //Executions.sendRedirect("../index.zul");    
%>     
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nota Entrega</title>
    </head>
    <body>    
        <%-- El siguienten contenido contamina el proceso : SUJETO A REVISION!!!! ??????????????? 
        <br/>
        Lenguaje preferido:
        <select name="lenguaje">
            <option value="java">java
            <option value="jsp" selected>jsp
            <option value="php">php
            <option value="C/C++">C/C++
            <option value="C#">C#
            <option value="Asp">Asp
            <option value="AS3">AS3
        </select>
        <br/>
        Importamos las Libreria --%>  
    </body>
</html>
