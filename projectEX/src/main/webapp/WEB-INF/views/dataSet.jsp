<%-- <%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.tobesoft.platform.*"%>
<%@page import="com.tobesoft.platform.data.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/xml; charset=utf-8" %>
<%!
/************공통함수*********/
// ResultSet값 가져오기, 단, "null"을 ""로
public String rsGet(ResultSetrs, String id) throws Exception
{
	if(rs.getString(id) == null)
		return "";
	else
		return rs.getString(id);
}

// 한글 조회조건 처리용 함수
public static String EucToUni(String s)
{
	String result = "";
	try {
			result = new String(s.getBytes("8859_1"), "EUC-KR");
		} catch(Exception e) {
			System.out.println(e);
		}
		return result;
}
%>

<%
/****** Service API 초기화 ******/
VariableList vl = new VariableList();
DatasetList dl = new DatasetList();
%>

<%
/******* JDBC Connection *******/
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
conn = DriverManger.getConnection("jdbc:sqlserver://192.168.0.5:1521:DatabaseName=giantstudy","giantstudy","gs123");
stmt = conn.createStatement();

try {
/******* SQL 실행 *******/
String name = request.getParameter("name");
String SQL;
if(name.equals("") == true )
	SQL = "select * from board_study";
else
	SQL = "select * from board_study where name like"+EucToUni(name)+"%%";
rs = stmt.executeQuery(SQL);

/*******Dataset 생성******/
Dataset ds = new Dataset("test_test");
ds.addColumn("seq",ColumnInfo.CY_COLINFO_STRING, 50);
ds.addColumn("mem_name",ColumnInfo.CY_COLINFO_STRING, 50);
ds.addColumn("mem_id",ColumnInfo.CY_COLINFO_STRING, 50);
ds.addColumn("board_subject",ColumnInfo.CY_COLINFO_STRING, 50);
ds.addColumn("board_content",ColumnInfo.CY_COLINFO_STRING, 50);
ds.addColumn("reg_date",ColumnInfo.CY_COLINFO_STRING, 50);
ds.addColumn("upt_data",ColumnInfo.CY_COLINFO_STRING, 50);
ds.addColumn("view_cnt",ColumnInfo.CY_COLINFO_STRING, 50);
while(rs.next())
{
	int row = ds.appendRow();
	ds.setColumn(row, "seq", rsGet(rs, "seq"));
	ds.setColumn(row, "mem_name", rsGet(rs, "mem_name"));
	ds.setColumn(row, "mem_id", rsGet(rs, "mem_id"));
	ds.setColumn(row, "board_subject", rsGet(rs, "board_subject"));
	ds.setColumn(row, "board_content", rsGet(rs, "board_content"));
	ds.setColumn(row, "reg_date", rsGet(rs, "reg_date"));
	ds.setColumn(row, "upt_date", rsGet(rs, "upt_date"));
	ds.setColumn(row, "view_cnt", rsGet(rs, "view_cnt"));	
}

/******** 생성된 Dataset을 DatasetList에 추가 *******/
dl.addDataset(ds);

/********* 변수를 VariableList에 추가 *********/
vl.addStr("ErrorCode","0");
vl.addStr("ErrorMsg","SUCC");
}
/********* Error 처리 *********/
catch(SQLException e) {
vl.addStr("ErrorCode","-1");
vl.addStr("ErrorMsg",e.getMessage());
}
%>

<%
/*********JDBC Close********/
	if(stmt != null) try { stmt.close(); } catch (Exception e) {}
	if(conn != null) try { conn.close(); } catch (Exception e) {}
%>

<%
/******* 결과 XML 생성 및 Web Server로 전달 ******/
	out.clearBuffer();
	PlatformResponse pRes = new PlatformResponse(response, PlatformRequest.XML, "utf-8");
	pRes.sendData(vl, dl);
%> --%>