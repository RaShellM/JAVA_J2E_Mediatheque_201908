<%-- 
    Document   : essaiUtilisationRechercheBean
    Created on : 31 juil. 2019, 16:57:22
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
        <h1>Utilisatin du beanRecherche</h1>
        <jsp:useBean id="MaRecherche" scope="session" class="com.rachelmartin.mediatheque.Rechercher"/>
        <jsp:getProperty name="MaRecherche" property="titre"/>
        <jsp:getProperty name="MaRecherche" property="auteur"/>
        <jsp:getProperty name="MaRecherche" property="type"/>
    </body>
</html>
