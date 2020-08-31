package com.looseboxes.pu;

import com.bc.jpa.fk.EnumReferences;
import com.looseboxes.pu.entities.Product;
import com.looseboxes.pu.entities.Product_;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import java.net.URI;
import java.net.URISyntaxException;
import com.bc.jpa.metadata.JpaMetaData;

/**
 * @author Josh
 */
public class ReferencesTest {
    
    public ReferencesTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * General tests 
     * @throws java.net.URISyntaxException
     * @throws java.io.IOException
     */
    @Test
    public void testAll() throws URISyntaxException, IOException {
        
//        URI uri = new URI("file:/C:/Users/Josh/Documents/NetBeansProjects/looseboxespu/src/test/resources/META-INF/persistence.xml");
        final URI uri = Thread.currentThread().getContextClassLoader().getResource("META-INF/persistence.xml").toURI();
        final LbJpaContext jpaContext = new LbJpaContext(uri);

        JpaMetaData metaData = jpaContext.getMetaData();
        Class [] refingClasses = metaData.getReferencingClasses(Product.class);
System.out.println(this.getClass().getName()+". Referencing classes: "+Arrays.toString(refingClasses));

        Map<Class, String> refingMappings = metaData.getReferencing(Product.class);
System.out.println(this.getClass().getName()+". Referencing mappings: "+refingMappings);

        EnumReferences refs = jpaContext.getEnumReferences();

        String column = Product_.productcategoryid.getName();

        Class enumType = refs.getEnumType(column);

        Object entity = refs.getEntity(column, References.productcategory.Fashion);

        Enum en = refs.getEnum(column, "1");

System.out.println(this.getClass().getName()+". Enum: "+en+", Entity: "+entity+", Enum type: "+enumType);

        Class [] enumTypes = refs.getEnumTypes();
        for(Class aType:enumTypes) {
            try{
                printMappings(refs, aType);
            }catch(RuntimeException e) {
                System.err.println(e.toString());
            }
        }
    }

    private Map printMappings(EnumReferences refs, Class enumClass) {
        Map mappings = refs.getMappings(enumClass);
System.out.println(this.getClass().getName()+". Enum class: "+enumClass.getName()+", mappings: "+mappings);        
        return mappings;
    }
}
