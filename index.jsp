<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%-- page settings --%>
<%@ page errorPage="feedbackErrorPage.jsp"%>
<%-- beans used in this JSP --%>
<jsp:useBean id="survey" scope="page" class="beans.SurveyBean" />
<jsp:useBean id="surveyData" scope="request"
	class="beans.SurveyDataBean" />

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Student Survey</title>

<style type="text/css">
        body { 
        font-family: tahoma, helvetica, arial, sans-serif;
        }

        table, tr, td { 
        font-size: .9em;
        border: 3px groove;
        padding: 5px;
        background-color: #dddddd;
        }
    </style>
</head>

<body>
<jsp:setProperty name="survey" property="*" />
<!-- the above is equivalent to: -->
<!--jsp:setProperty name = "survey" property = "firstName" param = "firstName" /-->
<!--jsp:setProperty name = "survey" property = "lastName" param = "lastName" /-->
<!--jsp:setProperty name = "survey" property = "email" param = "email" /-->
<img src="images/05_edietsLogo.gif" alt="eDiets.com" />
<%
	// start scriptlet

	if (survey.getFirstName() == null || survey.getLastName() == null
			|| survey.getEmail() == null) {
%>
<%-- end scriptlet to insert fixed template data --%>

<form method="post" action="index.jsp">
<h2>Introduction to Java Technology</h2>
<jsp:include flush="true" page="before_course_questions.html"></jsp:include>
</form>

<%
	} // end if
	else {
		surveyData.addSurvey(survey);
%>
You are done completing this survey, please stop by Alvaro's cubicle for
your copy of the textbook. THANKS!!!
<%
		 } // end else
%>
</body>
</html>
