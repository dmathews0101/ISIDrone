package manager;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MCookies {

	public static boolean exist(String name, HttpServletRequest request) {
		Cookie[] mesCookies = request.getCookies();

		if (mesCookies != null && mesCookies.length > 0)
			for (Cookie cookie : mesCookies) {
				if (cookie.getName().equals(name))
					return true;
			}
		return false;
	}

	public static String getValue(String nom, HttpServletRequest request) {
		Cookie[] mesCookies = request.getCookies();
		for (Cookie cookie : mesCookies) {
			if (cookie.getName().equals(nom))
				return cookie.getValue();
		}
		return "";
	}

	public static void create(String name, String value,
			HttpServletResponse response) {
		Cookie monCookie = new Cookie(name, value);
		monCookie.setMaxAge(60 * 60 * 24 * 365);
		response.addCookie(monCookie);	
	}
	
	public static void destroy(String name, HttpServletRequest request, HttpServletResponse response){
		Cookie[] mesCookies = request.getCookies();
		if (exist(name, request)){
			for (Cookie cookie : mesCookies) {
				if (cookie.getName().equals(name)){
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
	}
}
