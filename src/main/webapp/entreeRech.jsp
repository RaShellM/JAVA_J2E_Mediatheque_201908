<%-- 
    Document   : entreeRech
    Created on : 1 août 2019, 10:28:55
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%@include file="./header.jsp" %>
    </head>
    <body>
        <div class="row">
            <div class="col">
            
         <%@include file="./nav.jsp" %>
         <jsp:useBean id="MaRecherche" scope="session" class="com.rachelmartin.mediatheque.Rechercher"/>
         
        <h1>votre recherche</h1>

         <form method="POST" action="resultatRech.jsp">
            <label for="auteurform">AUTEUR : </label>
            <input type="text" name="auteurform" id="auteur" value="<jsp:getProperty name="MaRecherche" property="auteur"/>"/>
            <br><br>
            <label for="auteurform">TITRE : </label>
            <input type="text" name="titreform" id="titre" value="<jsp:getProperty name="MaRecherche" property="titre"/>"/>
            <br><br>
            <label for="titreform">TYPE : </label>
            <input type="text" name="typeform" id="auteur" value="<jsp:getProperty name="MaRecherche" property="type"/>"/>
            
            <input type="submit" value="Rechercher"/>
        </form>
        </div> 
            
             <div class="col">
                 
           
           
        </div>    
</div> 
        
        <%-- <jsp:setProperty name="MaRecherche" property="titre" value="rouge et noir"/><br>
        <jsp:setProperty name="MaRecherche" property="auteur" value="Stendhal"/><br>
 <jsp:setProperty name="MaRecherche" property="type" value="L"/>--%>

        
    
         <%@include file="./pied.jsp" %>
    </body>
    
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
