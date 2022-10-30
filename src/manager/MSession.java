package manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MSession {

	public static HttpSession getSession(HttpServletRequest request){
		return request.getSession();
	}
	
	public static void destroySession(HttpServletRequest request){
		HttpSession session = getSession(request);
		session.invalidate();	
	}
}
