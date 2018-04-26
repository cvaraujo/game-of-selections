package Dao;

import java.sql.DriverManager;

public class ConnectionFactory {

    private java.sql.Connection con;

    public java.sql.Connection getConnection() {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GameOfSelections", "root", "Victor07021997!");
            return con;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
