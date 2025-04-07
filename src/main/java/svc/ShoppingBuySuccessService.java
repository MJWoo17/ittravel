package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.OrderDao;
import vo.OrderInfo;
import vo.ProdInfo;

public class ShoppingBuySuccessService {
	
public OrderInfo getBuySuccess () throws Exception {
		
		Connection con = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(con);
		
		OrderInfo orderinfo = new OrderInfo();
		orderDao.order_pay_success();
		
		return orderinfo;
		
		//db 처리하는 클래스
		//table shop_bas에 인서트하는 메소드
		//그 메소드에 제품 상세페이지에서 설정된 값들을 필요한 정보만 선택하여 insert한다.  
		
	}

}
