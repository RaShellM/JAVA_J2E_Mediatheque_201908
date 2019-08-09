package com.rachelmartin.orm;

import com.rachelmartin.orm.Villes;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-08-09T13:39:31")
@StaticMetamodel(Personne.class)
public class Personne_ { 

    public static volatile SingularAttribute<Personne, Villes> idville;
    public static volatile SingularAttribute<Personne, String> mdp;
    public static volatile SingularAttribute<Personne, String> sexe;
    public static volatile SingularAttribute<Personne, Integer> id;
    public static volatile SingularAttribute<Personne, String> nom;
    public static volatile SingularAttribute<Personne, Integer> age;
    public static volatile SingularAttribute<Personne, String> email;

}