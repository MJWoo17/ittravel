package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import dto.FAQ_MD;
import dto.Join_MD;
import dto.N_MD;
import dto.PROD_MD;
import dto.QNA_MD;

import vo.ProdInfo;

public class N_controller {
	
	Connection conn = null;
	Statement stmt = null;
	
		
	public N_controller() {  //생성자 
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(Exception e)
		{
			
		}
	}
	
	public void conn() { //연결 메소드

		try{

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamproject?useUnicode=true&characterEncoding=utf8","root","1234");		
			
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
	
public void not_insert(N_MD md) {	 //select 메소드, 리턴 해서 반환값이 list ArrayList<md>해서 void는 못쓰다..		
		
		try { //실행

			conn();
			
			//ResultSet rs = null;
			//rs = stmt.executeQuery("SELECT MAX(num) From notice");
			
			//int num = 1;			
			//if(rs.next()) {
			//	num = rs.getInt(1)+1;
			//}
			
			int not_num = 0 ;
			
			Date currentDate = new Date();
			
			java.sql.Date not_date = new java.sql.Date(currentDate.getTime());
			md.setNot_date(not_date.toString());
			
			String not_title = md.getNot_title();
			String not_con = md.getNot_con();
			String not_writer = md.getNot_writer();
			
			int not_view = md.getNot_view();
			//System.out.println(title);
			
			String ss = String.format("insert into notice_info values ( %s ,'%s','%s','%s','%s', %s )",not_num,not_title,not_con,not_date,not_writer,not_view);
			System.out.println(not_view);
			
			int rowNum = stmt.executeUpdate(ss);
			if(rowNum <1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다");
			}
			
			System.out.println("됐냥??");
		}
			
			catch(Exception e) {	//예외처리
				
				System.out.println(e);	
				//System.out.println(qnamng.getPostdate());
				System.out.println("아 한글이 나오긴 하는구나");
				
				
			}finally{
				
				diconn(); //데이터베이스 연결 종료
			}
	}

public ArrayList<N_MD> select() {
	
	conn();
	ArrayList<N_MD> N_list = new ArrayList<> ();
	
	try {
		
		ResultSet rs = stmt.executeQuery("select*from notice_info;");
		
		while(rs.next()) {
			
			N_MD n_list = new N_MD();
			
			n_list.setNot_num(rs.getInt("not_num"));
			n_list.setNot_title(rs.getString("not_title"));
			//n_list.setPw(rs.getString("pw"));
			n_list.setNot_con(rs.getString("not_con"));
			n_list.setNot_writer(rs.getString("not_writer"));
			n_list.setNot_date(rs.getString("not_date"));
			n_list.setNot_view(rs.getInt("not_view"));
			
			N_list.add(n_list); //arraylist에 한 줄 저장 함.		
			
			
		}
		
		
	}catch (Exception e) {
		System.out.println("외않되");
		
		// TODO: handle exception
		
	}finally {
		
		diconn();
		
	}
	return N_list;
	
}

public N_MD selectone(String i) { /*N_view에서 받아온 String iii 값을 새로 정의한다. 똑같이 맞춰줘도 되는데, 값을 새로 정의할 수 있다는 걸 표시하기 위해서 일부러 다르게 줬다. 
												값은 이동이 되지만 변수명은 그 메소드 안에서만 활용된다. 그래서 다르게 줘도 됨. !값은 이동된거임! */
	//num을 받아와서 String i라는 변수로 다시 정했다. 
	
	conn();	
	N_MD n_list = new N_MD();
	
	try {
		
		ResultSet rs = stmt.executeQuery("select*from notice_info where not_num= '"+ i +"' ;"); //num값을 String i으로 받았기 때문에 i를 쓴다. 
		
		if(rs.next()) { //rs의 next가 있으면 
			n_list.setNot_num(rs.getInt("not_num"));
			n_list.setNot_title(rs.getString("not_title"));
			//n_list.setPw(rs.getString("pw"));
			n_list.setNot_con(rs.getString("not_con"));
			n_list.setNot_writer(rs.getString("not_writer"));
			n_list.setNot_date(rs.getString("not_date"));
			n_list.setNot_view(rs.getInt("not_view"));
		}
			//N_list.add(n_list); //arraylist에 한 줄 저장 함.		

		
		
	}catch (Exception e) {
		System.out.println(e);
		
		// TODO: handle exception
		
	}finally {
		
		diconn();
		
	}
	return n_list;
	
}


public void not_update(String i, String ii , String iii) {
	conn();
	
	try { //실행

		//System.out.println(i);
		//System.out.println(ii);
	//	System.out.println(iii);
		//System.out.println(iiii);
		
		//String ss = String.format("update notice set title= '" + i + "', con= '" + ii + "', n_view = '" + iiii +"' where num= '"+ iii +"' ;"  );
		String ss = String.format("update notice_info set not_title= '" + i + "', not_con= '" + ii + "' where not_num= '"+ iii +"' ;"  );
		
		System.out.println(ss);
		
		int rowNum = stmt.executeUpdate(ss);
		if(rowNum <1) {
			throw new Exception("데이터를 DB에 입력할 수 없습니다");
		}
		
		System.out.println("됐냥??");
	
	}
		
		catch(Exception e) {	//예외처리
			
			System.out.println(e);	
			//System.out.println(qnamng.getPostdate());
			System.out.println("아 한글이 나오긴 하는구나 여기인가");
			
			
		}finally{
			
			diconn(); //데이터베이스 연결 종료
		}

	
	
}

public Integer update_view (String num) {
	
	conn();
	
	int n_view = 0 ;
	
	try { //실행
		
		
		ResultSet rs = stmt.executeQuery("select*from notice_info where not_num= '"+ num +"' ;");
		// 글번호가 num인 데이터들을 select한다. 
		
		
		if(rs.next()) {
			int vv = rs.getInt("not_view"); //rs에 저장된 int 이름이 not_veiw인 것을 int vv라고 정한다. 
										  //이 ("not_view")는 필드명으로 지정한 것으로 하는 것인가?? 어디서 저한 name이지??!
			
			n_view = vv + 1; //가져온 조회수에 1을 더하여 조회수값에 저장한다. 
			
		}
		
		//System.out.println(n_view);
		
		String ss = String.format("update notice_info set not_view= '" + n_view + "' where not_num= '"+ num +"' ;"  ); //글번호가 num인 레코드를 조회수 n_view로 수정한다.  
		
		System.out.println(ss);
		
		int rowNum = stmt.executeUpdate(ss);
		
		if(rowNum <1) {
			throw new Exception("데이터를 DB에 입력할 수 없습니다");
		}
		
		System.out.println("됐냥??");
	
	}
		
		catch(Exception e) {	//예외처리
			
			System.out.println(e);	
			//System.out.println(qnamng.getPostdate());
			System.out.println("조회수 수정 결과 저장이,,,");
						
		}finally{
			
			diconn(); //데이터베이스 연결 종료
		}
	return n_view;
	
}

public void N_delete(String not_num) { //delete 메소드,반환값이 없어 void...


	try{ //실행
		
		conn();

		stmt.executeUpdate("delete from notice_info where not_num='"+ not_num +"';"); 
		
	}
		catch(Exception e) {			
			
		}finally{
			
				diconn(); //데이터베이스 연결 종료
		}			
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

public void Q_insert(QNA_MD md) {	 //select 메소드, 리턴 해서 반환값이 list ArrayList<md>해서 void는 못쓰다..		
	
	try { //실행

		conn();

		int qna_num = 0 ; //문의 번호 //여기서 하는 거 맞음
		
		String qna_fil = md.getQna_fil(); //문의 카테고리
		String qna_title = md.getQna_title(); //문의 제목
		String qna_con = md.getQna_con(); //문의 내용
		String qna_img = md.getQna_img(); //문의 첨부파일
		String qna_reply = "답변대기"; //답변 상황 - 답변대기 or 답변완료 >이제 등록해서 그냥 답변대기로 설정해놓음
		String qna_open = md.getQna_open();
		String qna_mem_id = md.getQna_mem_id(); //문의한 아이디 

		Date currentDate = new Date();
		java.sql.Date qna_date = new java.sql.Date(currentDate.getTime()); //문의일
		
		//큐엔에이 8개 넣어야 함.
		
		String ss = String.format("insert into qna_info values ( %s ,'%s','%s','%s','%s','%s','%s','%s','%s' )",qna_num, qna_fil ,qna_title, qna_con,qna_img, qna_date,qna_reply,qna_open,qna_mem_id);
		
		int rowNum = stmt.executeUpdate(ss);
		if(rowNum <1) {
			throw new Exception("데이터를 DB에 입력할 수 없습니다");
		}
		
		System.out.println("됐냥??");
	}
		
		catch(Exception e) {	//예외처리
			
			System.out.println(e);	
			//System.out.println(qnamng.getPostdate());
			System.out.println("아 한글이 나오긴 하는구나");
			
			
		}finally{
			
			diconn(); //데이터베이스 연결 종료
		}
}

public ArrayList<QNA_MD> Q_select() {

conn();
ArrayList<QNA_MD> N_list = new ArrayList<> ();

try {
	
	ResultSet rs = stmt.executeQuery("select*from qna_info;");
	
	while(rs.next()) {
		
		QNA_MD n_list = new QNA_MD();
		
		n_list.setQna_num(rs.getInt("qna_num"));
		n_list.setQna_fil(rs.getString("qna_fil"));
		n_list.setQna_title(rs.getString("qna_title"));
		//n_list.setPw(rs.getString("pw"));
		n_list.setQna_con(rs.getString("qna_con"));
		n_list.setQna_img(rs.getString("qna_img"));
		n_list.setQna_date(rs.getString("qna_date"));
		n_list.setQna_reply("답변대기");
		n_list.setQna_open(rs.getString("qna_open"));
		n_list.setQna_mem_id(rs.getString("qna_mem_id"));
		
		
		N_list.add(n_list); //arraylist에 한 줄 저장 함.		
		
		
	}
	
	
}catch (Exception e) {
	System.out.println("외않되");
	
	// TODO: handle exception
	
}finally {
	
	diconn();
	
}
return N_list;

}

public ArrayList<QNA_MD> Q_select_by_date(String start_date, String end_date) throws SQLException {
	
    //Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ArrayList<QNA_MD> Q_date = new ArrayList<QNA_MD>();

    try {
    	
        conn();
        
        String sql = "SELECT * FROM qna_info WHERE qna_date BETWEEN ? AND ?";
        //sql에는 " select*from ~~ " 위 문장 자체가 들어가 있다. 결과값 들어가있는 거 아님. mbc님과 지금까지 해왔던 거랑 다른 구조(?)임.
        //System.out.println(sql); //이해안되면 주석풀어서 확인해봐.
        
        pstmt = conn.prepareStatement(sql);
        // 'prepareStatement()'는 SQL 쿼리문을 미리 컴파일하여 PreparedStatement 객체를 생성하는 메소드입니다. 
        //아래는 pstmt에 저장된 값.
        
        //com.mysql.jdbc.JDBC42PreparedStatement@7d5e9eab: SELECT * FROM qna_info WHERE qna_date BETWEEN ** NOT SPECIFIED ** AND ** NOT SPECIFIED **
        
        System.out.println(pstmt);
        
        pstmt.setString(1, start_date);
        pstmt.setString(2, end_date);
        
        rs = pstmt.executeQuery(); 
        
        while (rs.next()) {
        	
            QNA_MD qna = new QNA_MD();
            qna.setQna_num(rs.getInt("qna_num"));
            qna.setQna_fil(rs.getString("qna_fil"));
            qna.setQna_title(rs.getString("qna_title"));
            qna.setQna_con(rs.getString("qna_con"));
            qna.setQna_date(rs.getString("qna_date"));
            qna.setQna_mem_id(rs.getString("qna_mem_id"));
            qna.setQna_open(rs.getString("qna_open"));
            qna.setQna_reply(rs.getString("qna_reply"));
            
            Q_date.add(qna);
        }
        
    } catch (SQLException e) {
    	
        e.printStackTrace();
        
    } finally {
    	
    	diconn();
    }
    return Q_date;
}


public QNA_MD Q_selectone(String i) { /*N_view에서 받아온 String iii 값을 새로 정의한다. 똑같이 맞춰줘도 되는데, 값을 새로 정의할 수 있다는 걸 표시하기 위해서 일부러 다르게 줬다. 
											값은 이동이 되지만 변수명은 그 메소드 안에서만 활용된다. 그래서 다르게 줘도 됨. !값은 이동된거임! */
//num을 받아와서 String i라는 변수로 다시 정했다. 

conn();	
QNA_MD n_list = new QNA_MD();

try {
	
	ResultSet rs = stmt.executeQuery("select*from qna_info where qna_num= '"+ i +"' ;"); //num값을 String i으로 받았기 때문에 i를 쓴다. 
	
	if(rs.next()) { //rs의 next가 있으면 
		n_list.setQna_num(rs.getInt("qna_num"));
		n_list.setQna_title(rs.getString("qna_title"));
		//n_list.setPw(rs.getString("pw"));
		n_list.setQna_con(rs.getString("qna_con"));
		n_list.setQna_mem_id(rs.getString("qna_mem_id"));
		n_list.setQna_open(rs.getString("qna_open"));
		n_list.setQna_date(rs.getString("qna_date"));
		//n_list.set_view(rs.getInt("not_view"));

	}
		//N_list.add(n_list); //arraylist에 한 줄 저장 함.		

	
	
}catch (Exception e) {
	System.out.println(e);
	
	// TODO: handle exception
	
}finally {
	
	diconn();
	
}
return n_list;

}


public void Q_update(String i, String ii , String iii) {
conn();

try { //실행

	String ss = String.format("update qna_info set qna_title= '" + i + "', qna_con= '" + ii + "' where qna_num= '"+ iii +"' ;"  );
	
	System.out.println(ss);
	
	int rowNum = stmt.executeUpdate(ss);
	if(rowNum <1) {
		throw new Exception("데이터를 DB에 입력할 수 없습니다");
	}
	
	System.out.println("됐냥??");

}
	
	catch(Exception e) {	//예외처리
		
		System.out.println(e);	
		//System.out.println(qnamng.getPostdate());
		System.out.println("아 한글이 나오긴 하는구나 여기인가");
		
		
	}finally{
		
		diconn(); //데이터베이스 연결 종료
	}

}



////////////////////////////////////////////////////////////////////////////////////////////////////////////

public ArrayList<FAQ_MD> F_select() {

conn();
ArrayList<FAQ_MD> N_list = new ArrayList<> ();

try {
	
	ResultSet rs = stmt.executeQuery("select*from faq_info;");
	
	while(rs.next()) {
		
		FAQ_MD n_list = new FAQ_MD();
		
		n_list.setFaq_num(rs.getInt("faq_num"));
		n_list.setFaq_title(rs.getString("faq_title"));
		n_list.setFaq_con(rs.getString("faq_con"));
		n_list.setFaq_view(rs.getInt("faq_view"));
		
		N_list.add(n_list); //arraylist에 한 줄 저장 함.		

	}
	
	}catch (Exception e) {
		System.out.println("외않되");
		
		// TODO: handle exception
		
	}finally {
		
		diconn();
		
	}
	return N_list;

}

public ArrayList<FAQ_MD> F_search(String faq_search) {

	conn();
	ArrayList<FAQ_MD> F_list = new ArrayList<> ();
	
	try {
		
		//ResultSet rs = stmt.executeQuery("select faq_title,faq_con from faq_info;");
		//faq에 제목이랑 내용만 셀렉한다.
		
		// 검색어를 포함한 faq_title 또는 faq_con을 검색하는 쿼리입니다.
			String query = "SELECT faq_title, faq_con FROM faq_info WHERE faq_title LIKE '%" + faq_search + "%' OR faq_con LIKE '%" + faq_search + "%'";
			ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			
			FAQ_MD f_list = new FAQ_MD();
			
			//F_list.setFaq_num(rs.getInt("faq_num"));
			f_list.setFaq_title(rs.getString("faq_title"));
			f_list.setFaq_con(rs.getString("faq_con"));
			
			F_list.add(f_list); 	
	
		}
		
	}catch (Exception e) {
		System.out.println("외않되");
		
		// TODO: handle exception
		
	}finally {
		
		diconn();
		
	}
	return F_list;

}

public Integer F_viewcount (String faq_num) {
	
	conn();
	
	int f_view = 0 ;
	
	try { //실행

		ResultSet rs = stmt.executeQuery("select*from faq_info where faq_num= '"+ faq_num +"' ;");
		// 글번호가 num인 데이터들을 select한다. 
		
		if(rs.next()) {
			int vv = rs.getInt("faq_view"); //rs에 저장된 int 이름이 not_veiw인 것을 int vv라고 정한다. 
										  //이 ("not_view")는 필드명으로 지정한 것으로 하는 것인가?? 어디서 저한 name이지??!
			f_view = vv + 1; //가져온 조회수에 1을 더하여 조회수값에 저장한다. 	
		}

		String ss = String.format("update faq_info set faq_view= '" + f_view + "' where faq_num= '"+ faq_num +"' ;"  ); //글번호가 num인 레코드를 조회수 n_view로 수정한다.  
		
		System.out.println(ss);
		
		int rowNum = stmt.executeUpdate(ss);
		
		if(rowNum <1) {
			throw new Exception("데이터를 DB에 입력할 수 없습니다");
		}
		System.out.println("됐냥??");
	
	}
		
		catch(Exception e) {	//예외처리
			
			System.out.println(e);	
			System.out.println("조회수 수정 결과 저장이,,,");
						
		}finally{
			
			diconn(); //데이터베이스 연결 종료
		}
	return f_view;
	
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

public void join_insert(Join_MD md) {	 //select 메소드, 리턴 해서 반환값이 list ArrayList<md>해서 void는 못쓰다..		
	
	try { //실행

		conn();
		
		String mem_id = md.getMem_id();
		String mem_pw = md.getMem_pw();
		String mem_name = md.getMem_name();
		String mem_nick = md.getMem_nick();
		String mem_email = md.getMem_email1() +"@" + md.getMem_email1();
		String mem_addr ="(우:" + md.getPostal_code() + ")" + md.getAddr() + md.getExtra_addr() + "(" + md.getRefer_addr() +")";
		String mem_mobile = md.getMem_mobile1() + "-"+ md.getMem_mobile2() +"-" +md.getMem_mobile3();
		String mem_sex = md.getMem_sex();
		String mem_birth = md.getMem_birthyear() + md.getMem_birthmonth() +md.getMem_birthday();
		String mem_news = md.getMem_news();
		//String mem_join = md.getMem_join();
		
		Date currentDate = new Date();		
		java.sql.Date mem_join = new java.sql.Date(currentDate.getTime());
		md.setMem_join(mem_join.toString());
				
		String ss = String.format("insert into mem_account values ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')",mem_id,mem_pw,mem_name,	mem_nick,mem_email,mem_addr,mem_mobile,mem_sex,mem_birth,mem_news,mem_join);
					 
		System.out.println(ss);
		
		int rowNum = stmt.executeUpdate(ss);
		if(rowNum <1) {
			throw new Exception("데이터를 DB에 입력할 수 없습니다");
		}
		
		System.out.println("됐냥??");
	
	}
		
		catch(Exception e) {	//예외처리
			
			System.out.println(e);	
			//System.out.println(qnamng.getPostdate());
			System.out.println("회원가입 왜 안되냥??");
			
			
		}finally{
			
			diconn(); //데이터베이스 연결 종료
		}
}

public Join_MD login(String mem_id, String mem_pw) {
	
	String idd;
	String pww;
	String nick;
	
	Join_MD md = new Join_MD();
	
	try {	
			conn();
		    ResultSet rs = stmt.executeQuery("select * from mem_account where mem_id ='"+ mem_id + "';");
		    
		    //rs에는 select문으로 가져온 값이 저장된다. select문은 데이터베이스에 이미 존재해야 select된다.
		    //mem_account테이블에 입력받은 아이디 값과 같은 값이 있다면 그 레코드를 select한다. 
		    //select한 값을 rs에 저장한다. 
		    //rs는 말그대로 로그인창에서 입력받은 값이기 때문에, 값이 데이터베이스에 존재하지 않을 경우 로그인이 안 된다. 값이 데이터베이스에 존재하면 로그인이 되는거임!
		    //입력받은 아이디가 데이터베이스에 존재하지않으면 , rs에 저장자체가 되지않는다. 
		    
		    if(rs.next()) { //rs에 저장된 값의 다음이 있다면.. (입력받은 아이디가 데이터베이스에 존재하여 저장이 되었다면, 다음이 있는거임.)
		    	
		    	idd = rs.getString("mem_id"); //rs에 저장되어있는, 입력받은 값(mem_id)을 id로 이름 지었다.
		    	pww = rs.getString("mem_pw"); //rs에 저장된 값 중 "mem_pw"인 값을 pw로 이름 지었다.
		    	nick = rs.getString("mem_nick");
		    	
			    //id와 pw가 mem_accoun에 저장되어있는 데이터들과 값이 같은지 비교하기
			    if(idd.equals(mem_id)&&(pww.equals(mem_pw))) {		    	
			    	
			    	md.setMem_nick(nick);
			    	md.setMem_id(idd);
			    	
			    	System.out.println(nick);
			    	System.out.println(md.getMem_nick());
			    	System.out.println("여기서 나오는건가");
				
			    } else {
			    	System.out.println("닉네임 왜 안나오지??");
			    	
			    }
			    
		    }		    
		    
	    }
	
	catch (Exception e) {
		System.out.println(e);

	}
	finally {
			try {					
				conn.close();
				stmt.close();
				
			} catch (Exception ignored) {
					
			}
		}
	
	return md;	
}

///////////////////////////////////////끝///////////////////////////////////////

public ArrayList<ProdInfo> Prod_info() { //페이지에서 각 제품을 선택하면 보여지는 상세페이지의 데이터들.

	conn();
	ArrayList<ProdInfo> P_list = new ArrayList<> ();
	
	try {
		
		//ResultSet rs = stmt.executeQuery("select faq_title,faq_con from faq_info;");
		//faq에 제목이랑 내용만 셀렉한다.
		
		// 검색어를 포함한 faq_title 또는 faq_con을 검색하는 쿼리입니다.
			String query = "SELECT * from prod_info ";
			
			ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()) {
			
			ProdInfo p_list = new ProdInfo();
			
			p_list.setProd_num(rs.getInt("prod_num"));
			p_list.setProd_bigct(rs.getString("prod_bigct"));;
			p_list.setProd_smallct(rs.getString("prod_smallct"));
			p_list.setProd_quantity(rs.getInt("prod_quantity"));
			p_list.setProd_price(rs.getInt("prod_price"));
			p_list.setProd_total_price(rs.getInt("prod_total_price"));
			p_list.setProd_img(rs.getString("prod_img"));
			p_list.setProd_review(rs.getString("prod_review"));
			p_list.setProd_qna(rs.getString("prod_qna"));
			p_list.setProd_avg(rs.getInt("prod_avg"));
			p_list.setProd_cou(rs.getInt("prod_cou"));
			p_list.setProd_postdate(rs.getString("prod_postdate"));
			p_list.setProd_name(rs.getString("prod_name"));
			p_list.setProd_opbct(rs.getString("prod_opbct"));
			p_list.setProd_opsct(rs.getString("prod_opsct"));
			p_list.setProd_check(rs.getString("prod_check"));
			p_list.setProd_mem_id(rs.getString("prod_mem_id"));
			
			P_list.add(p_list);
			
		}
		
	}catch (Exception e) {
		System.out.println("외않되");
		
		// TODO: handle exception
		
	}finally {
		
		diconn();
		
	}
	return P_list;

}

public ProdInfo Prod_order_info(ProdInfo pr) { //상세페이지에서 수량, 옵션 등등..을 선택하고 장바구니, 결제하기 페이지로 보낼 데이터들.
	
	conn();
	ProdInfo p_list = new ProdInfo();
	
	try {
		
		String query = "SELECT * from prod_info ";
		
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()) {
					
			
			p_list.setProd_num(rs.getInt("prod_num"));
			p_list.setProd_bigct(rs.getString("prod_bigct"));;
			p_list.setProd_smallct(rs.getString("prod_smallct"));
			p_list.setProd_quantity(rs.getInt("prod_quantity"));
			p_list.setProd_price(rs.getInt("prod_price"));
			p_list.setProd_total_price(rs.getInt("prod_total_price"));
			p_list.setProd_img(rs.getString("prod_img"));
			//p_list.setProd_review(rs.getString("prod_review"));
			//p_list.setProd_qna(rs.getString("prod_qna"));
			//p_list.setProd_avg(rs.getInt("prod_avg"));
			//p_list.setProd_cou(rs.getInt("prod_cou"));
			//p_list.setProd_postdate(rs.getString("prod_postdate"));
			p_list.setProd_name(rs.getString("prod_name"));
			p_list.setProd_opbct(rs.getString("prod_opbct"));
			p_list.setProd_opsct(rs.getString("prod_opsct"));
			p_list.setProd_check(rs.getString("prod_check"));
			p_list.setProd_mem_id(rs.getString("prod_mem_id"));
			
		}
		
		
	}catch (Exception e) {
		System.out.println("외않되");
		
		// TODO: handle exception
		
	}finally {
		
		diconn();
		
	}
	return p_list;
	
}

//public ArrayList<PROD_MD> Prod_qnacount(String qnacon) {
//
//	conn();
//	ArrayList<PROD_MD> P_list = new ArrayList<> ();
//	
//	try {
//		
//		//ResultSet rs = stmt.executeQuery("select faq_title,faq_con from faq_info;");
//		//faq에 제목이랑 내용만 셀렉한다.
//		
//		// 검색어를 포함한 faq_title 또는 faq_con을 검색하는 쿼리입니다.
//			String query = "SELECT prod_qna FROM prod_info" ;
//			ResultSet rs = stmt.executeQuery(query);
//		
//		while(rs.next()) {
//			
//			PROD_MD p_list = new PROD_MD();
//
//			p_list.setProd_qna(rs.getString("prod_qna"));
//			
//			P_list.add(p_list); 	
//	
//		}
//		
//	}catch (Exception e) {
//		System.out.println("외않되");
//		
//		// TODO: handle exception
//		
//	}finally {
//		
//		diconn();
//		
//	}
//	return P_list;
//
//}

}