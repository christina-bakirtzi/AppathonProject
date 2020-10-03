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
import Pack.User;

//Web servlet for creating a new user.
@WebServlet("/create")
public class Create extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private User user;
	private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }
    public Create() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//if none of the parameters is null, get parameters from jsp fields.
		if(request.getParameter("username")!= "" && request.getParameter("password")!= "" && request.getParameter("name")!= "" && request.getParameter("birthdate")!= "") {
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String birthdate = request.getParameter("birthdate");
		
		//Create a new user(from user model, with set)
		user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setName(name);
		user.setBirthdate(birthdate);

			try {
				//check if the username is already taken. if not, request http session
				if (!loginDao.UserExists(username)) {
					HttpSession session = request.getSession();
					//get attributes given from the jsp file
					session.setAttribute("username", username);
					session.setAttribute("done", 1);
					try {
						//insert new user
						loginDao.insertUser(user);
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}
					//show messages for errors and redirect based on the situation.
					System.out.println("sending this thing to register");
					showMessageDialog(null, "You are now a member!");
					response.sendRedirect("register.jsp");

				} else {
					showMessageDialog(null,"Username already exists");
					response.sendRedirect("create.jsp");
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		else {
        	showMessageDialog(null, "Fill all the fields");
        	response.sendRedirect("create.jsp");
        }
	}

}