package fbd.cenipa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {

    public static void main(String[] args) {
        DBImport db = new DBImport();
        try {
            Connection conn = DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/test", "root", "mysql");
            db.importData(conn);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
