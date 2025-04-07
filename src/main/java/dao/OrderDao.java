package dao;

import java.io.Closeable;
import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.jsp.jstl.sql.Result;
import javax.sql.DataSource;
import javax.websocket.OnClose;

import db.JdbcUtil;
import dto.Joininfo;
import vo.OrderInfo;
import vo.CartInfo;

public class OrderDao {
	
	DataSource ds;
	Connection con;
	PreparedStatement pstmt = null;
	
	private static OrderDao orderDao;

	private OrderDao() {
		
	}

	public static OrderDao getInstance(){
		if(orderDao == null){
			orderDao = new OrderDao();
		}
		return orderDao;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
	
	
////////////////////////////////////////////////////////////////////////////////////
	
	public void order_pay(OrderInfo orderinfo) {
		
		try {
			
			pstmt = con.prepareStatement( "insert into ord_info values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
			
			Date currentDate = new Date();
			// 내일 날짜를 구함
			long tomorrowMillis = currentDate.getTime() + (24 * 60 * 60 * 1000);
			Date tomorrowDate = new Date(tomorrowMillis);
			// 내일 날짜를 java.sql.Date로 변환하여 orderinfo 객체에 저장
			java.sql.Date ord_date = new java.sql.Date(tomorrowDate.getTime());
			orderinfo.setOrd_date(ord_date.toString());
			
			System.out.println(ord_date);
			
		} catch (Exception e) {
			
			System.out.println("order insert 실패");
			System.out.println(e);
			e.printStackTrace();
			// TODO: handle exception
			
		} finally {
		
		}
		
	}
	
//	Date currentDate = new Date();
//	// 내일 날짜를 구함
//	long tomorrowMillis = currentDate.getTime() + (24 * 60 * 60 * 1000);
//	Date tomorrowDate = new Date(tomorrowMillis);
//	// 내일 날짜를 java.sql.Date로 변환하여 orderinfo 객체에 저장
//	java.sql.Date ord_date = new java.sql.Date(tomorrowDate.getTime());
//	orderinfo.setOrd_date(ord_date.toString());
	
//	System.out.println(ord_date);
	
	public void order_pay_success () {
		
		
		try {
				
				pstmt = con.prepareStatement( "select * from ord_info " );
				ResultSet rs =  pstmt.executeQuery();
				
				while (rs.next()) {
		            
		            Date ordDate = rs.getDate("ord_date");// ord_date 값을 가져와서 Date 객체로 변환합니다.
		            
		            Calendar cal = Calendar.getInstance(); // Calendar 객체를 생성하여 Date 객체를 설정합니다.
		            cal.setTime(ordDate);
		            
		            cal.add(Calendar.DAY_OF_MONTH, 1);	// 하루를 더한 다음, 다시 Date 객체로 변환합니다.
		            Date nextDay = new Date(cal.getTimeInMillis());
		            
		            ////////////////////////////
		            
		            int ord_num = rs.getInt("ord_num");
		            String ord_name = rs.getString("ord_name"); 
		            String ord_mobile = rs.getString("ord_mobile"); 
		            String ord_mem_addr1 = rs.getString("ord_mem_addr1");
		            String ord_mem_addr2 = rs.getString("ord_mem_addr2");
		            String ord_mem_addr3 = rs.getString("ord_mem_addr3");
		            String ord_mem_addr4 = rs.getString("ord_mem_addr4");
		            String ord_ask = rs.getString("ord_ask");
		            String ord_payway = rs.getString("ord_payway");
		            String ord_date = nextDay.toString(); // 변환된 Date 객체를 문자열로 변환합니다.
		            String ord_count = rs.getString("ord_count");
		            String ord_prod_num = rs.getString("ord_prod_num");
		            String ord_mem_id = rs.getString("ord_mem_id");
		            
		            
		            System.out.println(ord_date);
		            System.out.println(ord_name);
		        }
				
				
				
			} catch (Exception e) {
				
				System.out.println("결제성공페이지 select 실패");
				System.out.println(e);
				e.printStackTrace();
				// TODO: handle exception
				
			} finally {
			
			}
			
		}
			
	/////////////////////////
	
	public OrderInfo order_mem_info () {
		
		OrderInfo orderinfo = new OrderInfo();
		
		System.out.println("이건되고");
		
		try {
			
			pstmt = con.prepareStatement( " select * from mem_account " );
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				orderinfo.setOrd_mem_id(rs.getString("mem_id"));
				
				String memAddr = rs.getString("mem_addr");
				String[] memAddrFields = memAddr.split("/");
			    orderinfo.setOrd_mem_addr1(memAddrFields[0]);
			    orderinfo.setOrd_mem_addr2(memAddrFields[1]);
			    orderinfo.setOrd_mem_addr3(memAddrFields[2]);
			    orderinfo.setOrd_mem_addr4(memAddrFields[3]);
				//orderinfo.setOrd_mem_addr(rs.getString("mem_addr"));
			    
				orderinfo.setOrd_mobile(rs.getString("mem_mobile"));
				orderinfo.setOrd_name(rs.getString("mem_name"));
				
//				String mem_id = rs.getString("mem_id");
//				String mem_addr = rs.getString("mem_addr");
//				String mem_mobile = rs.getString("mem_mobile");
//				String mem_name = rs.getString("mem_name");
//				String mem_id = rs.getString("mem_id");
//				String mem_id = rs.getString("mem_id");
//				String mem_id = rs.getString("mem_id");
				
				System.out.println("이건 안되고");
				System.out.println("--------------------------");
				System.out.println(orderinfo.getOrd_mem_addr1());
				System.out.println(orderinfo.getOrd_mem_addr2());
				System.out.println(orderinfo.getOrd_mem_addr3());
				System.out.println(orderinfo.getOrd_mem_addr4());
				System.out.println("--------------------------");
			}
			
		} catch (Exception e) {
			
			System.out.println("order meminfo select 실패");
			System.out.println(e);
			e.printStackTrace();
			
			// TODO: handle exception
			
		} finally {
		
		}
		return orderinfo;
		
	}
	
	//////////////////////////////////////////////
	
	public void cart_delete(int shop_bas_prod_num) {
		
		try {
			
			pstmt = con.prepareStatement( "delete from shop_bas where shop_bas_prod_num = ? " );
			pstmt.setInt(1, shop_bas_prod_num);

			int rowNum = pstmt.executeUpdate();
	         
	         System.out.println("삭제?"+rowNum);
	      
	      if(rowNum <1) {
	         
	         throw new Exception("데이터를 DB에 입력할 수 없습니다");
	      }
	      
	      	System.out.println(rowNum+"=========rownum");
			System.out.println("pstmt: "+pstmt);
			
			
		} catch (Exception e) {
			
			System.out.println(" cart 제품 delete 실패");
			System.out.println(e);
			e.printStackTrace();
			
		} finally {
			
			System.out.println("finally:      "+pstmt);
			
			 JdbcUtil.commit(con);
			 JdbcUtil.close(pstmt);

		
		} 
		
		
	}
	

	
	
}
