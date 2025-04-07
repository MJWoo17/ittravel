package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.TravelDTO;
import svc.TravelMasterService;
import svc.TravelPlanService;
import vo.ActionForward;
import dto.TravelDTO;
import vo.TravelPlanVO;
import vo.TravelSchMngVO;

public class TravelMasterAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		ActionForward forward = null;
		TravelDTO travelDTO = new TravelDTO();
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		String coouncity = request.getParameter("coouncity");

		
		travelDTO.setTra_mem_id(mem_id);
		travelDTO.setTra_city(coouncity);
		travelDTO.setTra_dday(request.getParameter("depdate"));
		travelDTO.setTra_aday(request.getParameter("arrdate"));
		String tra_title = coouncity + "여행";
		travelDTO.setTra_title(tra_title);
		String tra_ppl_str = request.getParameter("tra_ppl");
		int tra_ppl = Integer.parseInt(tra_ppl_str);
		travelDTO.setTra_ppl(tra_ppl);
		

		

		TravelMasterService travelMasterService = new TravelMasterService();

		boolean isWriteSuccess = travelMasterService.registSch(travelDTO);
		System.out.println(isWriteSuccess);
		if (!isWriteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('fail')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("travelSchMng.bo");
		}

		return forward;

	}

}
