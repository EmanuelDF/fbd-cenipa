package fbd.cenipa;

import org.apache.ibatis.jdbc.ScriptRunner;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBImport {

    public DBImport() {
    }

    public Connection connect(String db_connect_str,
                              String db_userid, String db_password) {
        Connection conn;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(db_connect_str,
                    db_userid, db_password);

        } catch (Exception e) {
            e.printStackTrace();
            conn = null;
        }

        return conn;
    }

    public void importData(Connection conn) {
        Statement stmt;
        String query;

        List<String> files = new ArrayList<String>();

        files.add(getClass().getResource("/files/aeronave.csv").getPath());
        files.add(getClass().getResource("/files/fator_contribuinte.csv").getPath());
        files.add(getClass().getResource("/files/ocorrencia_tipo.csv").getPath());
        files.add(getClass().getResource("/files/recomendacao.csv").getPath());
        files.add(getClass().getResource("/files/ocorrencia.csv").getPath());

        List<String> tables = new ArrayList<String>();

        tables.add("aeronave");
        tables.add("fator_contribuinte'");
        tables.add("ocorrencia_tipo'");
        tables.add("recomendacao'");
        tables.add("ocorrencia'");

        try {
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);

            runCreateScript(conn);

            for (int i = 0; i <= 4; i++) {
                System.out.println("Importing data into the table " + tables.get(i) + "...");

                query = "LOAD DATA INFILE '" + files.get(i) +
                        "' INTO TABLE " + tables.get(i) + ";";
                stmt.executeUpdate(query);

                System.out.println("Import performed successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            stmt = null;
        }
    }

    private void runCreateScript(Connection conn) throws FileNotFoundException {
        ScriptRunner sr = new ScriptRunner(conn);
        Reader reader = new BufferedReader(new FileReader(getClass().getResource("/create.sql").getPath()));
        sr.runScript(reader);
    }

}
