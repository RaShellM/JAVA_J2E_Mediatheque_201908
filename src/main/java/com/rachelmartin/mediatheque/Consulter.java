/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.mediatheque;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrateur
 */
public class Consulter extends HttpServlet {

   /* ArrayList<Media> catalogue;
    ServletContext sc; // pour afficher le catalogue dès l'entrée, 

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        catalogue = new ArrayList<>();
       // Importe();
        sc = config.getServletContext();
        sc.log("catalogue importé"); // ecriture dans le fichier journal du serveur tomcat
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("t"); // variable type récupere le paramètre passé par l'url (methode get, on donne des parametres via l'url)
        if (type == null) {
            resp.sendRedirect(sc.getContextPath()+"/index.jsp"); // va cherche le path du context.xml
            return;
        }
        resp.setContentType("text/html");
        PrintWriter p = resp.getWriter();
        p.println("<!DOCTYPE html>");
        p.println("<html>");
        p.println("<head>");
        p.println("<title>Consultation du catalogue</title>");
        p.println("</head>");
        p.println("<body style=\"font-size:40px ; text-align:center ; background-color: rgba(50,115,220,0.3)\">");
        sc.getRequestDispatcher("/nav.jsp").include(req,resp);
        p.println("<h2>essai d affichage du catalogue</h2>");
        p.println("<table>");

        StringBuilder sb = new StringBuilder();

        for (Media x : catalogue) {
            if (type.equals("L") && !(x instanceof Livre)) {
                continue; //continue va interrompre la boucle pour refaire une itération
            }
            if (type.equals("D") && !(x instanceof DVD)) {
                continue;
            }
            sb.append("<tr>");
            sb.append("<td>");
            sb.append(x.getTitre());
            sb.append("</td>");
            sb.append("<td>");
            sb.append(x.getAuteur());
            sb.append("</td>");
            sb.append("<td>");
            sb.append("nombre page");
            sb.append("</td>");
            sb.append("</tr>");
        }
        sb.append("</table>");
        p.println(sb.toString());//affichage du sb
        sc.getRequestDispatcher("/pied.html").include(req,resp);
        p.println("</body>");
        p.println("</html>");
    }
   /* public void Importe() {
        try {
            FileInputStream f = new FileInputStream("./data/export.csv"); // racine de tomcat c::/tomcat/bin/data
            Scanner sc = new Scanner(f);
            String ligne;
            while (sc.hasNextLine()) {
                ligne = sc.nextLine();
                String[] e = ligne.split(";");
                if (e.length == 0) {
                    continue;
                }

                try {
                    Media m;
                    switch (e[0]) {
                        case "D":
                            m = new DVD(e[1], e[2], Integer.parseInt(e[3].strip()));
                            break;
                        case "L":
                            m = new Livre(e[1], e[2], Integer.parseInt(e[3].strip()));
                            break;
                        default:
                            continue;
                    }
                    if (!catalogue.contains(m)) {
                        catalogue.add(m);
                    }
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }
            }
            f.close();

        } catch (FileNotFoundException ex) {
            Logger.getLogger(Consulter.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Consulter.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }*/
   
    }


