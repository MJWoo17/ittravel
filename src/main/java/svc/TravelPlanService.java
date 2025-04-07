package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.TravelPlanDAO;
import vo.TravelPlanVO;

public class TravelPlanService {

	public ArrayList<TravelPlanVO> selectCityList() throws Exception{
		
		ArrayList<TravelPlanVO> cityList = null;
		Connection con = getConnection();
		TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
		travelPlanDAO.setConnection(con);
		cityList = travelPlanDAO.selectCityList();
		close(con);
		return cityList;
		
	}

}
