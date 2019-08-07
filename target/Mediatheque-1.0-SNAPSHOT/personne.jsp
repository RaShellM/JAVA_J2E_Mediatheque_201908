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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
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
    </body>
</html>
