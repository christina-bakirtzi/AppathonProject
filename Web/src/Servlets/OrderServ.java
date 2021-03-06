package Servlets;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Statement;

import java.io.FileWriter;
import java.io.IOException;
import DAO.OrderDao;
import Pack.User;
import Pack.Cart;
import Pack.Item;

import static javax.swing.JOptionPane.showMessageDialog;

//Servlet File for when we click "save order"
@WebServlet("/order") 
public class OrderServ extends HttpServlet{
	private static final long serialVersionUID = 1L;
	//Database variables
	String DBURL = "jdbc:mysql://localhost:3306/test?useSSL=false"; //MYSQL url
	String DBUsername = "root"; //Database Username
	String DBPassword = ""; //Database Password
	private User user;
	private OrderDao orderDao;
	
	public void init() {
        orderDao = new OrderDao();
    }
    public OrderServ() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException 
	{
		
		HttpSession session = request.getSession();
		if(session.getAttribute("username")==null) {
			//if the username is null, then the session is over and the user needs to be re-logged in.
			showMessageDialog(null, "Username cannot be null");
			// Redirected to login.jsp.
			response.sendRedirect("login.jsp");
		} else {
			try {
				//We can't save an order with empty cart. Check it the cart is empty(SQL QUERY FROM OrderDao - DAO Pack)
				if(! orderDao.CartNotEmpty()) {
					showMessageDialog(null, "Cart shouldn't be empty! Make your orders!");
					//Redirected to the products page.
					response.sendRedirect("products.jsp");}
				else {	
					//Get the parameters
					String username = (String) session.getAttribute("username");
					System.out.println(request.getParameter("mySelect"));
					if(request.getParameter("mySelect") == null) {
						//If the user hasn't selected a country, notify & refresh
						showMessageDialog(null, "Please select country");
						response.sendRedirect("basket.jsp");
					}
					else {
						
					double total_price = Double.parseDouble(request.getParameter("mySelect"));
					int order_id = 0;
					try {
						//order_id is AutoIncrement.
						//Insert a new order to your database, giving the username and the total_price. order_id will be autogenerated.
						order_id = orderDao.insertOrder(username, total_price);
						} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}
					Connection connection = null;
					java.sql.Statement statement = null;
					ResultSet rs = null;
					Class.forName("com.mysql.jdbc.Driver");
					//Make a list of Items, linked to the Order.
					List<Item> items = new ArrayList<Item>();
					connection = DriverManager.getConnection(DBURL, "root", "");
					statement = connection.createStatement();
					//Select everything that there is in the cart.
					rs = statement.executeQuery("SELECT * FROM cart");
					//Until cart is empty, make a list with items(order_id, product_id, quantity and total_price as attributes).
					while (rs.next()) {
						Item item = new Item();
						item.setOrder_id(order_id);
						item.setProduct_id(rs.getInt("product_id"));
						item.setQuantity(rs.getInt("quantity"));
						item.setTotal_price(rs.getDouble("total_price"));
						items.add(item);
						try {
							//Insert every new item to the database, with SQL QUERY from OrderDao.java
							orderDao.insertItem(item);
						} catch (ClassNotFoundException e) {
							e.printStackTrace();
						}
						
				}
					rs.close();
					//Create the file
						try (FileWriter out = new FileWriter("D:/" + username + "_" + order_id + ".txt")) {
								out.write(String.format("-  %s 's ORDER - \n",username));
								out.write("Ordered Items:\n");
								//write every item that there is on the order, with its quantity, product_id & total price.
								for (int i = 0; i < items.size(); i++) {
						            out.write(items.get(i).getQuantity() + " pieces of product with id " + items.get(i).getProduct_id() + " .Total cost "+ items.get(i).getTotal_price()+" (EUR). \n" );
						        }
								out.write("Total cost: " + total_price + "(EUR)");
							} catch (IOException e) {
							e.printStackTrace();
							}
						//order has been saved, and we can go back to homepage.
						showMessageDialog(null, "Your order has been saved.");
						response.sendRedirect("register.jsp");
				} }}catch (ClassNotFoundException e) {
					e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}}
}

