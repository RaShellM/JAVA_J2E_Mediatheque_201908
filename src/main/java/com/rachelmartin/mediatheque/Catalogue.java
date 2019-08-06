/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.mediatheque;

import com.rachelmartin.basedonnée.ManagerBase;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrateur
 */
public class Catalogue {

    static private ArrayList<Media> c;

    static public ArrayList<Media> get(String nomFichier) { // permet d'initialiser le catalogue s'il n'existe pas. 
        if (c == null) {
            c = new ArrayList<Media>();
            Importe(nomFichier);
        }
        return c;
    }

    static public void Importe(String nomFichier) {
        try {
            FileInputStream f = new FileInputStream("./data/export.csv"); // racine de tomcat c::/tomcat/bin/data sur une WebApp
            Scanner sc = new Scanner(f);
            String ligne;
            while (sc.hasNextLine()) {
                ligne = sc.nextLine();
                String[] e = ligne.split(";");
                if (e.length == 0) {
                    continue;// sort de la boucle et fait la suite du programme
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
                    if (!c.contains(m)) {
                        c.add(m);
                    }
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }
            }
            f.close();

        } catch (FileNotFoundException ex) {
            Logger.getLogger(Catalogue.class.getName()).log(Level.SEVERE, null, ex);//donner le nom de la classe qui a posé probleme et un niveau d'alerte important
        } catch (IOException ex) {
            Logger.getLogger(Catalogue.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void exportBDD(ArrayList<Media> catalogue) {
        Connection c = ManagerBase.getManagerBase().getConnection();
        try {
            Statement stmt;
            for (Media x : catalogue) {
                stmt = c.createStatement();
                String requete = x.getRequete(); // methode de la class Media, qui permet
                stmt.executeUpdate(requete);
                stmt.close(); // pour libérer la mémoire prise sur la base de donnée
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerBase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
