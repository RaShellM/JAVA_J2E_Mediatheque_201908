<%-- 
    Document   : essai
    Created on : 31 juil. 2019, 11:36:43
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ServletContext sc;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <H1><%= getServletConfig().getServletContext().getContextPath()%></h1>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <H1><%= getServletConfig().getServletContext().getContextPath()%></h1>
    </body>
</html>
