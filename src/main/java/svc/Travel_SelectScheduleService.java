package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.TravelPlanDAO;
import dto.TravelSchDTO;
import vo.TravelPlanVO;

public class Travel_SelectScheduleService {

	public ArrayList<TravelSchDTO> selectSchList(int sch_tra_num) throws Exception{
		
		 ArrayList<TravelSchDTO> schList = null;
		    Connection con = getConnection();
		    TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
		    travelPlanDAO.setConnection(con);

		    TravelSchDTO travelSchDTO = new TravelSchDTO();
		    travelSchDTO.setSch_tra_num(sch_tra_num);

		    schList = travelPlanDAO.selectSchList(travelSchDTO);
		    close(con);
		    return schList;
		}

	
}