/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.authentification;

import com.rachelmartin.authentification.AuthentifLecteur;
import com.rachelmartin.authentification.NouveauLecteur;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrateur
 */
public class SInscrire extends HttpServlet {
ServletContext sc;
    
    @Override
    public void init(ServletConfig config) throws ServletException { //ici on instancie le servlet Context, variable
        super.init(config);
        sc = config.getServletContext();
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
 @Override
    // pour empécher d'indiquer les mdp par le get ?dans l'url
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(sc.getContextPath()+"/connexion.html"); 
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(true); // on récupere une session ou si elle n'existe pas on la crée
        
        String newidSaisi = request.getParameter("newidentifiant");//champ name de  l'input
        String newmdpSaisi = request.getParameter("newmdp");
        
//controle de validité du login et mot de passe
        if (newidSaisi !=null && newmdpSaisi !=null){
            NouveauLecteur.ajoutLecteur(newidSaisi, newmdpSaisi);
            session.setAttribute("id", newidSaisi); // définition de la cession de l'utilisateur avec un attribut ID
            response.sendRedirect(sc.getContextPath()+"/Emprunter");
            return; // met fin au code doPost si le code effectue le if
            }
        else{
            response.sendRedirect(sc.getContextPath()+"/connexion.html");
        }
    }
}
