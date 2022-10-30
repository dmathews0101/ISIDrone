package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manager.MSession;
import entities.User;
import action.ActionOrder;
import util.Const;

// Servlet appeler juste avant d'afficher la servlet de la facture

@WebServlet(name = "cartuser", urlPatterns = { "/cartuser" })
public class CartUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("toInvoice")!= null){
			
			// Recupere le user et le panier de la session
			HttpSession session = MSession.getSession(request);
			User user = (User)session.getAttribute("user");
			entities.Cart cart = (entities.Cart)session.getAttribute("cart");
			
			int orderId = ActionOrder.process(user, cart);
			request.setAttribute("orderId", orderId);

			request.getRequestDispatcher(Const.PATH_PAGE_INVOICE).forward(request, response);
		}
	}

}
