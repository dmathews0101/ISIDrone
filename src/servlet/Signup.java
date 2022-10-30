package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionSignUp;
import util.Const;

/**
 * Servlet implementation class Signup
 */
@WebServlet(name = "signup", urlPatterns = { "/signup" })
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(Const.PATH_PAGE_SIGNUP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ActionSignUp.signUp(request, response))
			if(request.getParameter("fromCart") == null)
				request.getRequestDispatcher(Const.PATH_PAGE_SIGNUP_COMPLETE).forward(request, response);
			else
				request.getRequestDispatcher(Const.PATH_PAGE_LOGIN).forward(request, response);
		else
			request.getRequestDispatcher(Const.PATH_PAGE_SIGNUP).forward(request, response);
	}

}
