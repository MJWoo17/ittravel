package action;

import javax.servlet.http.*;

import vo.ActionForward;
//어떤 기능을 하고 싶니? 하고 물어보는 부분
public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
