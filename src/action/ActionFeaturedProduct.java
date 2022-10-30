package action;

import javax.servlet.http.HttpServletRequest;

import manager.MItem;

public class ActionFeaturedProduct {
	public static void getFeaturedProduct(HttpServletRequest request) {
		request.setAttribute("featuredProduct", MItem.getFeaturedItems());
	}
}
