package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.TravelPlanDAO;
import dto.TravelSchDTO;

public class Travel_InsertScheduleService {

		public boolean insertSch(TravelSchDTO travelSchDTO) throws Exception {

			boolean isWriteSuccess = false;
			Connection con = getConnection();
			TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
			travelPlanDAO.setConnection(con);
			int insertCount = travelPlanDAO.insertSch(travelSchDTO);

			if (insertCount > 0) {
				commit(con);
				isWriteSuccess = true;
				System.out.println(isWriteSuccess);
			} else {
				rollback(con);
			}

			close(con);
			return isWriteSuccess;

		}

	}

	
	
