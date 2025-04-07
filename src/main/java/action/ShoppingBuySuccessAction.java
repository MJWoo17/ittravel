package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingBuyService;
import svc.ShoppingBuySuccessService;
import vo.ActionForward;
import vo.OrderInfo;
import vo.ProdInfo;

public class ShoppingBuySuccessAction implements Action {
	
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		ShoppingBuySuccessService prodBuySuccessService = new ShoppingBuySuccessService();
		
		OrderInfo article =  prodBuySuccessService.getBuySuccess(); //메소드를 호출하였음. 
		//article에는 ShoppingMainService의 반환값이 저장되어있다.
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("article", article);
		//저장된 article을 "article"로 다시 저장한다. 
	   	
   		forward.setPath("/shopping_buy_success.jsp");
   		
   		return forward;
	
		}
}
