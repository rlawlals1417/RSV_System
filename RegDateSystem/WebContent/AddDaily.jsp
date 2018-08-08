<%@ page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr" import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%
   //데이터베이스를 연결하는 관련 변수를 선언한다
  Connection conn= null;
  Statement stmt = null;
//  PreparedStatement pstmt = null;
   //데이터베이스를 연결하는 관련 정보를 문자열로 선언한다.
  String jdbc_driver= "oracle.jdbc.driver.OracleDriver"; //JDBC 드라이버의 클래스 경로
  String jdbc_url= "jdbc:oracle:thin:@localhost:1521";  //접속하려는 데이터베이스의 정보
   //JDBC 드라이버 클래스를 로드한다.
  Class.forName("oracle.jdbc.driver.OracleDriver");
   //데이터베이스 연결 정보를 이용해서 Connection 인스턴스를 확보한다.
  conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521", "20081380", "0000");
  if (conn== null) {
   out.println("No connection is made!");
  }
  %>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>일정 추가</title>
 </head>
 <body>
  <center>
  <H2>일정 추가</H2>
  <HR>
  <form name=memoAdd method=post action=memoAdd.jsp>
   <input type=text name=memoYear size=4>년
   <input type=text name=memoMonth size=2>월
   <input type=text name=memoDay size=2>일
   내용 : <input type=text name=memoContents>
   <input type=submit value="추가">
  </form>
   <%
   stmt = conn.createStatement();
  //if (request.getParameter("username") != null) {
   String sql= "INSERT INTO CALENDARMEMO (CALENDARMEMO_YEAR, CALENDARMEMO_MONTH, CALENDARMEMO_DAY, CALENDARMEMO_CONTENTS) VALUES (";
   sql+= request.getParameter("memoYear");
   sql+= ", ";
   sql+= request.getParameter("memoMonth");
   sql+= ", ";
   sql+= request.getParameter("memoDay");
   sql+= ", \'";
   sql+= request.getParameter("memoContents");
   sql+= " \')";
   // INSERT INTO jdbc_testVALUES (‘홍길동’, ‘test@test.net’)
   stmt.executeUpdate(sql);
 //  }
/*select 문장을문자열형태로구성한다.
  String sql= "SELECT username, email FROM jdbc_test";
  pstmt= conn.prepareStatement(sql);
  // select 를수행하면데이터정보가ResultSet클래스의인스턴스로리턴
  ResultSet rs= pstmt.executeQuery();
  int i= 1;
  // 마지막데이터까지반복함.
  while (rs.next()) {
  out.print(i+ " : " + rs.getString(1) + " , ");
  out.println(rs.getString("email") + "<BR>");
  i++;
  }
  rs.close();*/
  %>
  <HR>
  </center>
</body>
</html>
   <%
        //사용한 자원을 반납한다.
       stmt.close();
       conn.close();
   %>