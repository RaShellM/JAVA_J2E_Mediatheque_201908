<%-- on indique la nav en .jsp pour pouvoir appeler les routages dynamiques, 
avec les méthodes getContextPath du getServletConfig lui mm du GetServletDonfig --%>

<nav>
    <div class="row">
        <div class="col">
            <ul>
                <li class="bouton">
                    <a href="/Mediatheque">
                        <img id="home" src="./img/home.jpg" alt="HOME"/>
                    </a>    
                </li>
                <li class="bouton">
                    <a href="<%= getServletConfig().getServletContext().getContextPath()%>/Deconnecter">
                        Se deconnecter</a>
                        <br>
                        <p style="color:black"> Vous êtes connecté en tant que <%=request.getSession().getAttribute("id")%></p>
                </li>
                 
            </ul>
        </div>
        <div class="col">
            <ul class="navigation">
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
        </div>
        <div class="col">
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
        </div>
       
    </div>
</ul>
<!--<hr style=clear:both;>-->



</nav>


