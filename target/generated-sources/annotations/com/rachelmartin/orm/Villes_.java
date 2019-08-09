package com.rachelmartin.orm;

import com.rachelmartin.orm.Personne;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-08-09T13:39:31")
@StaticMetamodel(Villes.class)
public class Villes_ { 

    public static volatile CollectionAttribute<Villes, Personne> personneCollection;
    public static volatile SingularAttribute<Villes, Integer> codepostal;
    public static volatile SingularAttribute<Villes, Integer> id;
    public static volatile SingularAttribute<Villes, String> nom;

}