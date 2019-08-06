<%-- 
    Document   : admin
    Created on : 6 août 2019, 12:20:22
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Page pour l'administrateur!</h1>
        <a href="<%= getServletConfig().getServletContext().getContextPath()%>/SendCsvInBDD">Envoyer les données du csv dans la base de donnée</a>
    </body>
</html>
