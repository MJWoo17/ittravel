package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelPlanDAO;
import vo.TravelSchMngVO;

public class Travel_SchDayService {

	public ArrayList<TravelSchMngVO> schDayList() throws Exception{
		
		ArrayList<TravelSchMngVO> SchDay = null;
		Connection con = getConnection();
		TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
		travelPlanDAO.setConnection(con);
		SchDay = travelPlanDAO.selectSchMng();
		close(con);
		return SchDay;
		
	}

	
}
