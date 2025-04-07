package action;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdDao;
import dto.PROD_MD;
import svc.ShoppingProdDetailService;
import vo.ActionForward;
import vo.ProdInfo;

public class ShoppingProdAction implements Action {
	
public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		
		ShoppingProdDetailService prodDetailService = new ShoppingProdDetailService();
		//클래스 ShoppingProdDetailService 객체 생성
		
		ProdInfo article = prodDetailService.getProd(prod_num);
		//클래스 ShoppingProdDetailService의 메소드 getProd에 객체 prodinfo를 보낸다. 
		//ShoppingProdDetailService의 반환값을 article로 받는다. 
		//지금 이 article에는 클릭한 상품의 일련번호의 한 레코드의 데이터가 들어있다. 
		
	//	System.out.println(article.getProd_bigct()+"액션");
		
		ActionForward forward = new ActionForward();
		
		request.setAttribute("prod", article);
	   	
   		forward.setPath("/shopping_prod.jsp");
   		
   		return forward;

	 }
	
	

}
