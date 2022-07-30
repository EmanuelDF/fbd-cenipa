package fbd.cenipa;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

class DBImportTest {

    private DBImport dbImportUnderTest;

    @BeforeEach
    void setUp() {
        dbImportUnderTest = new DBImport();
    }

    @Test
    void testConnect() throws ClassNotFoundException, SQLException {
        // Setup
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Run the test
        Connection con = DriverManager.getConnection
                ("jdbc:mysql://localhost:3306/test", "root", "mysql");

        // Verify the results
        Assertions.assertNotNull(con);

        // Close JDBC connection
        con.close();
    }

    @Test
    void testImportData() {
        // Setup
        final Connection conn = null;

        // Run the test
        dbImportUnderTest.importData(conn, "filename");

        // Verify the results
    }
}
