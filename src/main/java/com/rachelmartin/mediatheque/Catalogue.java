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

    static private ArrayList<MediaMetier> c;
    
//methode pour instruire le catalogue depuis fichier csv (fait appel à la méthode importe(param))
    static public ArrayList<MediaMetier> get(String nomFichier) { // permet d'initialiser le catalogue s'il n'existe pas. 
            c = new ArrayList<MediaMetier>();
            ImporteDuCSV(nomFichier);
        return c;
    }
    
//methode pour importer les données de DB dans Catalogue
    static public ArrayList<MediaMetier> get() { // permet d'initialiser le catalogue s'il n'existe pas. 
            c = new ArrayList<MediaMetier>();
            lireBDD();
        return c;
    }
    
//methode pour importer le fichier .csv et lecture par ligne 
//pour instancier dans les classes LivreMetier et DVDMetier et créer le ArrayList catalogue
    static public void ImporteDuCSV(String nomFichier) {
        try {
            FileInputStream f = new FileInputStream(nomFichier); // racine de tomcat c::/tomcat/bin/data sur une WebApp
            Scanner sc = new Scanner(f);
            String ligne;
            while (sc.hasNextLine()) {
                ligne = sc.nextLine();
                String[] e = ligne.split(";");
                if (e.length == 0) {
                    continue;// sort de la boucle et fait la suite du programme
                }

                try {
                    MediaMetier m;
                    switch (e[0]) {
                        case "D":
                            m = new DVDMetier(e[1], e[2], Integer.parseInt(e[3].trim()));
                            break;
                        case "L":
                            m = new LivreMetier(e[1], e[2], Integer.parseInt(e[3].trim()));
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

    public static void exportBDD(ArrayList<MediaMetier> catalogue) {
        Connection c = ManagerBase.getManagerBase().getConnection();
        try {
            Statement stmt;
            for (MediaMetier x : catalogue) {
                stmt = c.createStatement();
                String requete = x.getRequete(); // methode de la class MediaMetier, qui permet
                stmt.executeUpdate(requete);
                stmt.close(); // pour libérer la mémoire prise sur la base de donnée
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagerBase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void lireBDD() {
        //TODO ecrire les fonctinos getAll dans chaque class media livre et dvd
        c = LivreMetier.getAll();
        c.addAll(DVDMetier.getAll());
               
    }
    
}
