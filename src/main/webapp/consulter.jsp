<%-- 
    Document   : consulter.jsp
    Created on : 31 juil. 2019, 12:26:48
    Author     : Administrateur
--%>

<%@page import="com.rachelmartin.mediatheque.Catalogue"%>
<%@page import="com.rachelmartin.mediatheque.DVD"%>
<%@page import="com.rachelmartin.mediatheque.Livre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rachelmartin.mediatheque.Media"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! ArrayList<Media> catalogue;%> <%-- on appelle la méthode get de la classe Catalogue.java
la methode get fait intervenir la méthode importe()
poour pouvoir faire fonctionner la méthode Importe()--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulter.jsp</title>
        <%@include file="./header.jsp" %>
    </head>

    <body>
        <%@include file="./nav.jsp" %>
        <h1>DANS NOTRE BIBLIOTHEQUE, NOUS AVONS</h1>
            <p>Affichage via consulter.jsp, qui appelle la méthode Catalogue.java</p>

        <%--*<%Livre a = new Livre("stendhal", "pierre", 45);%><%=a.getTitre()%>--%>
        <%
            catalogue = Catalogue.get();//ici on appelle la méthode get sans paramètre, donc import de la DB
            String type = request.getParameter("t");
            if (type == null) {
                response.sendRedirect(getServletConfig().getServletContext().getContextPath() + "/index.jsp");
                return;
            }

            //préparation pour le switch, transformation de la variable t en type int. 
            int typeint = 0;
            if (type == "L") {
                typeint = 1;
             
            }
            if (type.equals("D")) {
                typeint = 2;
              
            }
            if (type.equals("F")) {
                typeint = 3;
           
            }
            String titretype;

            switch (typeint) {
                case 1:
                    titretype = "nos livres";%>
                    <H2><%= titretype%></H2>
        <%
                        break;
                    case 2:
                        titretype = "nos dvd";%>
                    <h2> <%= titretype%></h2>
                    <%
                        break;
                    case 3:
                        titretype = "mes film";%>
        <%= titretype%>
        <h2>NOS FILMS</h2><%
                        break;
                    default:%>
        <a href="
           <%= getServletConfig().getServletContext().getContextPath()%>/index.jsp"></a><%
                       titretype = "inconnu";
               }
        %><table>
            <tr>
                <th>TITRE
                </th>
                <th>AUTEUR
                </th>
                <th>Duree/Nb page
                </th>
            </tr><%
                for (Media x : catalogue) {
                    if (type.equals("L") && (x instanceof Livre)) {//récupéré le paramètre passé dans l'url (L ou D)
                        Livre l = (Livre) x; //continue va interrompre la boucle pour refaire une itération
            %>
            <tr>
                <td>
                    <%= l.getTitre()%>
                </td>
                <td>
                    <%= l.getAuteur()%>
                </td>
                <td>
                    <%= l.getNbPage()%>
                </td>
            </tr>
            <% }
                if (type.equals("D") && (x instanceof DVD)) {
                    DVD d = (DVD) x;
            %>
            <tr>
                <td>
                    <%= d.getTitre()%>
                </td>
                <td>
                    <%= d.getAuteur()%>
                </td>
                <td>
                    <%= d.getDuree()%>
                </td>
            </tr>
            <%  }
                }%>
        </table>


        <%@include file="pied.jsp" %>
    </body>
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
