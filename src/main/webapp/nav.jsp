<%-- on indique la nav en .jsp pour pouvoir appeler les routages dynamiques, 
avec les méthodes getContextPath du getServletConfig lui mm du GetServletDonfig --%>

<nav>
    <ul class="navigation" row>
        
        <li class="bouton">
            <a href="/Mediatheque">
                <img id="home" src="./img/home.jpg" alt="HOME"/>
            </a>    
        </li>

        <li class="bouton">
            <a  href="<%= getServletConfig().getServletContext().getContextPath()%>/consulter.jsp?t=L">
                Consulter un livre
            </a>
        </li>
                
        <li class="bouton">
            <a href="<%= getServletConfig().getServletContext().getContextPath()%>/consulter.jsp?t=D">
                Consulter un dvd
            </a>
        </li>
                
        <li class="bouton">
            <a href="<%= getServletConfig().getServletContext().getContextPath()%>/consulter.jsp?t=F">
                Consulter un film
            </a>
        </li>
                
        <li class="bouton">
            <a href="<%= getServletConfig().getServletContext().getContextPath()%>/Emprunter">
                Emprunter
            </a>
        </li>
                
        <li class="bouton">
            <a href="<%= getServletConfig().getServletContext().getContextPath()%>/entreeRech.jsp">
                Rechercher
            </a>
        </li>
                
        <li class="bouton">
            <a href="<%= getServletConfig().getServletContext().getContextPath()%>/Deconnecter">
                Se deconnecter
            </a>
        </li>

    </ul>
    <!--<hr style=clear:both;>-->



</nav>


