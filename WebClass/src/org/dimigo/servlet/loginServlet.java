package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.vo.UserVO;

import com.google.gson.JsonObject;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "login", urlPatterns = { "/login" })
public class loginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      RequestDispatcher rd = request.getRequestDispatcher("/Webclass/jsp/login.jsp");
      rd.forward(request, response);
      //      response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      
      request.setCharacterEncoding("utf-8");
      String id = request.getParameter("id");
      String pwd = request.getParameter("pwd");
      System.out.printf("id : %s, pwd : %s\n",id,pwd);

      // id, pwd 사용자 인증 체크
      boolean result = true;
      
      if(result){
         // 세션에 사용자 생성
         HttpSession session = request.getSession();
         UserVO user = new UserVO();
         user.setId(id);
         user.setName("김준하");
         user.setNickname("의적");
   
         session.setAttribute("user", user);
         
         RequestDispatcher rd = request.getRequestDispatcher("jsp/home.jsp");
         rd.forward(request, response);
      } else {
         request.setAttribute("msg","error");
         RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
         rd.forward(request, response);
         
      }

      out.close();
   }


protected void doPost2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   response.setContentType("application/json;charset=utf-8");
   PrintWriter out = response.getWriter();
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   System.out.printf("id : %s, pwd : %s\n",id,pwd);
   /*
    * {
    *    "id : "test"
    * }
    */
//   out.println("{");
//   out.println("\"id\" : " + "\"" + id + "\"");
//   out.println("}");

   //Json simple library 사용
//
//   JSONObject json = new JSONObject();
//   json.put("id", id);
//   System.out.println(json.toJSONString());
//   out.write(json.toJSONString());
//   
      //Gson library를 사용하도록 소스 작성하기

   JsonObject json = new JsonObject();
   json.addProperty("id", id);
   System.out.println(json.toString());
   out.write(json.toString());         
   out.close();
}
}