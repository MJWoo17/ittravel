package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.TravelPlanService;
import vo.ActionForward;
import vo.TravelPlanVO;

 public class TravelPlanAction {
	 
		public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{	 

		 
		ArrayList<TravelPlanVO> cityList=new ArrayList<TravelPlanVO>();		
		
		TravelPlanService travelPlanService = new TravelPlanService();
		cityList = travelPlanService.selectCityList();
   		
		request.setAttribute("cityList", cityList);
		ActionForward forward= new ActionForward();
   		forward.setPath("travel_plan.jsp");
   		return forward;
   		
	 }
	 
 }