package fbd.cenipa;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.Connection;

class DBImportTest {

    private DBImport dbImportUnderTest;

    @BeforeEach
    void setUp() {
        dbImportUnderTest = new DBImport();
    }

    @Test
    void testConnect() {
        // Setup
        // Run the test
        final Connection result = dbImportUnderTest.connect("db_connect_str", "db_userid", "db_password");

        // Verify the results
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
