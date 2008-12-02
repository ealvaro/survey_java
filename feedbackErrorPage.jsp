<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%-- page settings --%>
<%@ page isErrorPage = "true" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>

<html xmlns = "http://www.w3.org/1999/xhtml">

   <head>
      <title>Error Page!</title>

      <style type = "text/css">
         .bigRed {
            font-size: 2em;
            color: red; 
            font-weight: bold;
         }
      </style>
   </head>

   <body>
   <img src="images/05_edietsLogo.gif" alt="eDiets.com"/>
      <p class = "bigRed"> 

      <% // scriptlet to determine exception type
         // and output beginning of error message
         if ( exception instanceof SQLException ){
      %>

      You have completed this survey before.</p>
      <p style="font-size: 2em;">Thank you for your feedback!</p>
      <p style="font-size: 1em;">Note: If there has been a mistake submitting this survey please email <a href="mailto:alvaro@ediets.com">Alvaro E. Escobar</a></p>
      
      <%}
         else if ( exception instanceof ClassNotFoundException ){
      %>

      <p style="font-size: 2em;">A ClassNotFoundException occurred while interacting with the survey database.</p>
      <p style="font-size: 2em;">Sorry for the inconvenience. Please report the error message below.</p>
      <p class = "bigRed">
         The error message was:<br />
         <%= exception.getMessage() %>
      </p>
      
      <%}
         else {
      %>

      <p>An unknown error occurred while interacting with the survey database.</p>
      <p class = "bigRed">
         The error message was:<br />
         <%= exception.getMessage() %>
      </p>
      <%}
      %>
   </body>
</html>
