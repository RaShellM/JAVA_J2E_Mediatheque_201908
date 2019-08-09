<%-- on indique la nav en .jsp pour pouvoir appeler les routages dynamiques, 
avec les méthodes getContextPath du getServletConfig lui mm du GetServletDonfig --%>

<nav class="navbar navbar-light" style="background-color: #99334e;">
    
  <a class="navbar-brand" href="<%= application.getContextPath()%>">
    <img src="./img/home.jpg" alt="HOME" width="30" height="30" class="d-inline-block align-top" alt="">
    HOME
  </a>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ADMINISTRATEUR
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<%= application.getContextPath()%>/consult-media-bdd.jsp">Consulter l'ensemble des médias</a>
          <a class="dropdown-item" href="<%= application.getContextPath()%>/personne.jsp">Consulter l'ensemble des personnes</a>
          <a class="dropdown-item" href="<%= application.getContextPath()%>/admin.jsp">Aller sur la page ADMIN</a>
        </div>
      </li>
    
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          VOUS
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<%= application.getContextPath()%>/connexion.jsp">Se connecter</a>
          <a class="dropdown-item" href="<%= application.getContextPath()%>/Deconnecter">Se deconnecter</a>
          <a class="dropdown-item" href="<%= application.getContextPath()%>/nouveauLecteur.jsp">s'inscrire via ORM</a>
        </div>
      </li>
    
    <div class="row">
        <div class="col-3">
            <ul>
                <li class="bouton">
                    <a href="<%= application.getContextPath()%>/admin.jsp">
                        Se connecter en admin</a>
                </li>
                <li class="bouton">
                    <a href="<%= application.getContextPath()%>/consult-media-bdd.jsp">
                        Voir la vue Media dans BDD</a>
                </li>
                    <li class="bouton">
                    <a href="<%= application.getContextPath()%>/personne.jsp">
                        Voir les Lecteurs et mdp</a>
                </li>
            </ul>
        </div>
                        <div class="col-3">
                        <ul>
                <li class="bouton">
                    <a href="<%= application.getContextPath()%>/connexion.jsp">
                        Se connecter</a>
                </li>
                 <li class="bouton">
                    <a href="<%= application.getContextPath()%>/nouveauLecteur.jsp">
                        S'inscrire via ORM</a>
                </li>
                 <li class="bouton"
                    style="color:black"> <%=request.getSession().getAttribute("id")%>, Vous êtes connecté
                </li>
                
                <li class="bouton">
                    <a href="<%= application.getContextPath()%>/Deconnecter">
                        Se deconnecter</a>
                </li>
            </ul>
        </div>
        <div class="col-3">
            <ul class="navigation">
                <li class="bouton">
                    <a  href="<%= application.getContextPath()%>/consulter.jsp?t=L">
                        Consulter un livre
                    </a>
                </li>
                <li class="bouton">
                    <a href="<%= application.getContextPath()%>/consulter.jsp?t=D">
                        Consulter un dvd
                    </a>
                </li>
                <li class="bouton">
                    <a href="<%= application.getContextPath()%>/consulter.jsp?t=F">
                        Consulter un film
                    </a>
                </li>
        </div>
        <div class="col-3">
            <ul>
            <li class="bouton">
                <a href="<%= application.getContextPath()%>/Emprunter">
                    Emprunter
                </a>
            </li>

            <li class="bouton">
                <a href="<%= application.getContextPath()%>/entreeRech.jsp">
                   chercher un media
                </a>
            </li>
            </ul>
        </div>
       
    </div>
</ul>
<!--<hr style=clear:both;>-->



</nav>


