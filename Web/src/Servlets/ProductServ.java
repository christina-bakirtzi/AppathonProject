package Servlets;

import static javax.swing.JOptionPane.showMessageDialog;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.LoginDao;
import DAO.OrderDao;
import DAO.ProductDao;
import Pack.Cart;


//web servlet for handling products
@WebServlet("/products")
public class ProductServ extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public ProductServ() {
		super();
	}
	private OrderDao orderDao;

    public void init() {
        orderDao = new OrderDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//get id, make it integer
		int product_id = Integer.parseInt(request.getParameter("id"));
		System.out.println(product_id);
		try {
		//create a new cart model for product
		Cart cart = new Cart();
		cart.setProduct_id(product_id);
		//debugging
		//System.out.println("My product id is");
		//System.out.println(cart.getProduct_id());
		cart.setQuantity(1);
		//System.out.println(cart.getQuantity());
		cart.setTotal_price(orderDao.selectPrice(product_id));
		double price = cart.getTotal_price();
		//System.out.println(cart.getTotal_price());		
	
		
		//check if product already exists in cart
		if(orderDao.ProductExists(cart.getProduct_id())) {
			//if it already exists, update quantity and price
			if(orderDao.updateCart(product_id,price)) {
				showMessageDialog(null, "Item added to cart!");
				response.sendRedirect("basket.jsp");
			}else {
				showMessageDialog(null, "There was a problem, try again!");
				response.sendRedirect("products.jsp");
			}
		}
		else {
			//if it doesn't yet exist, add it now
			if(orderDao.insertProduct(cart)) {
				showMessageDialog(null, "Item added to cart!");
				response.sendRedirect("basket.jsp");
			}else {
				showMessageDialog(null, "There was a problem, try again!");
				response.sendRedirect("products.jsp");
			}
			
		}
			} catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
	}
		
}


