package svc;

import java.sql.Connection;

import dao.ProdDao;
import vo.ProdInfo;
import static db.JdbcUtil.*;

public class ShoppingProdDetailService {
	
	public ProdInfo getProd (int prod_num) throws Exception {
		//이 서비스 페이지에서 디비 연결을 한다. 
		
		Connection con = getConnection();
		ProdDao prodDao = ProdDao.getInstance();
		prodDao.setConnection(con);
		
		//int prod_num = prodinfo.getProd_num();
		//prod-num값으로 제품상세페이지로 넘어가기 위해서 
		
		ProdInfo prod = prodDao.Prod_detail(prod_num);
		//System.out.println(prod.getProd_bigct()+"서비스");
		//prodDao의 반환값을 prod에 저장한다. 
		//prod에는 상품일련번호의 해당 레코드 데이터가 저장되어있다. 
		//리턴값이 있으면 리턴값과 같은 데이터타입으로 받아줘야한다. 
		//그래서 ProdInfo로 객체성성한 것이다.
		
		close(con);
		//System.out.println("마지막"+con + "\n");
		
		return prod;
		//이 리턴값은 이 메소드를 호출한 ShoppingProdAction페이지로 반환됨. 
		//그리고 페이지에서는 그 반환값을 저장해야 한다. 
	}

}
