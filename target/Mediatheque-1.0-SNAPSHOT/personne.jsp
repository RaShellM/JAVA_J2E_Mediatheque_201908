<%-- 
    Document   : personne
    Created on : 5 août 2019, 16:01:26
    Author     : Administrateur
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <h1>Essai de connection de à la base de donnée -  nos lecteurs </h1>
        
        <div class="jumbotron md-5">
        <%
            //Variable de connexion
            String user = "root";
            String password = "";
            String url = "jdbc:mysql://localhost:3306/javademo?zeroDateTimeBehavior=convertToNull&serverTimezone=Europe/Paris";
            out.println("<h2>Les resultats : </h2>");
            //Test appel du driver
            try {
                Class.forName("com.mysql.jdbc.Driver");
                //Appel de la connexion + parametres
                Connection connexion = DriverManager.getConnection(url, user, password);
                //Etat 
                Statement stmt = connexion.createStatement();
                //Requete Sql
                String requete = "SELECT nom,age,mdp "
                        + "FROM personne "
                        + "ORDER BY nom";
                //Execution de la requete
                ResultSet resultat = stmt.executeQuery(requete);
        %>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Nom</th>
                    <th scope="col">Age</th>

                    <th scope="col">Mot de passe</th>
                </tr>
            </thead>
            <tbody>
                <%      //Affichage des résultats
                    while (resultat.next()) {
                        //Appel des valeurs
                        String nom = resultat.getString("nom");
                        int age = resultat.getInt("age");
                        String motdepasse = resultat.getString("mdp");
                %>
                <tr>
                    <td><%out.println(nom); %></td>
                    <td><% out.println(age); %></td>
                    <td><% out.println(motdepasse); %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        getServletContext().log(e.getMessage());
                    }
                %>
                </div>
                
                <%@include file="pied.html" %>

            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
