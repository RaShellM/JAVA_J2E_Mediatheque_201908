<%-- 
    Document   : essaiRecherche
    Created on : 31 juil. 2019, 16:27:04
    Author     : Administrateur
--%>

<%@page import="com.rachelmartin.mediatheque.Rechercher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EssaiRecherche</title>
    </head>
    <body>
        <h1>Creation du bean</h1>
        <jsp:useBean id="MaRecherche" scope="session" class="com.rachelmartin.mediatheque.Rechercher"/>
        <jsp:setProperty name="MaRecherche" property="titre" value="rouge et noir"/><br>
        <jsp:setProperty name="MaRecherche" property="auteur" value="Stendhal"/><br>
        <jsp:setProperty name="MaRecherche" property="type" value="L"/>
        <jsp:forward page="/essaiUtilisationRechercheBean.jsp"/>
        </body>
</html>
