package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelPlanDAO;
import vo.Travel_LocInfoVO;

public class Travel_LocListService {

	public ArrayList<Travel_LocInfoVO> selectCityList() throws Exception{
		
		ArrayList<Travel_LocInfoVO> locList = null;
		Connection con = getConnection();
		TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
		travelPlanDAO.setConnection(con);
		locList = travelPlanDAO.selectLocList();
		close(con);
		return locList;
		
	}

	
}
