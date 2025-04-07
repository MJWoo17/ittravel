package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.TravelPlanDAO;
import dto.TravelDTO;

public class TravelMasterService {
	public boolean registSch(TravelDTO travelDTO) throws Exception {

		boolean isWriteSuccess = false;
		Connection con = getConnection();
		TravelPlanDAO travelPlanDAO = TravelPlanDAO.getInstance();
		travelPlanDAO.setConnection(con);
		int insertCount = travelPlanDAO.insertTravelMaster(travelDTO);

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
