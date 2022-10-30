package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionCart;

import util.Const;

/**
 * Servlet implementation class Cart
 */
@WebServlet(name = "cart", urlPatterns = { "/cart" })
public class ServletCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(Const.PATH_PAGE_CART).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//Vérifie si le bouton supprimer a été appuyer et mets le panier a jour
		ActionCart.updateRemovedItem(request);
		
		boolean qtyValide = ActionCart.validateQty(request);
		//TODO Afficher msg d'erreur pour quantité invalid
		
		// Si checkout rediriger vers la facture
		if (request.getParameter("checkout") != null && qtyValide){
			
			// Met à jour les quantités
			ActionCart.updateCart(request);
			
			// Rediriger
			request.getRequestDispatcher(Const.PATH_PAGE_SUMMARY).forward(request, response);
		}else if (request.getParameter("back") != null && qtyValide){	// Met a jour les quantité et redirge sur index
			
			// Met à jour les quantités
			ActionCart.updateCart(request);
			
			// Rediriger
			response.sendRedirect("home");
		}
		else if (request.getParameter("refresh") != null && qtyValide){	// Met a jour les quantité et demeure sur la page
			
			// Met à jour les quantités
			ActionCart.updateCart(request);
			
			// Rediriger
			response.sendRedirect("cart");
		}else
			doGet(request, response);
	}

}
