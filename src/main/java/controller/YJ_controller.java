package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.ShoppingBuyAction;
import action.ShoppingBuySuccessAction;
import action.ShoppingCartAction;
import action.ShoppingCartDirectAction;
import action.ShoppingCartDeleteAction;
import action.ShoppingMainAction;
import action.ShoppingProdAction;
import vo.ActionForward;

@WebServlet("*.do") //.bo로 들어오는 모든 request를 이 컨트롤러에서 받겠다.

public class YJ_controller extends javax.servlet.http.HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null; //아래에 있는 여러 forward에 쓰기 위에서 위에다가 놓았음.
		Action action=null;

		if(command.equals("/aaa.do")){ //요청이 이 이름과 같으면 
			
			forward=new ActionForward(); //액션포워드의 객체를 사용하기 위해서 객체를 생성한다.  //위에서 변수(전역변수)를 선언했기 때문에 여기서는 값을 객체에 넣기만 한다. 
			
			forward.setPath("/shopping_prod.jsp"); //ActionForward 클래스의 setter(setPath)를 이용해서 path변수에 값을 지정한다.
			//forward의 경로를 qna_board_write.jsp로 설정한다.
			//요청의 이름이 boardWriteForm.jsp면 qna_board_write.jsp로 간다는 뜻이다. 
			
		} else if(command.equals("/shoppingmain.do") ) {
			action = new ShoppingMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/shopping_prod.do") ) {
			action = new ShoppingProdAction(); //클래스 액션 객제 생성
			try {
				forward = action.execute(request, response); //클래스 ShoppingProdAction의 메소드 execute호출
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/shopping_cart.do") ) {
			action = new ShoppingCartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else if(command.equals("/shopping_cart_direct.do") ) {
			action = new ShoppingCartDirectAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/shopping_cart_delete.do") ) {
			action = new ShoppingCartDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/shopping_buy.do") ) {
			action = new ShoppingBuyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/shopping_buy_success.do") ) {
			action = new ShoppingBuySuccessAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath()); //sendredirect는 바로 페이지이동하는 것
				
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath()); //dispactcher도 페이지 이동이긴 한데, 변수, 요청, 등 모든 내용을 들고 간다. 
				dispatcher.forward(request, response);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}