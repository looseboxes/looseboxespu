package com.looseboxes.pu;

import com.bc.jpa.context.JpaContextImpl;
import com.bc.jpa.util.PersistenceURISelector;
import com.bc.jpa.dao.sql.MySQLDateTimePatterns;
import com.bc.jpa.dao.sql.SQLDateTimePatterns;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.Properties;

/**
 * @(#)IdiscControllerFactory.java   22-Aug-2014 14:14:23
 *
 * Copyright 2011 NUROX Ltd, Inc. All rights reserved.
 * NUROX Ltd PROPRIETARY/CONFIDENTIAL. Use is subject to license 
 * terms found at http://www.looseboxes.com/legal/licenses/software.html
 */
/**
 * @author   chinomso bassey ikwuagwu
 * @version  2.0
 * @since    2.0
 */
public class LbJpaContext extends JpaContextImpl {

    private static class PersistenceUriFilter implements PersistenceURISelector.URIFilter {
        @Override
        public boolean accept(URI uri) {
            return uri.toString().contains("looseboxes");
        }
    }

    public LbJpaContext() throws IOException {
        this(new MySQLDateTimePatterns());
    }

    public LbJpaContext(SQLDateTimePatterns dateTimePatterns) throws IOException {
        this("META-INF/persistence.xml", dateTimePatterns);
    }
    
    public LbJpaContext(String persistenceFile, SQLDateTimePatterns dateTimePatterns) throws IOException {
        super(persistenceFile, new PersistenceUriFilter(), dateTimePatterns, References.ENUM_TYPES);
    }
    
//    public LbJpaContext(String persistenceFile, PersistenceURISelector.URIFilter uriFilter, SQLDateTimePatterns dateTimePatterns, ParametersFormatter paramFmt) throws IOException {
//        super(persistenceFile, uriFilter, dateTimePatterns, paramFmt, References.ENUM_TYPES);
//    }

    public LbJpaContext(URI persistenceFile) {
        super(persistenceFile, References.ENUM_TYPES);
    }

    public LbJpaContext(URI persistenceFile, SQLDateTimePatterns dateTimePatterns) throws IOException {
        super(persistenceFile, dateTimePatterns, References.ENUM_TYPES);
    }

    public LbJpaContext(File persistenceFile, SQLDateTimePatterns dateTimePatterns) throws IOException {
        super(persistenceFile, dateTimePatterns, References.ENUM_TYPES);
    }

    @Override
    public Properties getPersistenceUnitProperties(String persistenceUnit) {
        InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("looseboxespu.env");
        if(in != null) {
            try{
                Properties p = new Properties();
                p.load(in);
                return p;
            }catch(IOException e){
                throw new RuntimeException(e.getMessage(), e);
            }finally{
                try{
                    in.close();
                }catch(IOException e) { e.printStackTrace(); }
            }
        }
        return super.getPersistenceUnitProperties(persistenceUnit);
    }
}
