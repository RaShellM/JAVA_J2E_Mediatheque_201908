<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 
    Document   : resultatRech
    Created on : 1 août 2019, 10:26:00
    Author     : Administrateur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultat de Recherche</title>
        <%@include file="./header.jsp" %>
    </head>
    <body>
        <%@include file="nav.jsp" %>



        <%-- <jsp:setProperty name="MaRecherche" property="auteur" value="Stendhal"/><br>
         <jsp:setProperty name="MaRecherche" property="type" value="L"/>
        value="<%request.getParameter("auteur")%>"--%>

        <h1>Resultat de la recherche</h1>

        <div>
            <jsp:useBean id="MaRecherche" scope="session" class="com.rachelmartin.mediatheque.Rechercher"/>
            <jsp:setProperty name="MaRecherche" property="auteur" value='<%=request.getParameter("auteurform")%>'/>
            <jsp:setProperty name="MaRecherche" property="titre" value='<%=request.getParameter("titreform")%>'/>
            <jsp:setProperty name="MaRecherche" property="type" value='<%=request.getParameter("typeform")%>'/>
            <jsp:include page="/filtrerCatalogue"/> <!-- appelle la route qui est définie dans le web.xml, dans les servlet-->
            <table>
                <tr>
                    <th>
                        Titre
                    </th>
                    <th>
                        Auteur
                    </th>
                </tr>
                <c:forEach var="x" items="${sessionScope.resultat}">
                    <tr>
                        <td>${x.titre}</td>
                        <td>${x.getAuteur()}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <hr>

        <p>Revenir à la recherche</p>
        <form method="POST" action="entreeRech.jsp">
            <input type="submit"/>
        </form>
        <hr>

        <h5>via le fomulaire (les valeurs envoyées via methode POST)</h5>
        <p>out.print(request.getParameter("auteurform"));><p>
            <%out.print(request.getParameter("auteurform"));%>
            <%out.print(request.getParameter("titreform"));%>
            <%out.print(request.getParameter("typeform"));%>
        <hr>

        <%@include file="pied.html" %>
    </body>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
