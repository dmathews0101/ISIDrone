package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manager.MSession;
import util.Const;
import entities.Order;
import entities.User;
import action.ActionOrder;

/**
 * Servlet implementation class OrderHistory
 */
@WebServlet(name = "order-history", urlPatterns = { "/order-history" })
public class OrderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = MSession.getSession(request);
		User user = (User)session.getAttribute("user");
		
		List<Order> orderList= ActionOrder.getHistoryByUserID(user.getId());

		session.setAttribute("orderList", orderList);
		request.getRequestDispatcher(Const.PATH_PAGE_ORDERHISTORY).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
