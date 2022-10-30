package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionCart;

/**
 * Servlet implementation class CartDropdownAPI
 */
@WebServlet(name = "cartDropdownAPI", urlPatterns = { "/cartDropdownAPI" })
public class CartDropdownAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Supprimer l'item du panier recu par AJAX
		if(request.getParameter("removeItem") != null){
			
			String serial = request.getParameter("removeItem");
			ActionCart.removeItem(serial, request);	
		}
	}

}
