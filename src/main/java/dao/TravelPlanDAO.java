package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.sql.DataSource;

import dto.TravelSchDTO;
import dto.TravelDTO;
import vo.Travel_LocInfoVO;
import vo.TravelMasterVO;
import vo.TravelPlanVO;
import vo.TravelSchMngVO;

public class TravelPlanDAO {

	DataSource ds;
	Connection con;
	private static TravelPlanDAO travelDTODAO;

	private TravelPlanDAO() {
	}

	public static TravelPlanDAO getInstance(){
		if(travelDTODAO == null){
			travelDTODAO = new TravelPlanDAO();
		}
		return travelDTODAO;
	}

	public void setConnection(Connection con){
		this.con = con;
	}
		
	public ArrayList<TravelPlanVO> selectCityList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String travelDTO_list_sql="select city_num, city_name, city_eng, city_con from city_info";
		ArrayList<TravelPlanVO> selectCityList = new ArrayList<TravelPlanVO>();
		TravelPlanVO travelDTO = null;

		try{
			pstmt = con.prepareStatement(travelDTO_list_sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				travelDTO = new TravelPlanVO();
				travelDTO.setCity_num(rs.getInt("city_num"));
				travelDTO.setCity_name(rs.getString("city_name"));
				travelDTO.setCity_eng(rs.getString("city_eng"));
				travelDTO.setCity_con(rs.getString("city_con"));
				selectCityList.add(travelDTO);
				}

		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return selectCityList;

	}
	
	public ArrayList<String> getDatesBetween(String startDate, String endDate) {
	    ArrayList<String> dates = new ArrayList<>();
	    LocalDate start = LocalDate.parse(startDate);
	    LocalDate end = LocalDate.parse(endDate);
	    System.out.println(start);
	    System.out.println(end);
	    for (LocalDate date = start; date.isBefore(end.plusDays(1)); date = date.plusDays(1)) {
	        dates.add(date.toString());
	    }
	    return dates;
	}
	
	public int insertTravelMaster(TravelDTO article){
 		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		int insertCount = 0;

		try{
			sql = "SELECT max(tra_num)+1 as tra_num FROM tra_master";			
	        pstmt = con.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        int num = 0;
	        while(rs.next()){				
	        	num = rs.getInt("tra_num");
	        }
			
			sql = "INSERT INTO tra_master (tra_num, tra_mem_id, tra_title, tra_dday, tra_aday, tra_ppl, tra_city_num, tra_city) "
				      + "SELECT ?, ?, ?, ?, ?, ?, city_num, city_name "  // 물음표(?) 추가
				      + "FROM city_info "
				      + "WHERE city_name = ?";
			System.out.println("dfsdf");
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getTra_mem_id());
			pstmt.setString(3, article.getTra_title());
			pstmt.setString(4, article.getTra_dday());
			pstmt.setString(5, article.getTra_aday());
			pstmt.setInt(6, article.getTra_ppl());
			//pstmt.setInt(7, article.getTra_city_num());
			pstmt.setString(7, article.getTra_city());
			
			insertCount = pstmt.executeUpdate();			
			
//			sql = "SELECT tra_dday, tra_aday FROM tra_master where tra_num = ?";		        
//		        pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, tra_num);
//		        rs = pstmt.executeQuery();
//		        if(rs.next()){
//		            tra_num = rs.getInt(1);
//		            System.out.println(tra_num);
//		            // sch_manage 테이블에 추가할 데이터를 생성
//		            List<String> sch_days = getDatesBetween(article.getTra_dday(), article.getTra_aday());
//		            for(String dates : sch_days){
//		                sql = "INSERT INTO sch_manage (sch_tra_num, sch_day) VALUES (?, ?)";
//		                pstmt = con.prepareStatement(sql);
//		                pstmt.setInt(1, tra_num);
//		                pstmt.setString(2, dates);
//		                insertCount += pstmt.executeUpdate();
//		            }
//		        }
		}catch(Exception ex){
			 ex.printStackTrace(); // 오류 발생 시 콘솔에 오류 메시지 출력
		}finally{
			close(rs);
			close(pstmt);
		}
		
		System.out.println("Insert count: " + insertCount);
		
		return insertCount;

	}
	
	
	
	public TravelDTO selectTraMasterList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String traMaster_sql="SELECT tm.tra_num, tm.tra_city, tm.tra_dday, tm.tra_aday, tm.tra_ppl, ci.city_eng\r\n"
				+ "		FROM tra_master tm\r\n"
				+ "		INNER JOIN city_info ci ON tm.tra_city_num = ci.city_num\r\n"
				+ "		WHERE tm.tra_num = (SELECT MAX(tra_num) FROM tra_master)";
		ArrayList<TravelDTO> selectTraMaster = new ArrayList<TravelDTO>();
		TravelDTO travelDTO = null;

		try{
			pstmt = con.prepareStatement(traMaster_sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				travelDTO = new TravelDTO();
				travelDTO.setTra_num(rs.getInt("tm.Tra_num"));
				travelDTO.setTra_dday(rs.getString("tm.tra_dday"));
				travelDTO.setTra_aday(rs.getString("tm.tra_aday"));
				travelDTO.setTra_ppl(rs.getInt("tm.tra_ppl"));
				travelDTO.setTra_city(rs.getString("tm.tra_city"));
				travelDTO.setCity_eng(rs.getString("ci.city_eng"));
				
//				selectTraMaster.add(travelDTO);
				}

		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}

		return travelDTO;

	}
	
	public ArrayList<Travel_LocInfoVO> selectLocList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String LocInfoVO_sql="SELECT * FROM loc_info2";
		ArrayList<Travel_LocInfoVO> selectLocList = new ArrayList<Travel_LocInfoVO>();

		try{
			pstmt = con.prepareStatement(LocInfoVO_sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				
				Travel_LocInfoVO locInfoVO = new Travel_LocInfoVO();
				
				locInfoVO.setLoc2_name(rs.getString("loc2_name"));
				locInfoVO.setLoc2_filter(rs.getString("loc2_filter"));
				locInfoVO.setLoc2_name_lang(rs.getString("loc2_name_lang"));
				locInfoVO.setLoc2_exp(rs.getString("loc2_exp"));
				locInfoVO.setLoc2_addr(rs.getString("loc2_addr"));
				locInfoVO.setLoc2_webp(rs.getString("loc2_webp"));
				locInfoVO.setLoc2_hour(rs.getString("loc2_hour"));

				locInfoVO.setLoc2_phone(rs.getString("loc2_phone"));
				locInfoVO.setLoc2_loc(rs.getString("loc2_loc"));
				locInfoVO.setLoc2_lat(rs.getString("loc2_lat"));
				locInfoVO.setLoc2_lng(rs.getString("loc2_lng"));
				
				selectLocList.add(locInfoVO);				
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		return selectLocList;

	}
	
	
	public ArrayList<TravelSchMngVO> selectSchMng(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSchMng_sql="SELECT sch_day FROM sch_manage WHERE sch_tra_num = (SELECT MAX(sch_tra_num) FROM sch_manage)";
		ArrayList<TravelSchMngVO> selectSchMngList = new ArrayList<TravelSchMngVO>();

		try{
			pstmt = con.prepareStatement(selectSchMng_sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				
				TravelSchMngVO travelSchMngVO = new TravelSchMngVO();		
				travelSchMngVO.setSch_day(rs.getString("sch_day"));

				selectSchMngList.add(travelSchMngVO);
						
			}
		}catch(Exception ex){
		}finally{
			close(rs);
			close(pstmt);
		}

		System.out.println(selectSchMngList);
		
		return selectSchMngList;

	}
	
	
	public int insertSch(TravelSchDTO article){
		PreparedStatement pstmt = null;
		   
	    String sql="";
	    int insertCount = 0;
	    ResultSet rs = null;
	    
	    try {
	    	String selectLoc2NumSql = "SELECT loc2_num FROM loc_info2 WHERE loc2_name = ?";
			pstmt = con.prepareStatement(selectLoc2NumSql);
//			pstmt.setString(1, article.getLoc2_filter());
			pstmt.setString(1, article.getLoc2_name());
//			System.out.println(article.getLoc2_filter());
//			System.out.println(article.getLoc2_name());
			rs = pstmt.executeQuery();
			int loc2_num1 = 0;
			if (rs.next()) {
				loc2_num1 = rs.getInt("loc2_num");
			}

			System.out.println(loc2_num1);
			// sch_loc_num을 삽입하기 위한 쿼리를 먼저 실행합니다.
	        sql = "INSERT INTO sch_manage (sch_tra_num, sch_day, sch_filter, sch_loc_num, sch_pla) "
	        		+ "select ?, ?, ?, ?, loc2_name "
	        		+ "from loc_info2 "
	        		+ "where loc2_name  = ?";

	        pstmt = con.prepareStatement(sql);
//	        System.out.println(article.getSch_day());
	        pstmt.setInt(1, article.getSch_tra_num());
//	        System.out.println(article.getSch_tra_num());
	        pstmt.setString(2, article.getSch_day());
	        pstmt.setString(3, article.getLoc2_filter());
	        System.out.println(article.getLoc2_filter());
//	        pstmt.setString(4, article.getLoc2_name());
	        pstmt.setInt(4, loc2_num1);
	        pstmt.setString(5, article.getLoc2_name());

	        System.out.println();
	        insertCount = pstmt.executeUpdate(); // 첫 번째 호출만 유지합니다.
	        
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
	    System.out.println("Insert count: " + insertCount);
	    return insertCount;
	}
	    
	public ArrayList<TravelSchDTO> selectSchList(TravelSchDTO travelSchDTO) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    ArrayList<TravelSchDTO> travelSchDTOList = new ArrayList<TravelSchDTO>();

	    String traMaster_sql = "SELECT sch_day, sch_filter, loc2_name, sch_tra_num "
	                           + "FROM sch_manage JOIN loc_info2 ON sch_manage.sch_pla = loc_info2.loc2_name "
	                           + "WHERE sch_tra_num = ?";

	    try {
	        pstmt = con.prepareStatement(traMaster_sql);
	        pstmt.setInt(1, travelSchDTO.getSch_tra_num());
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	TravelSchDTO schDTO1 = new TravelSchDTO();
	            schDTO1.setSch_day(rs.getString("sch_day"));
//	            System.out.println(rs.getString("sch_day"));
	            schDTO1.setSch_filter(rs.getString("sch_filter"));
//	            System.out.println(rs.getString("sch_filter"));
	            schDTO1.setSch_pla(rs.getString("loc2_name"));
//	            System.out.println(rs.getString("loc2_name")); 
	            schDTO1.setSch_tra_num(rs.getInt("Sch_tra_num"));
//	            System.out.println(rs.getString("Sch_tra_num")); 

	            travelSchDTOList.add(schDTO1);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return travelSchDTOList;
	}
	





	
	
//	    try{
//	        // sch_loc_num을 삽입하기 위한 쿼리를 먼저 실행합니다.
//	        sql = "INSERT INTO sch_manage (sch_tra_num, sch_day, sch_filnum, sch_pla, sch_loc_num) "
//	        		+ "select ?, ?, loc2_filter, loc2_name "
//	        		+ "from loc_info2 "
//	        		+ "where loc2_filter = ? and loc2_name  = ?";
//
//	        pstmt = con.prepareStatement(sql);
//	        System.out.println(article.getSch_day());
//	        System.out.println(article.getSch_filnum());
//	        pstmt.setInt(1, article.getSch_tra_num());
//	        pstmt.setString(2, article.getSch_day());
//	        pstmt.setInt(3, article.getLoc2_filter());
//	        System.out.println(article.getLoc2_filter());
//	        pstmt.setString(4, article.getLoc2_name());
//	        
//	        System.out.println();
//	        pstmt.executeUpdate();
//	        
//	        insertCount = pstmt.executeUpdate();
//
//	    }catch(Exception ex){
//	         ex.printStackTrace();
//	    }finally{
////	        close(rs);
//	        close(pstmt);
//	    }
//
//	    return insertCount;
//	}
	
	
	
	
}
