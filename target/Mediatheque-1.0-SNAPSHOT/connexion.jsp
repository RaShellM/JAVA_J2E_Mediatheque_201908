<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <%@include file="./header.jsp" %>
        <title>Page d'identifiation</title>

    </head>


    <body>
        <div class="container">

            <div class="row">Page d'identifiation</div>

            <div class="row">
                <div class="col-6">
                    <h2>LECTEUR DEJA IDENTIFIE</h2>
                    <br>
                    <form name="connexion" method="POST" action="/Mediatheque/SAuthentifier">
                        <label for="identifiant">Identifiant
                            <input type="text" name="identifiant" size="40" />
                        </label>
                        <br>
                        <label for="mdp">Mot de passe
                            <input type="password" name="mdp" size="40" />
                        </label>
                        <input type="submit" value="s'authentifier" />
                    </form>
                </div>

                <div class="col-6">
                    <h2>NOUVEAU LECTEUR</h2>
                    <br>
                    <form name="nexlecteur" method="POST" action="/Mediatheque/SInscrire">
                        <label for="newidentifiant">Identifiant
                            <input type="text" name="newidentifiant" size="40" />
                        </label>
                        <br>
                        <label for="newmdp">Mot de passe
                            <input type="password" name="newmdp" size="40" />
                        </label>
                        <input type="submit" value="s'inscrire" /> <!--le value donne juste le nom du bouton-->
                    </form>
                </div>
            </div>
        </div>
        <%@include file="pied.html" %>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>

    </body>
</html>

