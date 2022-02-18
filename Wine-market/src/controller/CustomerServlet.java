package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.realm.AuthenticatedUserRealm;

import dao.UserDAO;
import entity.User;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command") ;
		String userID = request.getParameter("userID");
		UserDAO dao = new UserDAO();
		if(command.equals("delete")) {
			User user = dao.selectById(Integer.parseInt(userID));
			if (!user.getRole()) {
				dao.delete(Integer.parseInt(userID));
			}
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/customerAdmin.jsp");
			requestDispatcher.forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String err = "";
		
		if (username.equals("") || email.equals("") || password.equals("") || repassword.equals("")) {
			err += "Please complete all information";
			request.setAttribute("err", err);
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/account.jsp");
			requestDispatcher.forward(request, response);
		} else if (!password.equals(repassword)) {
			err += "Re-Password incorrect";
			request.setAttribute("err", err);
			request.setAttribute("email", email);
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/account.jsp");
			requestDispatcher.forward(request, response);
		} else {
			UserDAO dao = new UserDAO();
			User user =  dao.selectByUsername(username);
			user.setEmail(email);
			user.setPassword(repassword);
			dao.update(user);
			err += "Update complete";
			request.setAttribute("err", err);
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/account.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
