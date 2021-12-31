/*
 * Copyright (c) 2019, Zealnetworks Technologies. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * You are not meant to edit or modify this source code unless you are
 * authorized to do so.
 *
 * Please contact me at contact@zealtech.com.ng
 * or visit www.zealtech.com.ng if you need additional information or have any
 * questions.
 */
package database;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author Charles Archibong
 * @since Nov 5, 2019 12:34:21 AM
 */
public class DBConfiguration
{

    private Properties prop;

    private String driverName;

    private String dbUser;

    private String dbPass;

    private Properties loadRemoteDBProperties() throws IOException, IllegalArgumentException
    {
        try(InputStream dbPropInputStream = DBConfiguration.class.getResourceAsStream("Config.remote.properties");)
        {
            this.prop = new Properties();
            this.prop.load(dbPropInputStream);
            return this.prop;
        }
        catch(IOException | IllegalArgumentException xcp)
        {
            throw xcp;
        }
    }

    private Properties loadLocalDBProperties() throws IOException, IllegalArgumentException
    {
        try(InputStream dbPropInputStream = DBConfiguration.class.getResourceAsStream("Config.local.properties");)
        {
            this.prop = new Properties();
            this.prop.load(dbPropInputStream);
            return this.prop;
        }
        catch(IOException | IllegalArgumentException xcp)
        {
            throw xcp;
        }
    }

    public void loadDatabaseDriver() throws ClassNotFoundException, IOException, IllegalArgumentException
    {
        try
        {
            this.driverName = this.prop.getProperty("driverName");
            Class.forName(this.driverName);
        }
        catch(ClassNotFoundException | IllegalArgumentException xcp)
        {
            throw xcp;
        }
    }

    private Connection getConnection() throws ClassNotFoundException, IllegalArgumentException, IOException, SQLException
    {
        this.dbUser = this.prop.getProperty("db.user");
        this.dbPass = this.prop.getProperty("db.pass");
        this.loadDatabaseDriver();
        return DriverManager.getConnection(this.prop.getProperty("whens.url"), this.dbUser, this.dbPass);
    }

    public Connection getDatabaseConnection() throws SQLException, IOException, IllegalArgumentException, ClassNotFoundException
    {
        try
        {
            try
            {
                this.prop = loadRemoteDBProperties();
                return this.getConnection();
            }
            catch(SQLException xcp)
            {
                this.prop = loadLocalDBProperties();
                return this.getConnection();
            }
        }
        catch(SQLException | IOException | IllegalArgumentException xcp)
        {
            throw xcp;
        }
    }
}
