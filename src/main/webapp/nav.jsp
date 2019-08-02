<%-- on indique la nav en .jsp pour pouvoir appeler les routages dynamiques, 
avec les méthodes getContextPath du getServletConfig lui mm du GetServletDonfig --%>

<nav>
    <div class="navigation" row>
        <div class="bouton">
            <a href="/Mediatheque">
                <img id="home" src="./img/home.jpg" alt="HOME"/>
            </a>    
        </div>
       
        <div class="bouton">
            <a  href="<%= getServletConfig().getServletContext().getContextPath()%>/consulter.jsp?t=L">
                Consulter un livre
            </a>
        </div>
        <div class="bouton">
            <a href="<%= getServletConfig().getServletContext().getContextPath()%>/consulter.jsp?t=D">
                Consulter un dvd
            </a>
        </div>
        <div class="bouton">
            <a href="<%= getServletConfig().getServletContext().getContextPath()%>/consulter.jsp?t=F">
                Consulter un film
            </a>
        </div>
        <div class="bouton">
            <a href="<%= getServletConfig().getServletContext().getContextPath()%>/Emprunter">
                Emprunter
            </a>
        </div>
                <div class="bouton">
            <a href="<%= getServletConfig().getServletContext().getContextPath()%>/entreeRech.jsp">
                Rechercher
            </a>
        </div>
        <hr style=clear:both;>

    </div>

</nav>


