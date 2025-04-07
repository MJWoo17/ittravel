package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ProdDao;
import vo.ProdInfo;

public class ShoppingMainService {
	
	public ArrayList<ProdInfo> getMain() throws Exception {
	
	Connection con = getConnection();
	ProdDao prodDao = ProdDao.getInstance();
	prodDao.setConnection(con);
	//서비스는 디비에 연결하는 커넥션이 주목적이다. 
	//그리고 연결하제하는 것 까지 
	
	ArrayList<ProdInfo> mainprod =  prodDao.Prod_info();
	
	close(con);
	System.out.println("마지막"+con + "\n");
	
	return mainprod;
	//쇼핑메인액션이 쇼핑메인서비스메소드를 불렀기 때문에 반환값을 리턴으로 줘야한다. 
} 

}
