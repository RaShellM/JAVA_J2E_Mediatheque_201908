/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.authentification;

import com.rachelmartin.basedonnée.ManagerBase;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrateur
 */
public class AuthentifLecteur {

    public static Boolean isLecteur(String nomTest, String mdpTest) {
        Connection c = ManagerBase.getManagerBase().getConnection();
        try {
            Statement stmt = c.createStatement();
            String requete = 
                    "SELECT count(*) "
                    + "FROM personne "
                    + "WHERE nom = '" + nomTest + "' AND mdp ='" + mdpTest + "'";
// resultSet est un tableau
            ResultSet resultat = stmt.executeQuery(requete);

            if (resultat.next()) {
                int nb = resultat.getInt(1);
                return nb == 1;
            }
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(ManagerBase.class.getName()).log(Level.SEVERE, null, ex);

        }
        return false;
    }
}