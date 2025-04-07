package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.TravelPlanDAO;
import dto.TravelDTO;


public class TravelSchMngListService {

		public TravelDTO tra_cityList() throws Exception{
			
			TravelDTO tra_cityList = null;
			Connection con = getConnection();
			TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
			travelPlanDAO.setConnection(con);
			tra_cityList = travelPlanDAO.selectTraMasterList();
			close(con);
			return tra_cityList;
			
		}
		


	}

	

