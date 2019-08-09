/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rachelmartin.orm;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Administrateur
 */
@Entity
@Table(name = "villes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Villes.findAll", query = "SELECT v FROM Villes v"),
    @NamedQuery(name = "Villes.findById", query = "SELECT v FROM Villes v WHERE v.id = :id"),
    @NamedQuery(name = "Villes.findByNom", query = "SELECT v FROM Villes v WHERE v.nom = :nom"),
    @NamedQuery(name = "Villes.findByCodepostal", query = "SELECT v FROM Villes v WHERE v.codepostal = :codepostal")})
public class Villes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 20)
    @Column(name = "nom")
    private String nom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "codepostal")
    private int codepostal;
    @OneToMany(mappedBy = "idville")
    private Collection<Personne> personneCollection;

    public Villes() {
    }

    public Villes(Integer id) {
        this.id = id;
    }

    public Villes(Integer id, int codepostal) {
        this.id = id;
        this.codepostal = codepostal;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getCodepostal() {
        return codepostal;
    }

    public void setCodepostal(int codepostal) {
        this.codepostal = codepostal;
    }

    @XmlTransient
    public Collection<Personne> getPersonneCollection() {
        return personneCollection;
    }

    public void setPersonneCollection(Collection<Personne> personneCollection) {
        this.personneCollection = personneCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Villes)) {
            return false;
        }
        Villes other = (Villes) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.rachelmartin.orm.Villes[ id=" + id + " ]";
    }
    
}
