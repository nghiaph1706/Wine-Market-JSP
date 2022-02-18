package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entity.User;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		UserDAO dao = new UserDAO();
		String url ="/login.jsp";
		
		String username_err = "", password_err ="", email_err = "";
		
		if (username.equals("")) {
			username_err += "Please enter username";
		} else {
			if (dao.checkUsername(username) == true) {
				username_err += "Username already exists";
			}
		}
		
		if (password.equals("")) {
			password_err += "Please enter password";
		} else {
			if (password.length()<6) {
				password_err += "The password is too short";
			}
		}
		
		if (email.equals("")) {
			email_err += "Please enter email";
		}
		
		if (username_err.length()>0) {
			request.setAttribute("username_err", username_err);
			request.setAttribute("username", username);
		}
		
		if (password_err.length()>0) {
			request.setAttribute("password_err", password_err);
		}
		
		if (email_err.length()>0) {
			request.setAttribute("email_err", email_err);
			request.setAttribute("email", email);
		}
		
		try {
			if (username_err.length() == 0 && password_err.length() == 0 && email_err.length()==0) {
				dao.insert(new User(username,password,email,false));
				HttpSession session = request.getSession();
				session.setAttribute("uname", username);
				url = "/index.jsp";
			} else {
				url = "/login.jsp";
				request.setAttribute("username", username);
				request.setAttribute("email", email);
			}
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
