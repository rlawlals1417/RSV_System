<%@ page contentType="text/html;charset=euc-kr" pageEncoding="euc-kr" import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%
   //�����ͺ��̽��� �����ϴ� ���� ������ �����Ѵ�
  Connection conn= null;
  Statement stmt = null;
//  PreparedStatement pstmt = null;
   //�����ͺ��̽��� �����ϴ� ���� ������ ���ڿ��� �����Ѵ�.
  String jdbc_driver= "oracle.jdbc.driver.OracleDriver"; //JDBC ����̹��� Ŭ���� ���
  String jdbc_url= "jdbc:oracle:thin:@localhost:1521";  //�����Ϸ��� �����ͺ��̽��� ����
   //JDBC ����̹� Ŭ������ �ε��Ѵ�.
  Class.forName("oracle.jdbc.driver.OracleDriver");
   //�����ͺ��̽� ���� ������ �̿��ؼ� Connection �ν��Ͻ��� Ȯ���Ѵ�.
  conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521", "20081380", "0000");
  if (conn== null) {
   out.println("No connection is made!");
  }
  %>
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>���� �߰�</title>
 </head>
 <body>
  <center>
  <H2>���� �߰�</H2>
  <HR>
  <form name=memoAdd method=post action=memoAdd.jsp>
   <input type=text name=memoYear size=4>��
   <input type=text name=memoMonth size=2>��
   <input type=text name=memoDay size=2>��
   ���� : <input type=text name=memoContents>
   <input type=submit value="�߰�">
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
   // INSERT INTO jdbc_testVALUES (��ȫ�浿��, ��test@test.net��)
   stmt.executeUpdate(sql);
 //  }
/*select ���������ڿ����·α����Ѵ�.
  String sql= "SELECT username, email FROM jdbc_test";
  pstmt= conn.prepareStatement(sql);
  // select �������ϸ鵥����������ResultSetŬ�������ν��Ͻ��θ���
  ResultSet rs= pstmt.executeQuery();
  int i= 1;
  // �����������ͱ����ݺ���.
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
        //����� �ڿ��� �ݳ��Ѵ�.
       stmt.close();
       conn.close();
   %>