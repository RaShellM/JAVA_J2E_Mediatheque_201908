/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.authentification;

import com.rachelmartin.orm.Personne;
import com.rachelmartin.orm.Villes;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrateur
 */
public class NewReaderFromORM extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
        
        HttpSession session = request.getSession(true); // on récupere une session ou si elle n'existe pas on la crée
        
        String newNomSaisi = request.getParameter("newidentifiant");//champ name de  l'input
        String newmdpSaisi = request.getParameter("newmdp");
       // String newAgeSaisi = request.getParameter("newage");
       // int newAgeDB = Integer.parseInt(newAgeSaisi);
        String newEmailSaisi = request.getParameter("newemail");
        String newsexeSaisi = request.getParameter("newsexe");
        
        EntityManagerFactory emf = null;
        EntityManager em = null;

            try {
                //persistance pour créer des nouveaux objest
                emf = Persistence.createEntityManagerFactory("mediaPU");
                em = emf.createEntityManager();

                //pour instancier le début d'un changement dans la db
                EntityTransaction transac = em.getTransaction();

                transac.begin();

                Villes v = new Villes();
                v.setNom("Paris");
                em.persist(v);

                Personne p2 = new Personne();
                p2.setSexe(newsexeSaisi);
                p2.setEmail(newEmailSaisi);
                p2.setNom(newNomSaisi);
                p2.setMdp(newmdpSaisi);
                p2.setIdville(v);
                em.persist(p2);

                transac.commit();

            } finally {
                if (em != null) {
                    em.close();
                }
                if (emf != null) {
                    emf.close();
                }
            }
        
        this.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
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
