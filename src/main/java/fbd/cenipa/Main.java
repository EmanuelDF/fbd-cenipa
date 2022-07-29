package fbd.cenipa;

import java.sql.Connection;

public class Main {

    public static void main(String[] args) {
        DBImport db = new DBImport();
        Connection conn =
                db.connect("jdbc:mysql://localhost:3306/cenipa", "root", "mysql");
        db.importData(conn, args[0]);
    }

}
