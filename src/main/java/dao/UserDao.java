package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Set;

import javax.websocket.Session;

import dto.Joininfo;

import java.sql.PreparedStatement;


public class UserDao {

	Connection conn;
	ResultSet rs;
	
	public UserDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/teamproject?useUnicode=true&characterEncoding=utf8";
			String dbID = "root";
			String dbPW = "1234";
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인 가능 유무
	public int login(String mem_id, String mem_pw) {
	    String SQL = "select mem_pw from mem_account where mem_id = ? ";
	 
	    try {
	        PreparedStatement pstat = conn.prepareStatement(SQL);
	        pstat.setString(1, mem_id);
	        rs = pstat.executeQuery();

	        if(rs.next()) {
	        	if(rs.getString(1).equals(mem_pw)) {
	        		return 1; // 로그인 성공
	        	} else
	        		return 0;
	        }
	        return -1;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return -2;
	}
	
	//닉네임을 헤더에 세션 저장
	public Joininfo loginsession(String mem_id) {
		
		
		Joininfo joininfo = new Joininfo() ;
		
//		String nick = "";
//		String name = "";
		

		String SQL = "select mem_nick, mem_name, mem_mobile, mem_addr  from mem_account where mem_id= ? ";  //이 전체 문장 자체를 저장한거임. 
		
		try {
			
			PreparedStatement pstat = conn.prepareStatement(SQL);
			pstat.setString(1, mem_id);
			
			rs = pstat.executeQuery(); //여기에 로그인 된 mem_id의 레코드가 저장된거임.
			
			if(rs.next()) {
				
				String nick = rs.getString("mem_nick"); //그래서 rs에 mem_nick을 nick으로 저장함.
				String name = rs.getString("mem_name");
				String mobile = rs.getString("mem_mobile");
				String addr = rs.getString("mem_addr");
				
				joininfo.setMem_nick(nick);
				joininfo.setMem_name(name);
				joininfo.setMem_mobile(mobile);
				joininfo.setMem_addr(addr);
				
				
//				System.out.println(mobile);
//				System.out.println(addr);
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return joininfo; 
	}
	
	// 회원가입 insert 정보입력
	public int join(Joininfo info) {
		
		int rowNum = 0;
		
		String SQL = "insert into mem_account values(?,?,?,?,?,?,?,?,?,?,NOW())"; 
		
		try {
			
			PreparedStatement pstat = conn.prepareStatement(SQL);
			
			String ord_addr1 = info.getMem_addr1();
			String ord_addr2 = info.getMem_addr2();
			String ord_addr3 = info.getMem_addr3();
			String ord_addr4 = info.getMem_addr4();
			
			pstat.setString(1, info.getMem_id()); //아이디
			pstat.setString(2, info.getMem_pw()); //비번
			pstat.setString(3, info.getMem_name()); //이름
			pstat.setString(4, info.getMem_nick()); //닉네임
			pstat.setString(5, info.getMem_email1()+info.getMem_email2()); //이메일
			pstat.setString(6, info.getMem_addr1()+"/"+ info.getMem_addr2()+"/"+ info.getMem_addr3() + "/" + info.getMem_addr4()); //주소
//			pstat.setString(6,"우편번호 : "+ info.getMem_addr1()+" / 도로명 주소 : "+ info.getMem_addr2()+" / 상세 주소 : "+ info.getMem_addr3() + " /(참고 :" + info.getMem_addr4() +")"); //주소
			pstat.setString(7, info.getMem_mobile0()+" / "+info.getMem_mobile1()+ " - "+info.getMem_mobile2()+ " - "+info.getMem_mobile3()); //전화번호
			pstat.setString(8, info.getMem_sex()); //성별
			pstat.setString(9, info.getMem_birth1()+ info.getMem_birth2()+ info.getMem_birth3()); //생년월일
			pstat.setString(10, info.getMem_news()); //소식받기
			
			System.out.println(info.getMem_mobile1());
			System.out.println(ord_addr1);
			System.out.println(ord_addr2);
			System.out.println(ord_addr3);
			System.out.println(ord_addr4 + "     여기까아쥐" );
			
			
			rowNum = pstat.executeUpdate();
			
			if(rowNum > 0) {
				
				throw new Exception("signup success");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return rowNum;
	}
	
	// 아이디 중복확인
	public boolean idch(String mem_id) {
		

	        boolean result = false;

	        try {

	            String sql = "SELECT * FROM mem_account WHERE mem_id=?";
	            PreparedStatement pstat = conn.prepareStatement(sql);
	            pstat.setString(1, mem_id);
	            rs = pstat.executeQuery();

	            if (rs.next()) {
	                // 이미 존재하는 경우
	                result = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return result;
	    
	}
	
	
}

