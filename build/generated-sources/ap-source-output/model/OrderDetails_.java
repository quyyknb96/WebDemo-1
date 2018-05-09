package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Orders;
import model.Products;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-12-23T15:07:59")
@StaticMetamodel(OrderDetails.class)
public class OrderDetails_ { 

    public static volatile SingularAttribute<OrderDetails, Integer> quantity;
    public static volatile SingularAttribute<OrderDetails, Products> productId;
    public static volatile SingularAttribute<OrderDetails, Orders> orderId;
    public static volatile SingularAttribute<OrderDetails, Integer> id;

}