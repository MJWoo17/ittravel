package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import svc.ShoppingCartDirectService;
import svc.ShoppingCartService;
import vo.ActionForward;
import vo.CartInfo;

public class ShoppingCartDirectAction implements Action {
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String cart_id = (String) request.getParameter("mem_id");
		
		ShoppingCartDirectService shoppingCartDirectSvc = new ShoppingCartDirectService();
		ArrayList<CartInfo> cartdirect_arr = shoppingCartDirectSvc.getCartDirect(cart_id); //메소드를 호출하였음.
		
		request.setAttribute("cartdirect_arr", cartdirect_arr);
		
		ActionForward forward = new ActionForward();
		
   		forward.setPath("/shopping_cart_direct.jsp");
   		
   		return forward;

	 }

}
