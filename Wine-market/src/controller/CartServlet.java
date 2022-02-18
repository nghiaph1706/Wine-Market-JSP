package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import entity.Cart;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CartDAO dao = new CartDAO();
		
		String command = request.getParameter("command") ;
		int productID = -1;
		try {
			productID =Integer.parseInt(request.getParameter("productID")) ;
		} catch (Exception e) {
			// TODO: handle exception
		}
		int userID = (int) session.getAttribute("userID");
		
		if (command.equals("insert")) {
			if (dao.checkProductExists(userID, productID)) {
				Cart cart = dao.selectByUserIdProductId(userID, productID);
				dao.plusProduct(cart);
			} else {
				dao.insert(new Cart(productID, 1, userID));
			}
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/detail.jsp?productID="+productID);
			requestDispatcher.forward(request, response);
		} else if (command.equals("plus")) {
			Cart cart = dao.selectByUserIdProductId(userID, productID);
			dao.plusProduct(cart);
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/cart.jsp");
			requestDispatcher.forward(request, response);
		} else  if (command.equals("remove"))  {
			Cart cart = dao.selectByUserIdProductId(userID, productID);
			dao.removeProduct(cart);
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/cart.jsp");
			requestDispatcher.forward(request, response);
		} else if (command.equals("payment")) {
			dao.deleteAllByUserId(userID);
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/payment.jsp");
			requestDispatcher.forward(request, response);
		} else if (command.equals("delete")) {
			Cart cart = dao.selectByUserIdProductId(userID, productID);
			dao.delete(cart.getCartId());
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/cart.jsp");
			requestDispatcher.forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
