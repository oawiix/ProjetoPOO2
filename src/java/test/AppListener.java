
package test;

import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.*;

@WebListener
public class AppListener implements ServletContextListener {
    public static final String CLASS_NAME = "com.mysql.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/zteste"
    + "?user=root&password=";
    public static String initializeLog = "";
    public static Exception exception = null;

    
    public static Connection getConnection() throws Exception {
        Class.forName(CLASS_NAME);
        return DriverManager.getConnection(URL);
    }
}
