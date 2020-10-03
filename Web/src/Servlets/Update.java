package Servlets;


import static javax.swing.JOptionPane.showMessageDialog;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import DAO.LoginDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

//web servlet to halnde user update
@WebServlet("/update")
public class Update extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private LoginDao logindao;

	public void init() {
		logindao = new LoginDao();
	}

	public Update() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("username")!= "" && request.getParameter("name")!= "" && request.getParameter("birthdate")!= "") {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		System.out.println(username);
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birthdate");
			try {
				//try to update with LoginDao.java
				if (logindao.updateUser(name, birthdate, username) ){
					showMessageDialog(null, "Your data has been updated");
					response.sendRedirect("register.jsp");
				//not successful - here's what we're gonna do. 
				} else {
					JOptionPane.showMessageDialog(null, "You need to login first to update data");
					response.sendRedirect("login.jsp");
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}    
        else {
        	showMessageDialog(null, "Fill all the fields");
        	response.sendRedirect("update.jsp");
        }
	}
}