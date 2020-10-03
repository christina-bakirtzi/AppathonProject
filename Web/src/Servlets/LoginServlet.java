package Servlets;
import java.io.IOException;

import static javax.swing.JOptionPane.showMessageDialog;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import Pack.LoginBean;
import DAO.LoginDao;

//webservlet hadling login.
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	if(request.getParameter("username")!= "" && request.getParameter("password")!= "") {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //create a loginbean model
        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);
        
        try {
        	HttpSession session = request.getSession();
        	session.setAttribute("username", loginBean.getUsername());
        	session.setAttribute("password", loginBean.getPassword());
            if (loginDao.login(loginBean)) {
            	//as a new user just logged in, drop cart table's data
            	loginDao.DeleteCart();
            	//loginDao.DeleteItems();

            	showMessageDialog(null, "You have successfully logged in!");
            	//redirect to homepage aftere successfull login
            	response.sendRedirect("register.jsp");
            } else if(loginDao.UserExists(loginBean.getUsername())){
            	//if the user already exists, refresh login.jsp
            	System.out.println(loginBean.getUsername());
            	showMessageDialog(null, "Login failed. Try again.");
                response.sendRedirect("login.jsp");
            } else {
            	//if the username doesn't exist, take him to register now, with the username he already put at login form
            	showMessageDialog(null, "User doesn't exist. Register now!");
            	response.sendRedirect("create.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
        else {
        	showMessageDialog(null, "Fill all the fields");
        	response.sendRedirect("login.jsp");
        }
}
    }
