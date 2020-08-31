package com.looseboxes.pu.query;

import com.bc.jpa.dao.util.DatabaseFormat;
import com.bc.jpa.context.PersistenceUnitContext;
import com.looseboxes.pu.References;
import com.looseboxes.pu.entities.Product;
import com.looseboxes.pu.entities.Product_;
import java.util.Collections;
import java.util.Objects;
import javax.persistence.EntityManager;

/**
 * @author Josh
 */
public class SelectProductByAvailability extends SelectProduct {
    
    private final References.availability availability;

    public SelectProductByAvailability(
            References.availability availability, PersistenceUnitContext jpaContext) {
        super(jpaContext);
        this.availability = this.requireNonNull(availability);
    }

    public SelectProductByAvailability(
            References.availability availability, String query, 
            PersistenceUnitContext jpaContext, Class resultType) {
        super(query, jpaContext, resultType);
        this.availability = this.requireNonNull(availability);
    }

    public SelectProductByAvailability(
            References.availability availability, 
            EntityManager em, DatabaseFormat databaseFormat) {
        super(em, databaseFormat);
        this.availability = this.requireNonNull(availability);
    }

    public SelectProductByAvailability(
            References.availability availability, String query, 
            EntityManager em, Class resultType, DatabaseFormat databaseFormat) {
        super(query, em, resultType, databaseFormat);
        this.availability = this.requireNonNull(availability);
    }
    
    private References.availability requireNonNull(References.availability availability) {
        return Objects.requireNonNull(availability, "Availability cannot be null");
    }

    @Override
    protected void format(String query) {
        this.where(
                Product.class, 
                Collections.singletonMap(Product_.availabilityid.getName(), availability));        
    }
}
