<%-- on indique la nav en .jsp pour pouvoir appeler les routages dynamiques, 
avec les méthodes getContextPath du getServletConfig lui mm du GetServletDonfig --%>

<nav>
    <div class="row">
        <div class="col-3">
            <ul>
                <li class="bouton">
                    <a href="/Mediatheque">
                        <img id="home" src="./img/home.jpg" alt="HOME"/>
                    </a>    
                </li>
                <li class="bouton">
                    <a href="<%= application.getContextPath()%>/admin.jsp">
                        Se connecter en admin</a>
                </li>
                <li class="bouton">
                    <a href="<%= application.getContextPath()%>/consult-media-bdd.jsp">
                        Voir la vue Media dans BDD</a>
                </li>
            </ul>
        </div>
                        <div class="col-3">
                        <ul>
                <li class="bouton">
                    <a href="<%= application.getContextPath()%>/connexion.jsp">
                        Se connecter</a>
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


