package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
//import action.BoardListAction;
import action.TravelMasterAction;
import action.TravelPlanAction;
import action.TravelSchMngListAction;
import action.Travel_InsertScheduleAction;
import vo.ActionForward;

@WebServlet("*.bo") //bo라고 끝나면 바로 컨트롤러 타고 들어간다는 뜻
					//컨트롤러는 진행 방향만 알려주는 부분
public class TravelPlanController extends javax.servlet.http.HttpServlet 
{
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
	

		if(command.equals("/travelPlan.bo")){
			System.out.println("open");
			TravelPlanAction travelPlanAction = new TravelPlanAction();
			try{
				forward=travelPlanAction.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(command.equals("/insertTravel.bo")){
			action = new TravelMasterAction();
			try{
				forward=action.execute(request, response );
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(command.equals("/travelSchMng.bo")){
			action = new TravelSchMngListAction();
			try{
				forward=action.execute(request, response );
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(command.equals("/insertSchedule.bo")){
			action = new Travel_InsertScheduleAction();
			try{
				forward=action.execute(request, response );
			}catch(Exception e){
				e.printStackTrace();
			}
		}

//		if(command.equals("/insertLine.bo")){
//			action = new SelectLineAction();
//			try{
//				forward=action.execute(request, response );
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}
		
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
//		else if(command.equals("/schManage.bo")){
//			action = new TraveSchMngListAction();
//			try{
//				forward=action.execute(request, response);
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}
		
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