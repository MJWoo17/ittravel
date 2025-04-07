package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingBuyService;
import svc.ShoppingCartDeleteService;
import vo.ActionForward;
import vo.CartInfo;
import vo.OrderInfo;

public class ShoppingCartDeleteAction implements Action {
	
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		int shop_bas_prod_num = Integer.parseInt(request.getParameter("shop_bas_prod_num"));
		//장바구니에 있는 일련번호 가져오기 
		
		ShoppingCartDeleteService cartDeleteService = new ShoppingCartDeleteService();
		
		cartDeleteService.getCartDelete(shop_bas_prod_num);
		//장바구니 일련번호 삭제 메소드에 보내기
		
		ActionForward forward = new ActionForward();
		
//		request.setAttribute("order_article", article);
	   	
   		forward.setPath("/shopping_cart_direct.jsp");
   		
   		return forward;
	
		}

}
