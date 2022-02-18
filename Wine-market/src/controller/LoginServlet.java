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
import utils.CookieUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		if (command.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			CookieUtils.add("username", null, 0, response);
			response.sendRedirect("/Wine-market/index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		
		UserDAO dao = new UserDAO();
		String url ="/login.jsp";
		
		String err = "";
		
		if (username.equals("") || password.equals("")) {
			err += "Please enter username and password";
		} else {
			if (dao.checkLogin(username,password) == false) {
				err += "Incorrect username or password";
			}
		}
		
		if (err.length()>0) {
			request.setAttribute("username", username);
			request.setAttribute("err", err);
		}
		
		try {
			if (err.length() == 0) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", username);
				session.setAttribute("userID", dao.selectByUsername(username).getUserId());
				url = "/index.jsp";
				int hours = (remember == null) ? 0 : 24;
				CookieUtils.add("username", username, hours, response);
			} else {
				url = "/login.jsp";
			}
			if(dao.selectByUsername(username).getRole()){
				RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/productAdmin.jsp");
				requestDispatcher.forward(request, response);
			} else {
				RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
				requestDispatcher.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	} 

}
