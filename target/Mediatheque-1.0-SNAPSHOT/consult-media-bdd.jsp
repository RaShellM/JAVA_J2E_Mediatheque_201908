
<%-- 
    Document   : consult-media-bdd
    Created on : 7 août 2019, 11:34:01
    Author     : Administrateur
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <%@include file="./header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pour consulter Media dans BDD</title>
    </head>
    <body>
       
        <%@include file="./nav.jsp" %>
        
        
         <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
                           url="jdbc:mysql://localhost:3306/mediatheque?zeroDateTimeBehavior=convertToNull&serverTimezone=Europe/Paris"  
                           user="root"  password=""/> 
        <h1>consultation MEDIA </h1>
           
 <div class="jumbotron">
     <p>Ici on consulte la VUE dans BASE DE DONNEE phpMyADMIN - DB mySQL
      <br>
     attention c'est à proscrire en production de l'app client, car il y a en clair le mot de passe et le compte. </p>
     
        <sql:query var="mediaDB" dataSource="${db}">
            SELECT type,titre,auteur  FROM media
        </sql:query>
        <table>
           
        <c:forEach var="x" items="${mediaDB.rows}" varStatus="compteur">
                <tr><td>${compteur.index}</td><td> ${x.type}</td><td>${x.titre}</td><td>${x.auteur}</td></tr>
            </c:forEach>
        </table>
       </div>
            
       <%@include file="./pied.jsp" %>
       
       
       
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
