package DAO;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Pack.Cart;

//Order Data Access Object - provides an abstract interface to the database. Here are the Queries.
public class OrderDao {
	
	//DB parameters - need to be changed if used from some other user
	String DBURL = "jdbc:mysql://localhost:3306/test?useSSL=false"; //MYSQL url
	String DBUsername = "root"; //Database Username
	String DBPassword = ""; //Database Password

	//Returns true if the cart has a product with this product_id inside.
	public boolean ProductExists(int product_id) throws ClassNotFoundException {
		//setting boolean false/
		boolean status = false;
		//jdbc driver
		Class.forName("com.mysql.jdbc.Driver");
		//making the connection with DB
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            //Create a statement using connection object
            PreparedStatement preparedStatement = connection
            //Query with Parameters
            .prepareStatement("select * FROM cart WHERE product_id = ?")) {
			preparedStatement.setInt(1, product_id);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			//Just for debugging:
			//System.out.println("Finished query");
			//status TRUE is there is at least one such product in the cart 
			status = rs.next();
			System.out.println(status);
		} catch (SQLException e) {
			//If something is wrong with the query
			System.out.println("An SQL error occured: " + e.getMessage());
			printSQLException(e);
		}
		return status;
	}
	
	//returns the price of a product with a certain given id
	public double selectPrice(int product_id) throws ClassNotFoundException {
	    double newprice = 0;
	    Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            PreparedStatement preparedStatement = connection.prepareStatement("select * FROM products WHERE id = ?")) {
        		preparedStatement.setInt(1, product_id);
        		System.out.println(preparedStatement);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()) {
					newprice = rs.getDouble("price");
				}
			} catch (SQLException e) {
				printSQLException(e);
			}
	    return newprice;
	}		
			
	//Updates the quantity of a product in the cart. 
	//It adds one to quantity and its price to the total price of this product in the cart.
	//Returns true if it's successfull.
	public boolean updateCart(int product_id, double price) throws ClassNotFoundException {
		boolean updated = false;
		Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE cart SET quantity = quantity + 1 WHERE product_id = ?;")) {
        	preparedStatement.setInt(1, product_id);
			updated = preparedStatement.executeUpdate() != 0;
		}catch(SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
			printSQLException(e);
		}
        try (Connection connection = DriverManager
                .getConnection(DBURL, DBUsername, DBPassword);
                PreparedStatement preparedStatement = connection.prepareStatement("UPDATE cart SET total_price = total_price + ? WHERE product_id = ?;")) {
            	preparedStatement.setDouble(1, price);
            	preparedStatement.setInt(2, product_id);
    			updated = preparedStatement.executeUpdate() != 0;
    		}catch(SQLException e) {
    			System.out.println("An SQL error occured: " + e.getMessage());
    			printSQLException(e);
    		}
		return updated;
	}	
	
	//Returns true if it successfully adds a product to cart, that wasn't there yet.
	public boolean insertProduct(Pack.Cart cart) throws ClassNotFoundException {
    	Class.forName("com.mysql.jdbc.Driver");
    	boolean result = false;
    	System.out.println(result);
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("INSERT INTO cart (product_id, quantity, total_price) VALUES  (?, ?, ?);")) {
			preparedStatement.setInt(1, cart.getProduct_id());
			preparedStatement.setInt(2, cart.getQuantity());
			preparedStatement.setDouble(3, cart.getTotal_price());
			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate() !=0;
			System.out.println("Insert executed");
		} catch (SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
		} 
        System.out.print(result);
        return result;
	}
	
	
	//Returns true if it successfully adds an item to items.
	public boolean insertItem(Pack.Item item) throws ClassNotFoundException {
    	Class.forName("com.mysql.jdbc.Driver");
    	boolean result = false;
    	System.out.println(result);
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("INSERT INTO items (order_id, product_id, quantity, total_price) VALUES  (?, ?, ?, ?);")) {
        	preparedStatement.setInt(1, item.getOrder_id());
        	preparedStatement.setInt(2, item.getProduct_id());
			preparedStatement.setInt(3, item.getQuantity());
			preparedStatement.setDouble(4, item.getTotal_price());
			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate() !=0;
			System.out.println("Insert executed");
		} catch (SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
		} 
        System.out.print(result);
        return result;
	}
	
	
	//Creates a new order in database and returns the autogenerated order_id
	public int insertOrder(String username, double total_price) throws ClassNotFoundException {
    	Class.forName("com.mysql.jdbc.Driver");
    	int result = 0;
    	System.out.println(result);
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            // Step 2:Create a statement using connection object
        	PreparedStatement preparedStatement = connection
        	.prepareStatement("INSERT INTO `order` (username, total_price) VALUES  (?, ?);", Statement.RETURN_GENERATED_KEYS)) {
			preparedStatement.setString(1, username);
			preparedStatement.setDouble(2, total_price);
			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();
			System.out.println("Insert executed");
			ResultSet rs = preparedStatement.getGeneratedKeys();
			if(!rs.next()) {
				System.out.println("Result set is empty");
				return 0;
			}
			result = rs.getInt(1);
			System.out.print(result);
		} catch (SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
		} 
        System.out.print(result);
        return result;
	}

	
	//Returns true if the cart is not empty.
	public boolean CartNotEmpty() throws ClassNotFoundException {
		boolean status = false;
		Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection(DBURL, DBUsername, DBPassword);
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select * FROM cart")) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			System.out.println("Finished cartexists query");
			status = rs.next();
			System.out.println(status);
		} catch (SQLException e) {
			System.out.println("An SQL error occured: " + e.getMessage());
			printSQLException(e);
		}
		return status;
	}
	
	
	
	//void for esceptions.
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