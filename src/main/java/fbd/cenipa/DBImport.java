package fbd.cenipa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

class DBImport {

    public DBImport() {
    }

    public Connection connect(String db_connect_str,
                              String db_userid, String db_password) {
        Connection conn;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            conn = DriverManager.getConnection(db_connect_str,
                    db_userid, db_password);

        } catch (Exception e) {
            e.printStackTrace();
            conn = null;
        }

        return conn;
    }

    public void importData(Connection conn, String filename) {
        Statement stmt;
        String query;

        List<String> arquivos = new ArrayList<String>();

        arquivos.add("/origem/aeronave.csv");
        arquivos.add("/origem/fator_contribuinte.csv");
        arquivos.add("/origem/ocorrencia_tipo.csv");
        arquivos.add("/origem/recomendacao.csv'");
        arquivos.add("/origem/ocorrencia.csv'");

        List<String> tabelas = new ArrayList<String>();

        tabelas.add("aeronave");
        tabelas.add("fator_contribuinte'");
        tabelas.add("ocorrencia_tipo'");
        tabelas.add("recomendacao'");
        tabelas.add("ocorrencia'");

        try {
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);

            for (int i = 0; i <= 4; i++) {
                System.out.println("Importando dados para a tabela " + tabelas.get(i) + "...");

                query = "LOAD DATA INFILE '" + arquivos.get(i) +
                        "' INTO TABLE '" + tabelas.get(i) + "'(text,price);";
                stmt.executeUpdate(query);

                System.out.println("Importação realizada com sucesso!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            stmt = null;
        }
    }

}
