/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.mediatheque;
import com.rachelmartin.basedonnée.ManagerBase;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrateur
 */
public class Livre extends Media {
private int nbPage;

    public Livre(String Titre, String Auteur, int nbPage) throws Exception {
        super(Titre, Auteur);
        setNbPage(nbPage);
    }

    /**
     * Get the value of nbPage
     *
     * @return the value of nbPage
     */
    public int getNbPage() {
        return nbPage;
    }

    /**
     * Set the value of nbPage
     *
     * @param nbPage new value of nbPage
     */
    public void setNbPage(int nbPage) {
        this.nbPage = nbPage;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 53 * hash + this.nbPage;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Livre other = (Livre) obj;
        if (this.nbPage != other.nbPage) {
            return false;
        }
        return super.equals(obj);
    }
        @Override
    public String toString() {
        return super.toString() +" : Livre{" +  "nbPage=" + nbPage + '}';
    }

    @Override
    public void enregistre(PrintStream p) {
        StringBuilder sb = new StringBuilder("L");
        sb.append(";");
        sb.append(getTitre());
        sb.append(";");
        sb.append(getAuteur());
        sb.append(";");
        sb.append(nbPage);
        p.println(sb.toString());
    }

    @Override // implements de la methode getRequete de Media
    //notre methode pour construire la requete MySQL de UPDATE des data sur la BDD distante
    public String getRequete() {
        // TODO mettre le nom de la table en paramètre
       StringBuilder sb = new StringBuilder("INSERT INTO livre (titre, auteur, nbpages)");
       sb.append(" VALUES ('");
       sb.append(getTitre());
       sb.append("','");
       sb.append(getAuteur());
       sb.append("','");
       sb.append(getNbPage());
       sb.append("')");
       return sb.toString();
    }
    public static ArrayList<Media> getAll(){
      ArrayList<Media> catalogue = new ArrayList();
    try {
        Connection c = ManagerBase.getManagerBase().getConnection();
        Statement st = c.createStatement();
        String requete = "SELECT titre, auteur, nbpages from Livre";
        ResultSet reponse = st.executeQuery(requete);
        while (reponse.next()){
            
            try {
                Livre l = new Livre(reponse.getString("titre"), reponse.getString("auteur"), reponse.getInt("nbpages"));
                catalogue.add(l);
            } catch (Exception ex) {
                Logger.getLogger(Livre.class.getName()).log(Level.SEVERE, null, ex);
            }    
        }
    } catch (SQLException ex) {
        Logger.getLogger(Livre.class.getName()).log(Level.SEVERE, null, ex);
    }
    return catalogue;
    }
}