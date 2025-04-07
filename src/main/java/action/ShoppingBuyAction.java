package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingBuyService;
import svc.ShoppingMainService;
import svc.ShoppingProdDetailService;
import vo.ActionForward;
import vo.OrderInfo;
import vo.ProdInfo;

public class ShoppingBuyAction implements Action {
	
	
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		//ProdInfo prodinfo = new ProdInfo ();
		
		ShoppingBuyService prodBuyService = new ShoppingBuyService();
		
		OrderInfo article =  prodBuyService.getBuy(); //메소드를 호출하였음. 
		//article에는 ShoppingMainService의 반환값이 저장되어있다.
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("order_article", article);
		//저장된 article을 "article"로 다시 저장한다. 
	   	
   		forward.setPath("/shopping_buy.jsp");
   		
   		return forward;
	
		}

}
