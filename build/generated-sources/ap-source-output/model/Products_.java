package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Category;
import model.OrderDetails;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-12-23T15:07:59")
@StaticMetamodel(Products.class)
public class Products_ { 

    public static volatile SingularAttribute<Products, String> image;
    public static volatile SingularAttribute<Products, String> author;
    public static volatile SingularAttribute<Products, Integer> price;
    public static volatile CollectionAttribute<Products, OrderDetails> orderDetailsCollection;
    public static volatile SingularAttribute<Products, String> publishingYear;
    public static volatile SingularAttribute<Products, String> name;
    public static volatile SingularAttribute<Products, String> publisher;
    public static volatile SingularAttribute<Products, String> description;
    public static volatile SingularAttribute<Products, Integer> id;
    public static volatile SingularAttribute<Products, Category> categoryId;
    public static volatile SingularAttribute<Products, String> status;

}