package com.looseboxes.pu;

import com.bc.jpa.context.JpaContext;
import com.bc.jpa.context.JpaContextImpl;
import com.bc.jpa.dao.search.BaseSearchResults;
import com.bc.jpa.dao.sql.MySQLDateTimePatterns;
import com.looseboxes.pu.entities.Product;
import com.looseboxes.pu.query.SelectProduct;
import java.net.URI;
import java.nio.file.Paths;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import com.bc.jpa.dao.Select;

/**
 * @author Chinomso Bassey Ikwuagwu on Jul 26, 2016 8:50:14 PM
 */
public class SearchResultsSizeTest {

    @BeforeClass
    public static void setUpClass() { }
    
    @AfterClass
    public static void tearDownClass() { }
    
    @Before
    public void setUp() { }
    
    @After
    public void tearDown() { }

    @org.junit.Test
    public void testAll() {
        
        URI uri = Paths.get(System.getProperty("user.home"), "/Documents/NetBeansProjects/looseboxespu/src/test/resources/META-INF/persistence.xml").toUri();
        
        JpaContext jpaContext = new JpaContextImpl(uri, new MySQLDateTimePatterns(), com.looseboxes.pu.References.ENUM_TYPES);
        
        Select<Product> qb = new SelectProduct("1 year", jpaContext, Product.class);
        
        try(BaseSearchResults<Product> sr = new BaseSearchResults(qb)) {
            
            List<Product> page = sr.getPage(0); 
System.out.println("=======================Page: 0, size: "+page.size());             
System.out.println("=======================Size: "+sr.getSize()); 
            
        }
    }
    
}
