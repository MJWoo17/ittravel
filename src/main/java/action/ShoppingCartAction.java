package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import svc.ShoppingCartService;
import svc.ShoppingMainService;
import vo.ActionForward;
import vo.CartInfo;
import vo.OrderInfo;
import vo.ProdInfo;

public class ShoppingCartAction implements Action {
	
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	
		String prod_name = request.getParameter("prod_name");
		int prod_quantity = Integer.parseInt(request.getParameter("prod_quantity"));
		int prod_price = Integer.parseInt(request.getParameter("prod_price"));
		String prod_mem_id = request.getParameter("prod_mem_id");
		
		String prod_bigct = request.getParameter("prod_bigct");
		String prod_smallct = request.getParameter("prod_smallct");
		String prod_image = request.getParameter("prod_image");
		String prod_opbct = request.getParameter("prod_opbct");
		String prod_opsct = request.getParameter("prod_opsct");
		
		CartInfo cart = new CartInfo();
		cart.setShop_bas_prod_name(prod_name);
		cart.setShop_bas_prod_quantity(prod_quantity);
		cart.setShop_bas_prod_price(prod_price);
		cart.setShop_bas_mem_id(prod_mem_id);
		cart.setShop_bas_bigct(prod_bigct);
		cart.setShop_bas_smallct(prod_smallct);
		cart.setShop_bas_image(prod_image);
		cart.setShop_bas_opbct(prod_opbct);
		cart.setShop_bas_opsct(prod_opsct);
		
		ShoppingCartService shoppingCartSvc = new ShoppingCartService();
		ArrayList<CartInfo> cartdirect_arr = shoppingCartSvc.getCart(cart); //메소드를 호출하였음.
		
		request.setAttribute("cartdirect_arr", cartdirect_arr);
		
		ActionForward forward = new ActionForward();
		
   		forward.setPath("/shopping_cart.jsp");
   		
   		return forward;

	 }

}
