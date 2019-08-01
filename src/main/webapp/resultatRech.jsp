<%-- 
    Document   : resultatRech
    Created on : 1 août 2019, 10:26:00
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultat de Recherche</title>
        <%@include file="./header.jsp" %>
    </head>
    <body>
           <%@include file="nav.jsp" %>
           
         
           
           <%-- <jsp:setProperty name="MaRecherche" property="auteur" value="Stendhal"/><br>
            <jsp:setProperty name="MaRecherche" property="type" value="L"/>
           value="<%request.getParameter("auteur")%>"--%>
           
        <h1>Resultat de la recherche</h1>
        
        <h2>via le fomulaire (les valeurs envoyées via methode POST)</h2>
        <p>out.print(request.getParameter("auteurform"));><p>
            <br>
        <%out.print(request.getParameter("auteurform"));%>
        <br>
        <%out.print(request.getParameter("titreform"));%>
        <br>
        <%out.print(request.getParameter("typeform"));%>
        
        <h2>via le bean, enregistré via la Servlet Rechercher</h2>
        
        <jsp:useBean id="MaRecherche" scope="session" class="com.rachelmartin.mediatheque.Rechercher"/>
           <jsp:setProperty name="MaRecherche" property="auteur" value='<%=request.getParameter("auteurform")%>'/>
           <jsp:setProperty name="MaRecherche" property="titre" param="titreform" />
           <jsp:setProperty name="MaRecherche" property="type" param="typeform" />
           
        <p>jsp:getProperty name="MaRecherche" property="auteur"/<p>
        <p> AUTEUR <jsp:getProperty name="MaRecherche" property="auteur"/></p>
        <p> TITRE <jsp:getProperty name="MaRecherche" property="titre"/></p>
        <p> TYPE <jsp:getProperty name="MaRecherche" property="type"/></p>
        
        
        <p>vous souhaitez faire une autre recherche</p>
  <form method="POST" action="entreeRech.jsp">
            <input type="submit"/>
</form>
        
        
        
         <%@include file="pied.html" %>
    </body>
</html>
