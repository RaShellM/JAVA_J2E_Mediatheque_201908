/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.authentification;

import com.rachelmartin.basedonnée.ManagerBase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrateur
 */
public class NouveauLecteur {
    
    public static Boolean ajoutLecteur(String nomNew, String mdpNew) {
        Connection c = ManagerBase.getManagerBase().getConnection();
        try {
            Statement stmt = c.createStatement();
            PreparedStatement preparedStatement = c.prepareStatement("INSERT INTO personne (nom, mdp)"
            +"VALUES(?,?)");
            //entrez tout le code pour implementer la base
            preparedStatement.setString(1, nomNew);
            preparedStatement.setString(2, mdpNew);
            preparedStatement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ManagerBase.class.getName()).log(Level.SEVERE, null, ex);

        }
        return false;
    }
    
}
