package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import dto.Soc_dto;

public class Soc_controller {

	Connection conn = null;
	Statement stmt = null;

	public Soc_controller() { // 생성자

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {

		}
	}

	public void conn() { // 연결 메소드

		try {

			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/teamproject?useUnicode=true&characterEncoding=utf8", "root", "1234");

			if (conn == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stmt = conn.createStatement();

		}

		catch (Exception e) {

		}
	}



	public void diconn() { // 연결해제 메소드

//		Connection conn = null;
//		Statement stmt = null;

		try {
			stmt.close();
			conn.close();

		} catch (Exception e) {

		}
	}

	
	
	public void insert(Soc_dto md) { //글쓰기

		try { // 실행

			int soc_num = 0;
			
			conn();

			ResultSet rs = null;
			rs = stmt.executeQuery("SELECT MAX(soc_num) From soc_info");

			
			if (rs.next()) {
				soc_num = rs.getInt(1) + 1;
			}

			Date currentDate = new Date();

			java.sql.Date soc_date = new java.sql.Date(currentDate.getTime());
			md.setSoc_date(soc_date.toString());

			
			String mem_id = md.getMem_id();
			String soc_con = md.getSoc_con();
			String soc_img = "/IT/upload/board/"+md.getSoc_img();
			
			int soc_like = 0;
			int soc_rep = 0;
			
						
//			int log_view = md.getLog_view();
			// System.out.println(title);
			
			String ss = String.format("insert into soc_info (soc_num, soc_date, soc_like, soc_rep, soc_con, soc_img, mem_id) "
					+ " values ( %s ,'%s',%s, %s,'%s','%s','%s')", 
					soc_num, soc_date, soc_like, soc_rep, soc_con, soc_img, mem_id);

			int rowNum = stmt.executeUpdate(ss);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다");
			}

			System.out.println("됐냥??");
		}
		catch (Exception e) { // 예외처리

			System.out.println(e);
			// System.out.println(qnamng.getPostdate());
			System.out.println("아 한글이 나오긴 하는구나");

		} finally {

			diconn(); // 데이터베이스 연결 종료
		}
	}
}
