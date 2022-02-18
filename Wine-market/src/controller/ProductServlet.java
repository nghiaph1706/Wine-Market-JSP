package controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import dao.ProductDAO;
import entity.Product;
import entity.User;

/**
 * Servlet implementation class ProductServlet
 */
@MultipartConfig
@WebServlet({"/ProductServlet","/ProductServlet/create","/ProductServlet/update","/ProductServlet/reset","/ProductServlet/search"})
public class ProductServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String command = "";
		ProductDAO daop = new ProductDAO();
		int productID = -1;
		try {
			productID =Integer.parseInt(request.getParameter("productID")) ;
			command += request.getParameter("command") ;
		} catch (Exception e) {
		}
		
		if (command.equals("edit")) {
			session.setAttribute("productEditId", productID);
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/productAdmin.jsp");
			requestDispatcher.forward(request, response);
		} else if (command.equals("delete")) {
			daop.delete(productID);
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/productAdmin.jsp");
			requestDispatcher.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String urlString = request.getRequestURL().toString();
		HttpSession session = request.getSession();
		if (urlString.contains("create")) {
			try {
				create(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("productEditId", null);
			response.sendRedirect("/Wine-market/productAdmin.jsp");
		}  else if (urlString.contains("update")) {
			try {
				update(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("productEditId", null);
			response.sendRedirect("/Wine-market/productAdmin.jsp");
		} else if (urlString.contains("reset")) {
			session.setAttribute("productEditId", null);
			response.sendRedirect("/Wine-market/productAdmin.jsp");
		} else if (urlString.contains("search")) {
			String searchString = request.getParameter("search");
			if(searchString.length() > 0) {
				response.sendRedirect("/Wine-market/index.jsp?search="+searchString);
			} else {
				response.sendRedirect("/Wine-market/index.jsp");
			}
			
		}
	}
	
	protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		ProductDAO daop = new ProductDAO();
		Product product = new Product();
		BeanUtils.populate(product, request.getParameterMap());
		
		String uploadfolder = request.getServletContext().getRealPath("./images/product-details");
		Path uploadPath = Paths.get(uploadfolder);
		
		Part imagePart = request.getPart("photo_file");
		String imageFilename = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
		imagePart.write(Paths.get(uploadPath.toString(),imageFilename).toString());
		
		product.setImage(imageFilename);
		
		daop.insert(product);
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		ProductDAO daop = new ProductDAO();
		HttpSession session = request.getSession();
		Product product = new Product();
		BeanUtils.populate(product, request.getParameterMap());
		product.setProductId((int) session.getAttribute("productEditId"));
		
		String uploadfolder = request.getServletContext().getRealPath("./images/product-details");
		Path uploadPath = Paths.get(uploadfolder);
		
		Part imagePart = request.getPart("photo_file");
		String imageFilename = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
		imagePart.write(Paths.get(uploadPath.toString(),imageFilename).toString());
		
		product.setImage(imageFilename);
		
		daop.update(product);
	}

}
