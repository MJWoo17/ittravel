package dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import dto.Board_MD;

public class Board_controller {

	Connection conn = null;
	Statement stmt = null;

	public Board_controller() { // 생성자

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

	public void insert(Board_MD md) { // select 메소드, 리턴 해서 반환값이 list ArrayList<md>해서 void는 못쓰다..

		try { // 실행

			int log_num = 0;
			
			conn();

			ResultSet rs = null;
			rs = stmt.executeQuery("SELECT MAX(log_num) From travel_log");

			
			if (rs.next()) {
				log_num = rs.getInt(1) + 1;
			}

			Date currentDate = new Date();

//			java.sql.Date log_date = new java.sql.Date(currentDate.getTime());
//			md.setLog_date(log_date.toString());

			
			String mem_id = md.getMem_id();
			String log_where = md.getLog_where();
			String log_depdate = md.getLog_depdate();
			String log_arrdate = md.getLog_arrdate();
			String log_title = md.getLog_title();
			String log_con = md.getLog_con();
			String log_pic1 = "/IT/upload/"+md.getLog_pic1();
			String log_pic2 = md.getLog_pic2();
			String log_pic3 = md.getLog_pic3();
			String log_pic4 = md.getLog_pic4();
			String log_pic5 = md.getLog_pic5();
						
//			int log_view = md.getLog_view();
			// System.out.println(title);
			
			String ss = String.format("insert into travel_log (log_num, mem_id, log_where, log_depdate, log_arrdate, log_title, log_con, log_pic1, log_pic2, log_pic3, log_pic4, log_pic5) "
					+ " values ( %s ,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')", 
					log_num, mem_id, log_where, log_depdate, log_arrdate, log_title, log_con, log_pic1, log_pic2, log_pic3, log_pic4, log_pic5);

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

	
	public ArrayList<Board_MD> selectList() {

		conn();
		ArrayList<Board_MD> Board_list = new ArrayList<>();

		try {

			ResultSet rs = stmt.executeQuery("select * from travel_log;");

			while (rs.next()) {

				Board_MD board_list = new Board_MD();

				board_list.setLog_num(rs.getInt("log_num"));
				board_list.setLog_title(rs.getString("log_title"));
				// board_list.setPw(rs.getString("pw"));
				board_list.setLog_con(rs.getString("log_con"));
				board_list.setLog_pic1(rs.getString("log_pic1"));

				Board_list.add(board_list); // arraylist에 한 줄 저장 함.

			}

		} catch (Exception e) {
			System.out.println("외않되");

			// TODO: handle exception

		} finally {

			diconn();

		}
		return Board_list;

	}

	public Board_MD selectOne(String i) { /*
											 * N_view에서 받아온 String iii 값을 새로 정의한다. 똑같이 맞춰줘도 되는데, 값을 새로 정의할 수 있다는 걸 표시하기
											 * 위해서 일부러 다르게 줬다. 값은 이동이 되지만 변수명은 그 메소드 안에서만 활용된다. 그래서 다르게 줘도 됨. !값은 이동된거임!
											 */
		// num을 받아와서 String i라는 변수로 다시 정했다.

		conn();
		Board_MD board_md = new Board_MD();

		try {

			ResultSet rs = stmt.executeQuery("select * from travel_log where log_num= '" + i + "' ;"); // num값을 String
																										// i으로 받았기 때문에
																										// i를 쓴다.

			if (rs.next()) { // rs의 next가 있으면
				board_md.setLog_num(rs.getInt("log_num"));
				board_md.setLog_title(rs.getString("log_title"));
				board_md.setLog_where(rs.getString("log_where"));
				board_md.setLog_depdate(rs.getString("log_depdate"));
				board_md.setLog_arrdate(rs.getString("log_arrdate"));
				board_md.setLog_con(rs.getString("log_con"));
				board_md.setLog_pic1(rs.getString("log_pic1"));
//				board_md.setLog_pic2(rs.getString("log_pic2"));
//				board_md.setLog_pic3(rs.getString("log_pic3"));
//				board_md.setLog_pic4(rs.getString("log_pic4"));
//				board_md.setLog_pic5(rs.getString("log_pic5"));

			}
			// Board_list.add(board_list); //arraylist에 한 줄 저장 함.

		} catch (Exception e) {
			System.out.println(e);

			// TODO: handle exception

		} finally {

			diconn();

		}
		return board_md;

	}

	public void update(String i, String ii, String iii) {
		conn();

		try { // 실행

			// System.out.println(i);
			// System.out.println(ii);
			// System.out.println(iii);
			// System.out.println(iiii);

			// String ss = String.format("update notice set title= '" + i + "', con= '" + ii
			// + "', n_view = '" + iiii +"' where num= '"+ iii +"' ;" );
			String ss = String.format(
					"update notice_info set title= '" + i + "', log_con= '" + ii + "' where log_num= '" + iii + "' ;");

			System.out.println(ss);

			int rowNum = stmt.executeUpdate(ss);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다");
			}

			System.out.println("됐냥??");

		}

		catch (Exception e) { // 예외처리

			System.out.println(e);
			// System.out.println(qnamng.getPostdate());
			System.out.println("아 한글이 나오긴 하는구나 여기인가");

		} finally {

			diconn(); // 데이터베이스 연결 종료
		}

	}

	public Integer update_view(String num) {

		conn();

		int n_view = 0;

		try { // 실행

			ResultSet rs = stmt.executeQuery("select*from notice_info where log_num= '" + num + "' ;");
			// 글번호가 num인 데이터들을 select한다.

			if (rs.next()) {
				int vv = rs.getInt("log_view"); // rs에 저장된 int 이름이 log_veiw인 것을 int vv라고 정한다.
												// 이 ("log_view")는 필드명으로 지정한 것으로 하는 것인가?? 어디서 저한 name이지??!

				n_view = vv + 1; // 가져온 조회수에 1을 더하여 조회수값에 저장한다.

			}

			// System.out.println(n_view);

			String ss = String
					.format("update notice_info set log_view= '" + n_view + "' where log_num= '" + num + "' ;"); // 글번호가
																													// num인
																													// 레코드를
																													// 조회수
																													// n_view로
																													// 수정한다.

			System.out.println(ss);

			int rowNum = stmt.executeUpdate(ss);

			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다");
			}

			System.out.println("됐냥??");

		}

		catch (Exception e) { // 예외처리

			System.out.println(e);
			// System.out.println(qnamng.getPostdate());
			System.out.println("조회수 수정 결과 저장이,,,");

		} finally {

			diconn(); // 데이터베이스 연결 종료
		}
		return n_view;

	}

//	public void join_insert(Join_MD md) { // select 메소드, 리턴 해서 반환값이 list ArrayList<md>해서 void는 못쓰다..
//
//		try { // 실행
//
//			conn();
//
//			String mem_id = md.getMem_id();
//			String mem_pw = md.getMem_pw();
//			String mem_name = md.getMem_name();
//			String mem_nick = md.getMem_nick();
//			String mem_email = md.getMem_email1() + "@" + md.getMem_email1();
//			String mem_addr = "(우:" + md.getPostal_code() + ")" + md.getAddr() + md.getExtra_addr() + "("
//					+ md.getRefer_addr() + ")";
//			String mem_mobile = md.getMem_mobile1() + "-" + md.getMem_mobile2() + "-" + md.getMem_mobile3();
//			String mem_sex = md.getMem_sex();
//			String mem_birth = md.getMem_birthyear() + md.getMem_birthmonth() + md.getMem_birthday();
//			String mem_news = md.getMem_news();
//			// String mem_join = md.getMem_join();
//
//			Date currentDate = new Date();
//			java.sql.Date mem_join = new java.sql.Date(currentDate.getTime());
//			md.setMem_join(mem_join.toString());
//
//			String ss = String.format(
//					"insert into mem_account values ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')", mem_id,
//					mem_pw, mem_name, mem_nick, mem_email, mem_addr, mem_mobile, mem_sex, mem_birth, mem_news,
//					mem_join);
//
//			System.out.println(ss);
//
//			int rowNum = stmt.executeUpdate(ss);
//			if (rowNum < 1) {
//				throw new Exception("데이터를 DB에 입력할 수 없습니다");
//			}
//
//			System.out.println("됐냥??");
//
//		}
//
//		catch (Exception e) { // 예외처리
//
//			System.out.println(e);
//			// System.out.println(qnamng.getPostdate());
//			System.out.println("회원가입 왜 안되냥??");
//
//		} finally {
//
//			diconn(); // 데이터베이스 연결 종료
//		}
//	}

//	public Join_MD login(String mem_id, String mem_pw) {
//
//		String idd;
//		String pww;
//		String nick;
//
//		Join_MD md = new Join_MD();
//
//		try {
//			conn();
//			ResultSet rs = stmt.executeQuery("select * from mem_account where mem_id ='" + mem_id + "';");
//
//			// rs에는 select문으로 가져온 값이 저장된다. select문은 데이터베이스에 이미 존재해야 select된다.
//			// mem_account테이블에 입력받은 아이디 값과 같은 값이 있다면 그 레코드를 select한다.
//			// select한 값을 rs에 저장한다.
//			// rs는 말그대로 로그인창에서 입력받은 값이기 때문에, 값이 데이터베이스에 존재하지 않을 경우 로그인이 안 된다. 값이 데이터베이스에
//			// 존재하면 로그인이 되는거임!
//			// 입력받은 아이디가 데이터베이스에 존재하지않으면 , rs에 저장자체가 되지않는다.
//
//			if (rs.next()) { // rs에 저장된 값의 다음이 있다면.. (입력받은 아이디가 데이터베이스에 존재하여 저장이 되었다면, 다음이 있는거임.)
//
//				idd = rs.getString("mem_id"); // rs에 저장되어있는, 입력받은 값(mem_id)을 id로 이름 지었다.
//				pww = rs.getString("mem_pw"); // rs에 저장된 값 중 "mem_pw"인 값을 pw로 이름 지었다.
//				nick = rs.getString("mem_nick");
//
//				// id와 pw가 mem_accoun에 저장되어있는 데이터들과 값이 같은지 비교하기
//				if (idd.equals(mem_id) && (pww.equals(mem_pw))) {
//
//					md.setMem_nick(nick);
//					md.setMem_id(idd);
//
//					System.out.println(nick);
//					System.out.println(md.getMem_nick());
//					System.out.println("여기서 나오는건가");
//
//				} else {
//					System.out.println("닉네임 왜 안나오지??");
//
//				}
//
//			}
//
//		}
//
//		catch (Exception e) {
//			System.out.println(e);
//
//		} finally {
//			try {
//				conn.close();
//				stmt.close();
//
//			} catch (Exception ignored) {
//
//			}
//		}
//
//		return md;
//	}

}