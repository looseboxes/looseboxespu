package com.looseboxes.pu.query;

import com.bc.jpa.context.JpaContext;
import com.bc.jpa.context.JpaContextImpl;
import com.bc.jpa.dao.sql.MySQLDateTimePatterns;
import com.looseboxes.pu.entities.Product;
import java.net.URI;
import java.nio.file.Paths;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import com.bc.jpa.dao.Select;

/**
 *
 * @author Josh
 */
public class SelectProductTest {
    
    public SelectProductTest() { }
    
    @BeforeClass
    public static void setUpClass() { }
    
    @AfterClass
    public static void tearDownClass() { }
    
    @Before
    public void setUp() { }
    
    @After
    public void tearDown() { }

    @Test
    public void testAll() { 
        
        URI uri = Paths.get(System.getProperty("user.home"), "/Documents/NetBeansProjects/looseboxespu/src/test/resources/META-INF/persistence.xml").toUri();
        
        JpaContext jpaContext = new JpaContextImpl(uri, new MySQLDateTimePatterns(), com.looseboxes.pu.References.ENUM_TYPES);
        
        Select<Product> qb = new SelectProduct(jpaContext);
        
        List<Product> products = qb.getResultsAndClose(0, 10);
        
        this.listProducts(products);
        
//        try(BaseSearchResults<Product> sr = new BaseSearchResults(qb)) {
            
            
//            for(int i=0; i<sr.getPageCount(); i++) {
                
//                this.listProducts(sr.getPage(i));
//            }
//        }
    }
    
    private void listProducts(List<Product> products) {
        
        for(Product product : products) {

System.out.println("Product. ID: "+product.getProductid()+
        ", availability: "+product.getAvailabilityid().getAvailability()+
        ", name: "+product.getProductName());                    
        }
   }
}
