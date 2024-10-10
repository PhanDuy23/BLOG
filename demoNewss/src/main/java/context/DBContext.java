/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author doanm
 */
public class DBContext {
    public Connection getConnection() throws Exception{
        String url = "jdbc:mysql://"+ serverName+":"+portNumber+"/"+dbName;
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url,username,password);
    }
    private final String serverName = "localhost";
    private final String dbName = "news";
    private final String portNumber = "3306";
    //LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final String username = "user";
    private final String password = "1234";
    public static void main(String[] args) {
        try{
            System.out.println(new DBContext().getConnection());
        }catch(Exception e){
        }
    }
}
