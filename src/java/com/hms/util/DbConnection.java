
package com.hms.util;
import java.sql.*;

public class DbConnection {
    
    public static Connection getConnection()
    {
        Connection con = null;
        
        try{
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Reads from environment variables when present (used on the live server).
            // Falls back to your local XAMPP/MySQL settings when running from NetBeans.
            String url      = System.getenv("DB_URL")      != null ? System.getenv("DB_URL")      : "jdbc:mysql://localhost:3306/hospitaldb";
            String username = System.getenv("DB_USER")     != null ? System.getenv("DB_USER")     : "root";
            String password = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "root";

            con = DriverManager.getConnection(url, username, password);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
