<%-- 
    Document   : nouveauLecteur
    Created on : 9 août 2019, 11:07:08
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
        <h1>NOUVEAU LECTEUR</h1>
        
         <h2>via ORM JPA</h2>
                    <br>
                    <form name="nexlecteur" method="POST" action="<%= application.getContextPath()%>/NewReaderFromORM">
                        <label for="newidentifiant">Identifiant
                            <input type="text" name="newidentifiant" size="40" />
                        </label>
                        <br>
                        <label for="newmdp">Mot de passe
                            <input type="password" name="newmdp" size="40" />
                        </label>
<br>
                        <label for="age">Votre age 
                            <input type="text" name="newage" size="3" />
                        </label>
<br>                     
                        <label for="email">Votre email
                         <input type="text" name="newemail" size="40" />
                        </label>
<br>                     
                        <label for="sexe">Genre (F pour Femme ou H pour Homme)
                         <input type="text" name="newsexe" size="40" />
                        </label>          
                        
                        <input type="submit" value="s'inscrire" /> <!--le value donne juste le nom du bouton-->
                    </form>
    </body>
</html>
