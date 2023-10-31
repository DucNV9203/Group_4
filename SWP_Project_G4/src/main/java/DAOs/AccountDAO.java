/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Database.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class AccountDAO {
    private Connection conn = null;
    static PreparedStatement statement;

    public AccountDAO() throws Exception {
        conn = DBConnection.Connect();
    }

    public boolean isUserExist(String username) {
        boolean ok = false;
        try {
            statement = conn.prepareStatement("select username from Account where username = ?");
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                if (resultSet.getString("username").equals(username)) {
                    ok = true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ok;
    }
    public boolean isEmailExist(String email) {
        boolean ok = false;
        try {
            statement = conn.prepareStatement("select email from Account where email = ?");
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            
            if(resultSet.next()) {
                if(resultSet.getString("email").equals(email)) {
                    ok = true;
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ok;
    }

    public int checkUserExit(String username, String password) {
        int status = -1;
        try {
            statement = conn.prepareStatement("select [password] from [Account] where username = ?");
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            // not exist
            if (!resultSet.next()) {
                status = 1;
                // System.out.println("Do not exist username");
            } else {
                String pw = resultSet.getString("password");

                if (pw.equals(password)) {
                    // correct
                    status = 0;
                    // System.out.println("Login success");
                } else {
                    // not correct password
                    status = 2;
                    System.out.println("Username or password is incorrect");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        // return resutl
        return status;
    }
    public int checkAdminExist(String username, String password) {
        int status = -1;
        try {
            statement = conn.prepareStatement("select password from [Admin] where username = ?");
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            
            //not exist
            if(!resultSet.next()) {
                status = 1;
            } else {
                String pw = resultSet.getString("password");
                
                if(pw.equals(password)) {
                    //correct
                    status = 0;
                } else {
                    //incorrect pass
                    status = 2;
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public void signUp(String avatar,
            String username,
            String password,
            String email,
            String firstName,
            String lastName,
            String gender,
            Date birthday,
            int role) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            statement = conn.prepareStatement("INSERT INTO Account VALUES (?,?,?,?,?,?,?,?,?)");

            statement.setString(1, avatar);
            statement.setString(2, username);
            statement.setString(3, Service.MD5.getMd5(password));
            statement.setString(4, email);
            statement.setString(5, firstName);
            statement.setString(6, lastName);
            statement.setString(7, gender);
            statement.setString(8, dateFormat.format(birthday));
            statement.setInt(9, role);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) throws Exception {
        AccountDAO acc = new AccountDAO();
        boolean check = acc.isEmailExist("ducnv9203@gmail.com");
        if (check) {
            System.out.println("True");
        } else {
            System.out.println("False");
        }
    }
}
