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
public class DVDMetier extends MediaMetier {

    private int duree;

    /**
     * Get the value of duree
     *
     * @return the value of duree (in seconds)
     */
    public int getDuree() {
        return duree;
    }

    /**
     * Set the value of duree
     *
     * @param duree new value of duree in seconds)
     */
    public void setDuree(int duree) {
        this.duree = duree;
    }

    public DVDMetier(String Titre, String Auteur, int duree) throws Exception {
        super(Titre, Auteur);
        setDuree(duree);
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 47 * hash + this.duree;
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
        final DVDMetier other = (DVDMetier) obj;
        if (this.duree != other.duree) {
            return false;
        }
        return super.equals(obj);
    }

    @Override
    public String toString() {
        return super.toString() +" : DVD{" +  "duree=" + duree + "}";
    }
        @Override
    public void enregistre(PrintStream p) {
        StringBuilder sb = new StringBuilder("D");
        sb.append(";");
        sb.append(getTitre());
        sb.append(";");
        sb.append(getAuteur());
        sb.append(";");
        sb.append(getDuree());
        p.println(sb.toString());
    }
    
        @Override // implements de la methode getRequete de MediaMetier
    public String getRequete() {
        // TODO mettre le nom de la table en paramètre
       StringBuilder sb = new StringBuilder("INSERT INTO dvd (titre, auteur, duree)");
       sb.append(" VALUES ('");
       sb.append(getTitre());
       sb.append("','");
       sb.append(getAuteur());
       sb.append("','");
       sb.append(duree);
       sb.append("')");
       return sb.toString();
    }
    public static ArrayList<MediaMetier> getAll(){
      ArrayList<MediaMetier> catalogue = new ArrayList();
    try {
        Connection c = ManagerBase.getManagerBase().getConnection();
        Statement st = c.createStatement();
        String requete = "SELECT titre, auteur, duree from dvd";
        ResultSet reponse = st.executeQuery(requete);
        while (reponse.next()){
            
            try {
                DVDMetier d = new DVDMetier(reponse.getString("titre"), reponse.getString("auteur"), reponse.getInt("duree"));
                catalogue.add(d);
            } catch (Exception ex) {
                Logger.getLogger(LivreMetier.class.getName()).log(Level.SEVERE, null, ex);
            }    
        }
    } catch (SQLException ex) {
        Logger.getLogger(LivreMetier.class.getName()).log(Level.SEVERE, null, ex);
    }
    return catalogue;
    }
}

