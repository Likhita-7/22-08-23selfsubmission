<%@ page language="java" import="java.util.*,java.sql.*,com.pack.Employee" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>employee details</title>
</head>
<body>
<form action="Selfsub.jsp" method="get">

<h1>Employee details</h1>
<label>employee number</label>
<input type="text" id="enum" name="numc"><br><br>
<label> employee name</label>
<input type="text" id="ename" name="namec"><br><br>
<label>job</label>
<input type="text" id="job" name="jobc"><br><br>
<label>salary</label>
<input type="text" id="sal" name="salc"><br><br>
<label>dept number</label>
<input type="text" id="dept" name="deptc"><br><br>

 
        <button type="submit" name="n" value="first" class="first">First</button>
        <button type="submit" name="n" value="last" class="last">Last</button>
        <button type="submit" name="n" value="next" class="next">Next</button>
        <button type="submit" name="n" value="prev" class="prev">Previous</button>
        <button type="submit" name="n" value="search" class="search">Search</button>
        <br><br>
        <button type="submit" name="n" value="edit" class="edit">Edit</button>
        <button type="submit" name="n" value="add" class="add">Add</button>
        <button type="submit" name="n" value="save" class="save">Save</button>
        <button type="submit" name="n" value="delete" class="delete">Delete</button>
        <br><br>
        <button type="submit" name="n" value="clear1" class="clear1">Clear</button>
   </form>
<%
//database connection

Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://192.168.110.48:5432/plf_training", "plf_training_admin", "pff123");
PreparedStatement ps=con.prepareStatement("Select * from Employee_likhita");
ResultSet rs=ps.executeQuery();
/* while(rs.next()){
	System.out.println(rs.getInt(1));	
}

System.out.println(rs);*/
//arraylist
ArrayList<Employee> elist = new ArrayList<>();
while(rs.next()){
	int eno=rs.getInt(1);
	String ename=rs.getString(2);
	String ejob=rs.getString(3);
	Double esal=rs.getDouble(4);
	int edept=rs.getInt(5);
	
	Employee e= new Employee(eno,ename,ejob,esal,edept);
	elist.add(e);	
}

//session
int counter=-1;
HttpSession ses=request.getSession();
ses.setAttribute("alist",elist);
ses.setAttribute("cur",counter);

String mo=request.getParameter("n");
if(mo!=null && mo.equals("first")){
	int c=(Integer)ses.getAttribute("cur");
	c=0;
	ses.setAttribute("cur",c);
	ArrayList<Employee> l=(ArrayList<Employee>)ses.getAttribute("alist");
	int eno=l.get(c).getEmpno();
	String ename=l.get(c).getName();
	String ejob=l.get(c).getJob();
	Double esal=l.get(c).getSal();
	int edept=l.get(c).getDept();
	
	
}
if(mo!=null && mo.equals("last")){
	int c=(Integer)ses.getAttribute("cur");
	ArrayList<Employee> l=(ArrayList<Employee>)ses.getAttribute("alist");
	c=l.size();
	System.out.println(c);
	
	

}








%>
<script>


</script>



</body>
</html>