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
public class DVD extends Media {

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

    public DVD(String Titre, String Auteur, int duree) throws Exception {
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
        final DVD other = (DVD) obj;
        if (this.duree != other.duree) {
            return false;
        }
        return super.equals(obj);
    }

    @Override
    public String toString() {
        return super.toString() +" : DVD{" +  "duree=" + duree + '}';
    }
        @Override
    public void enregistre(PrintStream p) {
        StringBuilder sb = new StringBuilder("D");
        sb.append(";");
        sb.append(getTitre());
        sb.append(";");
        sb.append(getAuteur());
        sb.append(";");
        sb.append(duree);
        p.println(sb.toString());
    }
}

