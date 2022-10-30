package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Cart;
import entities.ItemCart;
import manager.MSession;

public class ActionStartup {
	public static void init(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = MSession.getSession(request);
		
		// Creer l'objet cart en session s'il n'existe pas
		if (session.getAttribute("cart") == null){
			Cart cart = new Cart();
			session.setAttribute("cart", cart);
		}else{
			Cart cart = (Cart) session.getAttribute("cart");
			
			// Detruir le panier s'il contient des items nul
			// Peux survenir lors de modification au code
			for (ItemCart itemC : cart.getCart().values()) {
				if(itemC.getSerial() == null){
					cart = new Cart();
					session.setAttribute("cart", cart);
					break;
				}
			}
		}
	}
}
