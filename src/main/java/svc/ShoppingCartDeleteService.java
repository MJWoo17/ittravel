package svc;

import static db.JdbcUtil.getConnection;

import java.io.Closeable;
import java.sql.Connection;
import java.util.ArrayList;

import dao.ProdDao;
import dto.Joininfo;
import vo.ProdInfo;

import dao.OrderDao;
import vo.CartInfo;
import vo.OrderInfo;


public class ShoppingCartDeleteService {
	
	public void getCartDelete (int shop_bas_prod_num) throws Exception {
		
		Connection con = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(con);
		
		orderDao.cart_delete(shop_bas_prod_num);
		
		
		//db 처리하는 클래스
		//table shop_bas에 인서트하는 메소드
		//그 메소드에 제품 상세페이지에서 설정된 값들을 필요한 정보만 선택하여 insert한다.  
		
	}

}
