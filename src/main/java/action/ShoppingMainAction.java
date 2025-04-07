package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ShoppingMainService;
import svc.ShoppingProdDetailService;
import vo.ActionForward;
import vo.ProdInfo;

public class ShoppingMainAction implements Action {
	
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		//ArrayList<ProdInfo> prodinfo = new ArrayList<ProdInfo>();
		
		ShoppingMainService prodMainService = new ShoppingMainService();
		ArrayList<ProdInfo> article =  prodMainService.getMain(); //메소드를 호출하였음. 
		//article에는 ShoppingMainService의 반환값이 저장되어있다.
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("articlemain", article);
		//저장된 article을 "article"로 다시 저장한다. 
	   	
   		forward.setPath("/shoppingmain.jsp");
   		
   		return forward;

	 }

}
