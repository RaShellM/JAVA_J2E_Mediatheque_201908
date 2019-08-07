
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
       
        <%@include file="nav.jsp" %>
        
        
         <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
                           url="jdbc:mysql://localhost:3306/javademo?zeroDateTimeBehavior=convertToNull&serverTimezone=Europe/Paris"  
                           user="root"  password=""/> 
        <h1>consultation MEDIA </h1>
           
 <div class="jumbotron">
     <p>Ici on consulte la VUE dans BASE DE DONNEE phpMyADMIN - DB mySQL</p>
        <sql:query var="mediaDB" dataSource="${db}">
            SELECT type,titre,auteur  FROM media
        </sql:query>
        <table>
           
        <c:forEach var="x" items="${mediaDB.rows}" varStatus="compteur">
                <tr><td>${compteur.index}</td><td> ${x.type}</td><td>${x.titre}</td><td>${x.auteur}</td></tr>
            </c:forEach>
        </table>
       </div>
            
       <%@include file="pied.html" %>
    </body>
</html>
