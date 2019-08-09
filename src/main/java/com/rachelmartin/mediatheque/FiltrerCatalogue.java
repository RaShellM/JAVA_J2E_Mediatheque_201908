/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.mediatheque;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Stream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrateur
 */
public class FiltrerCatalogue extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //on récupere les attributs du catalogue      
        Rechercher r = (Rechercher) request.getSession().getAttribute("MaRecherche");
// Catalogue.get = méthode qui instancie l'array liste et fait l'importe
// nouvelle array liste de classe media
//servletcontexte donne l'info sur l'environnement de l'app web 
      ArrayList<MediaMetier> resultatFiltre = Catalogue.get();//syntaxe de navigation web qui donner le nom effectif de l'endroit de stockage du .csv

        // on ajoute les résultats de notre recherche dans une nouvelle ArrayList  
        if (r.getTitre().trim().length() != 0) { // faire la recherche par titre seulement si l'auteur n'est pas renseigné
            ArrayList<MediaMetier> filtreSurTitreDansCatalogue = new ArrayList<MediaMetier>();
            for (MediaMetier x : resultatFiltre) {
                if (x.getTitre().trim().equalsIgnoreCase(r.getTitre().trim())) {
                    filtreSurTitreDansCatalogue.add(x);
                }
            }
            resultatFiltre = filtreSurTitreDansCatalogue;
        }

        if (r.getAuteur().trim().length() != 0) { // faire la recherche par auteur seulement si l'auteur n'est pas renseigné
            ArrayList<MediaMetier> filtreSurAuteurDansCatalogue = new ArrayList<MediaMetier>();
            for (MediaMetier x : resultatFiltre) {
                if (x.getAuteur().trim().equalsIgnoreCase(r.getAuteur().trim())) {
                    filtreSurAuteurDansCatalogue.add(x);
                }
            }
            resultatFiltre = filtreSurAuteurDansCatalogue;
        }

// pour afficher le résultat -> la methode Filtrer Catalogue est appelée dans la page resultatRech.jsp (intégration par <jsp:include page="
        PrintWriter sortie = response.getWriter();
        //for (MediaMetier x : ResultatFiltre){
        // sortie.println(x.getAuteur()+" "+ x.getTitre() +"<br>");
        // }
// le nom de l'attribut qu'on peut récupérer apres sur un jsp par un getAttribute associé au resultat du filtre
        request.getSession().setAttribute("resultat", resultatFiltre);

        /* response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
 /* out.println(r)
        }*/
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
