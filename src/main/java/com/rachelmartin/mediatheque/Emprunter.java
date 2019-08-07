package com.rachelmartin.mediatheque;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class Emprunter extends HttpServlet { // on extend de classe HTTPServlet pour le DoGet et le DoPost de http.
   
    ServletContext sc; // pour afficher le catalogue dès l'entrée, 

    @Override
    public void init(ServletConfig config) throws ServletException { //ici on instancie le sc, variable
        super.init(config);
        sc = config.getServletContext(); //ca permet à la servlet de communiquer avec son environnement
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String id = (String) session.getAttribute("id");//ici la valeur de la session va dans id
        if (id == null) {
            sc.getRequestDispatcher("/connexion.jsp").forward(request, response); //si l'authentification n'a pas encore eu lieu, on renvoie sur la page connexion.html; dont l'action fait fonctionner le servlet sauthentifier
            return;
        }
        else{
            sc.getRequestDispatcher("/emprunter.jsp").forward(request, response);
        }
        
        response.setContentType("text/html"); // on pourra générer ca dans le code jsp en entête
        PrintWriter p = response.getWriter();
        p.println("<DOCTYPE html>");
        p.println("<html>");
        p.println("<head>");
        p.println("</head>");
        p.println("<body>");
        p.println("<h1>Page pour Emprunter</h1>");
        p.println("</body>");
        p.println("</html>");
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
