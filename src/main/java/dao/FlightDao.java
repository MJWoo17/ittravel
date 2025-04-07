package dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dto.Airinfo;
import dto.Cominfo;

import java.sql.Connection;


public class FlightDao {
	Connection conn;
	ResultSet rs;
	
	public FlightDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3306/teamproject?useUnicode=true&characterEncoding=euc-kr";
			String dbID = "root";
			String dbPW = "eogkrrksek!1";
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 출발지 선택
	public Vector<Airinfo> pt(Airinfo airinfo) {
	    String SQL = "SELECT * FROM air_inquiry WHERE air_deppt = ? AND air_arrpt = ? AND air_dday = ?";
	    Vector<Airinfo> list1 = new Vector<Airinfo>();
	    try {
	        PreparedStatement pstat = conn.prepareStatement(SQL);
	        pstat.setString(1, airinfo.getAir_deppt());
	        pstat.setString(2, airinfo.getAir_arrpt());
	        pstat.setString(3, airinfo.getAir_dday());
	        
	        rs = pstat.executeQuery(); // ResultSet 객체 생성
	        while(rs.next()) {
	            Airinfo ai = new Airinfo();
	            ai.setAir_num(rs.getInt(1));
	            ai.setAir_deppt(rs.getString(2));
	            ai.setAir_dday(rs.getString(3));
	            ai.setAir_arrpt(rs.getString(4));
	            ai.setAir_aday(rs.getString(5));
	            ai.setAir_model(rs.getString(6));
	            ai.setAir_fligname(rs.getString(7));
	            ai.setAir_dday_time(rs.getTime(8));
	            ai.setAir_aday_time(rs.getTime(9));
	            ai.setAir_time_minute(rs.getInt(10));
	            ai.setAir_price(rs.getInt(11));
	            list1.add(ai);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list1;
	}
	
	public Vector<Airinfo> getList(int pageNumber){

	    // 조회된 기준 air_num으로 내림차순하여 pageNumber에 해당하는 10개의 항공편을 보여주는 쿼리 
	    String SQL = "SELECT * FROM air_inquiry"
	            + " WHERE air_num < ? ORDER BY air_num LIMIT 10 OFFSET ?";
	         
	    Vector<Airinfo> list1 = new Vector<Airinfo>();
	         
	    try {
	        PreparedStatement pstat = conn.prepareStatement(SQL);
	        pstat.setInt(1, getNext() - (pageNumber - 1 ) * 10);
	        pstat.setInt(2, (pageNumber - 1) * 10);
	        rs = pstat.executeQuery();
	        while (rs.next()) {
	            Airinfo ai = new Airinfo();
	            ai.setAir_num(rs.getInt(1));
	            ai.setAir_deppt(rs.getString(2));
	            ai.setAir_dday(rs.getString(3));
	            ai.setAir_arrpt(rs.getString(4));
	            ai.setAir_aday(rs.getString(5));
	            ai.setAir_model(rs.getString(6));
	            ai.setAir_fligname(rs.getString(7));
	            ai.setAir_dday_time(rs.getTime(8));
	            ai.setAir_aday_time(rs.getTime(9));
	            ai.setAir_time_minute(rs.getInt(10));
	            ai.setAir_price(rs.getInt(11));
	            list1.add(ai);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list1; 
	}
	
    public int getNext(){
    	
        String SQL = "select air_num from air_inquiry order by air_num DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
        try {
        	PreparedStatement pstat = conn.prepareStatement(SQL);
            rs = pstat.executeQuery();
            if(rs.next()) {
                return rs.getInt(1) + 1; // 그 다음 게시글의 번호
            }
            return 1; // 첫 번째 게시물인 경우
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}
