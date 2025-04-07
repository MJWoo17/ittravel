package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ProdDao;
import vo.CartInfo;

public class ShoppingCartDirectService {
	
public ArrayList<CartInfo> getCartDirect (String cart_id) throws Exception {
		
		Connection con = getConnection();
		ProdDao prodDao = ProdDao.getInstance();
		prodDao.setConnection(con);
		
		ArrayList<CartInfo> cartdirect_arr =  prodDao.Prod_cart_direct_select(cart_id);
		//db 처리하는 클래스
		//table shop_bas에 인서트하는 메소드
		//그 메소드에 제품 상세페이지에서 설정된 값들을 필요한 정보만 선택하여 insert한다.
		
		return cartdirect_arr;
	}

}
