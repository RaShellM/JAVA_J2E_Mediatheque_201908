<%-- on indique la nav en .jsp pour pouvoir appeler les routages dynamiques, 
avec les m�thodes getContextPath du getServletConfig lui mm du GetServletDonfig --%>

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
                    <a href="<%= getServletConfig().getServletContext().getContextPath()%>/admin.jsp">
                        Se connecter en admin</a>
                </li>
            </ul>
        </div>
                        <div class="col-3">
                        <ul>
                <li class="bouton">
                    <a href="<%= getServletConfig().getServletContext().getContextPath()%>/connexion.jsp">
                        Se connecter</a>
                </li>
                 <li class="bouton"
                    style="color:black"> <%=request.getSession().getAttribute("id")%>, Vous �tes connect�
                </li>
                <li class="bouton">
                    <a href="<%= getServletConfig().getServletContext().getContextPath()%>/Deconnecter">
                        Se deconnecter</a>
                </li>
            </ul>
        </div>
        <div class="col-3">
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
        <div class="col-3">
            <ul>
            <li class="bouton">
                <a href="<%= getServletConfig().getServletContext().getContextPath()%>/Emprunter">
                    Emprunter
                </a>
            </li>

            <li class="bouton">
                <a href="<%= getServletConfig().getServletContext().getContextPath()%>/entreeRech.jsp">
                   chercher un media
                </a>
            </li>
            </ul>
        </div>
       
    </div>
</ul>
<!--<hr style=clear:both;>-->



</nav>


