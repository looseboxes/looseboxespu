package com.looseboxes.pu.query;

import com.bc.jpa.context.PersistenceUnitContext;
import com.bc.jpa.dao.util.DatabaseFormat;
import com.bc.jpa.dao.SelectImpl;
import com.looseboxes.pu.entities.Product;
import com.looseboxes.pu.entities.Product_;
import com.looseboxes.pu.entities.Productvariant;
import com.looseboxes.pu.entities.Productvariant_;
import javax.persistence.EntityManager;

/**
 * @author Josh
 */
public class SelectProduct<T> extends SelectImpl<T> {

    public SelectProduct(PersistenceUnitContext jpaContext) {
        this(null, jpaContext.getEntityManager(), 
                Product.class, jpaContext.getDatabaseFormat());
    }
    
    public SelectProduct(String query, PersistenceUnitContext jpaContext, Class<T> resultType) {
        this(query, jpaContext.getEntityManager(), 
                resultType, jpaContext.getDatabaseFormat());
    }

    public SelectProduct(EntityManager em, DatabaseFormat databaseFormat) {
        this(null, em, Product.class, databaseFormat);
    }
    
    public SelectProduct(String query, EntityManager em, Class resultType, DatabaseFormat databaseFormat) {
        super(em, resultType, databaseFormat);
        SelectProduct.this.format(query);
    }
    
    protected void format(String query) {

        this.distinct(true);
        
        this.join(Product.class, Product_.productvariantList.getName(), Productvariant.class);

        if(query != null) {
            
            this.search(
                    Product.class, query,
                    Product_.productName.getName(),
                    Product_.keywords.getName(),
                    Product_.model.getName(),
                    Product_.description.getName()
            );
            this.search(
                Productvariant.class, query,
                Productvariant_.color.getName(),
                Productvariant_.productSize.getName(),
                Productvariant_.weight.getName()
            );
        }
        
        this.ascOrder(Product.class, Product_.availabilityid.getName());
        this.descOrder(Product.class, Product_.ratingPercent.getName());
        this.ascOrder(Product.class, Product_.price.getName());
// 'views' is misleading... a recently uploaded item may not have much views 
// compared with an earlier uploaded item        
//        this.descOrder(Product.class, Product_.views.getName());
// 'productid' is implicit at this point
//        this.descOrder(Product.class, Product_.productid.getName());
    }
}
