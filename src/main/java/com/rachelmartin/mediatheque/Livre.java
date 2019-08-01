/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.mediatheque;
import java.io.PrintStream;

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
    
}