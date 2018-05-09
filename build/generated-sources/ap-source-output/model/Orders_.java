package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.OrderDetails;
import model.Users;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-12-23T15:07:59")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, String> date;
    public static volatile SingularAttribute<Orders, String> address;
    public static volatile SingularAttribute<Orders, String> phone;
    public static volatile CollectionAttribute<Orders, OrderDetails> orderDetailsCollection;
    public static volatile SingularAttribute<Orders, Integer> totalMoney;
    public static volatile SingularAttribute<Orders, Integer> id;
    public static volatile SingularAttribute<Orders, Users> userId;
    public static volatile SingularAttribute<Orders, String> status;

}