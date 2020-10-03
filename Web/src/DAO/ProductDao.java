package DAO;

//Didn't exactly use this after all.
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Pack.Product;
public class ProductDao {
	String DBURL = "jdbc:mysql://localhost:3306/test?useSSL=false"; //MYSQL url
	String DBUsername = "root"; //Database Username
	String DBPassword = ""; //Database Password
	
	public List<Product> findAll() throws ClassNotFoundException {
	    List<Product> products = new ArrayList<Product>();
	    try (Connection connection = DriverManager.getConnection(DBURL, DBUsername, DBPassword);
	    		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products")) {
				//TODO: delete println statements
	    		System.out.println(preparedStatement);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()) {
					Product product = new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setImage(rs.getString("image"));
					product.setPrice(rs.getDouble("price"));
					products.add(product);
				}
			} catch (SQLException e) {
				printSQLException(e);
			}
	    return products;
	}
	
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
