<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%-- page settings --%>
<%@ page errorPage="feedbackErrorPage.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="beans.*"%>

<%-- SurveyDataBean to obtain srvy list --%>
<jsp:useBean id="survey" scope="request" class="beans.SurveyDataBean" />

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Student List</title>

<style type="text/css">
         body { 
            font-family: tahoma, helvetica, arial, sans-serif; 
         }

         table, tr, td, th { 
            text-align: center;
            font-size: .9em;
            border: 3px groove;
            padding: 4px;
            background-color: #dddddd;
         }
      </style>
</head>

<body>
<img src="images/05_edietsLogo.gif" alt="eDiets.com" />
<p style="font-size: 2em;">The following students have completed the
survey.</p>
<table>
	<thead>
		<tr>
			<th style="width: 50px;">#</th>
			<th style="width: 100px;">Last name</th>
			<th style="width: 100px;">First name</th>
			<th style="width: 200px;">Email</th>
			<th style="width: 200px;">Timestamp</th>
			<th style="width: 20px;">Q1</th>
			<th style="width: 20px;">Q2</th>
			<th style="width: 20px;">Q3</th>
			<th style="width: 20px;">Q4</th>
			<th style="width: 20px;">Q5</th>
			<th style="width: 20px;">Q6</th>
			<th style="width: 20px;">Q7</th>
			<th style="width: 20px;">Q8</th>
			<th style="width: 20px;">Q9</th>
			<th style="width: 20px;">Q10</th>
		</tr>
	</thead>
	<tbody>
		<%
			// start scriptlet

			List srvyList = survey.getSrvyList();
			Iterator srvyListIterator = srvyList.iterator();
			SurveyBean srvy;
			int i = 0;
			double avgQ01=0,avgQ02=0,avgQ03=0,avgQ04=0,avgQ05=0;
			double avgQ06=0,avgQ07=0,avgQ08=0,avgQ09=0,avgQ10=0;

			while (srvyListIterator.hasNext()) {
				srvy = (SurveyBean) srvyListIterator.next();
				i++;
				avgQ01+=srvy.getQ01();avgQ02+=srvy.getQ02();avgQ03+=srvy.getQ03();avgQ04+=srvy.getQ04();avgQ05+=srvy.getQ05();
				avgQ06+=srvy.getQ06();avgQ07+=srvy.getQ07();avgQ08+=srvy.getQ08();avgQ09+=srvy.getQ09();avgQ10+=srvy.getQ10();
		%>
		<tr>
			<td><%=i%></td>
			<td><%=srvy.getLastName()%></td>
			<td><%=srvy.getFirstName()%></td>
			<td><a href="mailto:<%= srvy.getEmail() %>"> <%=srvy.getEmail()%></a></td>
			<td><%=srvy.getTstmp()%></td>
			<td><%=srvy.getQ01()%></td>
			<td><%=srvy.getQ02()%></td>
			<td><%=srvy.getQ03()%></td>
			<td><%=srvy.getQ04()%></td>
			<td><%=srvy.getQ05()%></td>
			<td><%=srvy.getQ06()%></td>
			<td><%=srvy.getQ07()%></td>
			<td><%=srvy.getQ08()%></td>
			<td><%=srvy.getQ09()%></td>
			<td><%=srvy.getQ10()%></td>
		</tr>
		<%
			} // end while
			avgQ01/=i;avgQ02/=i;avgQ03/=i;avgQ04/=i;avgQ05/=i;
			avgQ06/=i;avgQ07/=i;avgQ08/=i;avgQ09/=i;avgQ10/=i;
		%>
		<tr>
			<td colspan=4></td>
			<td>Average : </td>
			<td><%=Math.ceil(avgQ01 * 100) / 100%></td>
			<td><%=Math.ceil(avgQ02 * 100) / 100%></td>
			<td><%=Math.ceil(avgQ03 * 100) / 100%></td>
			<td><%=Math.ceil(avgQ04 * 100) / 100%></td>
			<td><%=Math.ceil(avgQ05 * 100) / 100%></td>
			<td><%=Math.ceil(avgQ06 * 100) / 100%></td>
			<td><%=Math.ceil(avgQ07 * 100) / 100%></td>
			<td><%=Math.ceil(avgQ08 * 100) / 100%></td>
			<td><%=Math.ceil(avgQ09 * 100) / 100%></td>
			<td><%=Math.ceil(avgQ10 * 100) / 100%></td>
		</tr>
	</tbody>
</table>
<p style="font-size: 2em;">Thank you for your feedback!</p>
</body>

</html>
