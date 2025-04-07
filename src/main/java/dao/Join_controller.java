package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Date;

import dto.Join_MD;
import dto.N_MD;

public class Join_controller {
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
		
	public Join_controller() {  //생성자 
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e)
		{
			
		}
	}
	
	public void conn() { //연결 메소드

		try{

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamproject?useUnicode=true&characterEncoding=utf8","root","eogkrrksek!1");		
			
			if(conn==null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stmt = conn.createStatement();			
		
		}
		
			catch(Exception e) {	
						
			}		
	}
	
	public void diconn() { //연결해제 메소드
		
		try	{
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			
									
		}				
	}
	
public int join_insert(Join_MD md) {	 //select 메소드, 리턴 해서 반환값이 list ArrayList<md>해서 void는 못쓰다..		
		String SQL = "insert into mem_account values(?,?,?,?,?,?,?,?,?,?,NOW())"; 

		try { //실행

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, md.getMem_id());
			pstmt.setString(2, md.getMem_pw());
			pstmt.setString(3, md.getMem_name());
			pstmt.setString(4, md.getMem_nick());
			pstmt.setString(5, md.getMem_email1() + "@" + md.getMem_email2());
			pstmt.setString(6, "(우:" + md.getPostal_code() + ")" + md.getAddr() + md.getExtra_addr() + "(" + md.getRefer_addr() +")" );
			pstmt.setString(7, md.getMem_mobile1() + "-" + md.getMem_mobile2() + "-" + md.getMem_mobile3());
			pstmt.setString(8, md.getMem_sex());
			pstmt.setString(9,  md.getMem_birthyear() + md.getMem_birthmonth() +md.getMem_birthday());
			pstmt.setString(10, md.getMem_news());

			System.out.println("됐냥??");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("ㄴㄴ");

		} finally {
			try {
				stmt.close();
			} catch (Exception ignored) {

			}
			try {
				conn.close();
			} catch (Exception ignored) {
			}
		}
		return 0;
	}
}
