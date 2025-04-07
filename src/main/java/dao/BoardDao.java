package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import dto.Cominfo;

public class BoardDao{
	Connection conn;
	ResultSet rs;
	
	public BoardDao() { 
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
	
	// 글쓰기 insert
	public int write(Cominfo info) {
	    String SQL = "INSERT INTO com_info (com_num, com_bct, com_mem_id, com_name, com_con, com_available, com_count, com_date) "
	            + "VALUES (?, ?, ?, ?, ?, 1, 0, NOW())";
	    
	    try {
	        PreparedStatement pstat = conn.prepareStatement(SQL);
	        pstat.setInt(1, getNext());
	        pstat.setString(2, info.getCom_bct());
	        pstat.setString(3, info.getCom_mem_id());
	        pstat.setString(4, info.getCom_name());
	        pstat.setString(5, info.getCom_con());
	        
	        
	        return pstat.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1; // db 오류

	}


    //수정
    public int update(Cominfo info){
            String SQL = "UPDATE com_info SET com_bct = ?,com_mem_id = ?, com_name = ?, com_con = ? WHERE com_num = ?";
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setString(1, info.getCom_bct());
                pstmt.setString(2, info.getCom_mem_id());
                pstmt.setString(3, info.getCom_name());
                pstmt.setString(4, info.getCom_con());
                pstmt.setInt(5, info.getCom_num());
                return pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return -1; // 데이터베이스 오류
        }
    
    // 게시글 삭제
    public int delete(int com_num) {
    	String SQL = "update com_info set com_available = 0 where com_num = ?";
    	
    	try {
    		PreparedStatement pstat = conn.prepareStatement(SQL);
    		pstat.setInt(1, com_num);
    		return pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return -1;
    }
	
	// com_num에 들어갈 숫자 지정
    public int getNext(){
    	
        String SQL = "select com_num from com_info order by com_num DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
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
	
		
	// 선택된 페이지에 해당되는 10개의 게시글을 읽어오도록 함
	public Vector<Cominfo> getList(int pageNumber){
		
		// 조회된 기준 com_num으로 내림차순하여 위에 10개만 보여주는 쿼리 
		 String SQL = "SELECT * FROM com_info"
		 		+ " WHERE com_num < ? AND com_available = 1 ORDER BY com_num DESC LIMIT 10";
		 
		 Vector<Cominfo> list1 = new Vector<Cominfo>();
		 
		 try {
			 PreparedStatement pstat = conn.prepareStatement(SQL);
			 pstat.setInt(1, getNext() - (pageNumber - 1 ) * 10);
			 rs = pstat.executeQuery();
			 while (rs.next()) {
				 Cominfo ci = new Cominfo();
				 	ci.setCom_num(rs.getInt(1));
				 	ci.setCom_bct(rs.getString(2));
				 	ci.setCom_mem_id(rs.getString(3));
				 	ci.setCom_name(rs.getString(4));
				 	ci.setCom_con(rs.getString(5));
				 	ci.setCom_available(rs.getInt(6));
				 	ci.setCom_count(rs.getInt(7));
				 	ci.setCom_date(rs.getString(8));
	                list1.add(ci);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list1; 
	    }
	
	// 선택된 페이지에 해당되는 10개의 게시글을 읽어오도록 함, 동행구인만
		public Vector<Cominfo> getList2(int pageNumber){
			
			// 조회된 기준 com_num으로 내림차순하여 위에 10개만 보여주는 쿼리 
			 String SQL = "SELECT * FROM com_info"
			 		+ " WHERE com_num < ? AND com_available = 1  AND com_bct = '동행구인' ORDER BY com_num DESC LIMIT 10";
			 
			 Vector<Cominfo> list1 = new Vector<Cominfo>();
			 
			 try {
				 PreparedStatement pstat = conn.prepareStatement(SQL);
				 pstat.setInt(1, getNext() - (pageNumber - 1 ) * 10);
				 rs = pstat.executeQuery();
				 while (rs.next()) {
					 Cominfo ci = new Cominfo();
					 	ci.setCom_num(rs.getInt(1));
					 	ci.setCom_bct(rs.getString(2));
					 	ci.setCom_mem_id(rs.getString(3));
					 	ci.setCom_name(rs.getString(4));
					 	ci.setCom_con(rs.getString(5));
					 	ci.setCom_available(rs.getInt(6));
					 	ci.setCom_count(rs.getInt(7));
					 	ci.setCom_date(rs.getString(8));
		                list1.add(ci);
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return list1; 
		    }
		
		
		// 선택된 페이지에 해당되는 10개의 게시글을 읽어오도록 함, 중고장터만
		public Vector<Cominfo> getList3(int pageNumber){
			
			// 조회된 기준 com_num으로 내림차순하여 위에 10개만 보여주는 쿼리 
			 String SQL = "SELECT * FROM com_info"
			 		+ " WHERE com_num < ? AND com_available = 1 AND com_bct = '중고장터' ORDER BY com_num DESC LIMIT 10";
			 
			 Vector<Cominfo> list1 = new Vector<Cominfo>();
			 
			 try {
				 PreparedStatement pstat = conn.prepareStatement(SQL);
				 pstat.setInt(1, getNext() - (pageNumber - 1 ) * 10);
				 rs = pstat.executeQuery();
				 while (rs.next()) {
					 Cominfo ci = new Cominfo();
					 	ci.setCom_num(rs.getInt(1));
					 	ci.setCom_bct(rs.getString(2));
					 	ci.setCom_mem_id(rs.getString(3));
					 	ci.setCom_name(rs.getString(4));
					 	ci.setCom_con(rs.getString(5));
					 	ci.setCom_available(rs.getInt(6));
					 	ci.setCom_count(rs.getInt(7));
					 	ci.setCom_date(rs.getString(8));
		                list1.add(ci);
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return list1; 
		    }
		
	
	//게시글 수에 따라 페이징 처리
	 public boolean nextPage(int pageNumber) {
		 
		 //조회된 기준 com_num으로 내림차순하여 위에 10개만 보여주는 쿼리
	        String SQL = "SELECT * FROM com_info WHERE com_num < ? AND com_available= 1"; 
	        
	        try {
	        	PreparedStatement pstat = conn.prepareStatement(SQL);
	        	pstat.setInt(1, getNext() - (pageNumber - 1 ) * 10);
	            rs = pstat.executeQuery();
	            
	            //다음 버튼을 보여줄지 판단하는 부분
	            if (rs.next())
	            {
	                return true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false; 
	    }
	 
	 //com_view
	    public Cominfo getBoard(int com_num){
	    	
	    	
	            String SQL = "SELECT * FROM com_info WHERE com_num = ?"; 
	            try {
	                PreparedStatement pstmt = conn.prepareStatement(SQL);
	                pstmt.setInt(1, com_num); // ? 부분에 대해서
	                rs = pstmt.executeQuery(); //select
	                if (rs.next())
	                {
	                	Cominfo ci = new Cominfo();
	                	ci.setCom_num(rs.getInt(1));
	                	ci.setCom_bct(rs.getString(2));
	                    ci.setCom_mem_id(rs.getString(3));
	                    ci.setCom_name(rs.getString(4));
	                    ci.setCom_con(rs.getString(5));
	                    ci.setCom_available(rs.getInt(6));
	                    int com_count = rs.getInt(7);
	                    ci.setCom_count(com_count);
	                    com_count++;
	                    countUpdate(com_count,com_num);
	                    ci.setCom_date(rs.getString(8));
	                    return ci;
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            return null; 
	        }
	    

	    // 조회수 증가 메소드
	    public int countUpdate(int com_count,int com_num) {
	    	String SQL = "update com_info set com_count = ? where com_num = ?";
	    
	    	try {
				PreparedStatement pstmt=conn.prepareStatement(SQL);
				pstmt.setInt(1, com_count);//물음표의 순서
				pstmt.setInt(2, com_num);
				return pstmt.executeUpdate();//insert,delete,update	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;//데이터베이스 오류
		}

	    
	    // 검색창
	    public Vector<Cominfo> getSearch(String searchField, String searchText){//특정한 리스트를 받아서 반환
	    	 Vector<Cominfo> list1 = new Vector<Cominfo>();
		      String SQL ="select * from com_info WHERE "+searchField.trim();
		      try {
		    	  if(searchText != null && !searchText.equals("") ){//이거 빼면 안 나온다ㅜ 왜지?
		                SQL +=" LIKE '%"+searchText.trim()+"%' order by com_num desc limit 10";

		            }
		            PreparedStatement pstmt=conn.prepareStatement(SQL);
					rs=pstmt.executeQuery();//select
		         while(rs.next()) {
		        	Cominfo ci = new Cominfo();
		    	 	ci.setCom_num(rs.getInt(1));
				 	ci.setCom_bct(rs.getString(2));
				 	ci.setCom_mem_id(rs.getString(3));
				 	ci.setCom_name(rs.getString(4));
				 	ci.setCom_con(rs.getString(5));
				 	ci.setCom_available(rs.getInt(6));
				 	ci.setCom_count(rs.getInt(7));
				 	ci.setCom_date(rs.getString(8));
	                list1.add(ci);
		         }         
		      } catch(Exception e) {
		         e.printStackTrace();
		         System.out.println("오류");
		      }
		      return list1;//ㄱㅔ시글 리스트 반환
		   }
	    

}
