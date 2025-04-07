package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.Join_MD;
import dto.Login_MD;

public class Login_controller {
	
	Connection conn = null;
	Statement stmt = null;
	
		
	public Login_controller() {  //생성자 
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e)
		{
			
		}
	}
	
	public void conn() { //연결 메소드

		try{

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamproject","root","1234");		
			
			if(conn==null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stmt = conn.createStatement();			
		
		}
		
			catch(Exception e) {	
						
			}		
	}
	
	public void diconn() { //연결해제 메소드
		
//		Connection conn = null;
//		Statement stmt = null;
		
		try	{
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
									
		}				
	}
	
	public Join_MD login(String mem_id, String mem_pw) {
		
		Join_MD joinlist = new Join_MD();
		
		try {		    
			    ResultSet rs = stmt.executeQuery("select * from mem_account where mem_id ='"+ mem_id + "';");
			    
			    if(rs.next()) {
			    	joinlist.setMem_id(mem_id);
			    	joinlist.setMem_pw(mem_pw);			    	
			    }			    		      
		    }
		
		catch (Exception e) {
			System.out.println("실패");
		}
		finally {
				try {
						
					conn.close();
					stmt.close();
						
				} catch (Exception ignored) {
						
				}
			}
		
		if(mem_pw.equals(joinlist.getMem_pw())) {
			
			System.out.println("로그인 성공");
			
		}else{
			
			System.out.println("로그인 실패");
		}
		
		return joinlist;
		
	}

}
