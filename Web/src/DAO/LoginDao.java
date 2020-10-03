package DAO;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Pack.LoginBean;
//Login Data Access Object - provides an abstract interface to the database. 
//Here are the Queries regarding login, update and create user.
public class LoginDao {
	//DB parameters - need to be changed if used from some other user
	String DBURL = "jdbc:mysql://localhost:3306/test?useSSL=false"; //MYSQL url
	String DBUsername = "root"; //Database Username
	String DBPassword = ""; //Database Password
	
	//returns true id there is a user with this username and password.
    public boolean login(LoginBean loginBean) throws ClassNotFoundException {
    	//setting boolean false/
        boolean status = false;
        //jdbc driver
        Class.forName("com.mysql.jdbc.Driver");
        //making the connection with DB
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            //Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement("select * from login where username = ? and password = ? ")) {
            //giving the parameters to query, with help from loginbean functions based on db user.
        	preparedStatement.setString(1, loginBean.getUsername());
            preparedStatement.setString(2, loginBean.getPassword());
            //debugging
            //System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            //debugging
            //System.out.println("just finished with login request");
            //status true if there is one such user
            status = rs.next();
            if(status) {System.out.println("found him");}
        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }
    
    
    //Deletes all data from table Items.
    public boolean DeleteItems() throws ClassNotFoundException {
		boolean status = false;
		Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("DELETE FROM items;")) {

			System.out.println(preparedStatement);
			status = preparedStatement.executeUpdate() !=0;
			System.out.println(status);
		} catch (SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
			printSQLException(e);
		}
		return status;
	}
    
    
    //When a new user logs in, we delete all data from table cart with this function. 
    //Returns true if it's working.
    public boolean DeleteCart() throws ClassNotFoundException {
		boolean status = false;
		Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("DELETE FROM cart;")) {

			System.out.println(preparedStatement);
			status = preparedStatement.executeUpdate() !=0;
			System.out.println(status);
		} catch (SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
			printSQLException(e);
		}
		return status;
	}
    
   
    //Creates a new user in table users based on data we got from the user. 
    public int insertUser(Pack.User user) throws ClassNotFoundException {
    	Class.forName("com.mysql.jdbc.Driver");
    	int result = 0;
    	System.out.println(result);
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("INSERT INTO login (username, name, birthdate, password) VALUES  (?, ?, ?, ?);")) {
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getName());
			preparedStatement.setString(3, user.getBirthdate());
			preparedStatement.setString(4, user.getPassword());
			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
			System.out.println("Insert executed");
		} catch (SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
		} 
        System.out.print(result);
        return result;
	}
    
    
    //Returns YES if a user already exists in our DB.
    public boolean UserExists(String username) throws ClassNotFoundException {
		boolean status = false;
		Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select * from login where username = ?")) {
        	preparedStatement.setString(1, username);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
		} catch (SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
			printSQLException(e);
		}
		return status;
	}
    
    //Updates data for an already existing user, based on his username. Returns true if he's updated.
    public boolean updateUser(String name, String birthdate, String username) throws ClassNotFoundException {
		boolean status = false;
		Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE login SET name = ?, birthdate = ? WHERE username = ?;")) {
        	preparedStatement.setString(1, name);
        	preparedStatement.setString(2, birthdate);
        	preparedStatement.setString(3, username);
			status = preparedStatement.executeUpdate() != 0;
			
		}catch(SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
			printSQLException(e);
		}
		return status;
	}

    
    //void for exceptions
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

