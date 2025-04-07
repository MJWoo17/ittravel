package dao;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class flight
 */
@WebServlet("/check.ao")
public class flight extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String air_num = request.getParameter("air_num");
        String air_deppt = request.getParameter("air_deppt");
        String air_dday = request.getParameter("air_dday");
        String air_arrpt = request.getParameter("air_arrpt");
        String air_aday = request.getParameter("air_aday");
        String air_model = request.getParameter("air_model");
        String air_fligname = request.getParameter("air_fligname");

        
        RequestDispatcher dispatcher = request.getRequestDispatcher("check.jsp");
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        dispatcher.forward(request, response);
        
        // 출력 스트림을 닫아줍니다.
        response.getWriter().close();
    }

}