package fbd.cenipa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        DBImport db = new DBImport();
        Connection conn =
                db.connect("jdbc:mysql://192.168.0.2:3306/cenipa", "root", "mysql");
        db.importData(conn, args[0]);
    }

}
