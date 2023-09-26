<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration</title>
</head>
<body>
 <form action="registerservlet" method="post">
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Random"%>
<%!
    public static String generateRegistrationNumber() {
        int registernumber = new Random().nextInt(100000000) + 100000000;
        return Integer.toString(registernumber);
    }
%>

<%
    String registernumber = generateRegistrationNumber();
%>


    <center> <h1> We should have Registered Here Before </h1> </center><br>
    <h2>Registrataion:</h2>
    <p>Your Registration Number is : <%= registernumber%></p>
    <input type = "hidden" name="registernumber" value = "<%= registernumber%>">
 <table>
  <tr>
  <td><label>First Name:</label></td>
  <td><input type="text" name="firstname"><td>
  </tr>
  <tr>
  <td> <label>Middle Name:</label></td>
  <td><input type="text" name="middlename"></td>
  </tr>
  <tr>
  <td><label>Last Name:</label></td>
  <td><input type="text" name="lastname"></td>
  </tr>
  <tr>
  <td><label>Birth Date:</label></td>
  <td><input type="text" name="birthdate" placeholder="dd-mm-yyyy"></td>
  </tr>
   <tr>
        <td>Sex</td>
        <td><select name="sex" style="width:130px">    
        <option>Male</option>  
        <option>Female</option></select>
        </td>
        </tr>
  <tr>
  <td><label>Email ID:</label></td>
  <td><input type="email" name="emailid"></td>
  </tr>
  <tr>
  <td><label>Address Details ------</label></td>
  </tr>
  <tr>
  <td><label>House Number:</label></td>
  <td><input type="text" name="housenumber"></td>
  </tr>
  <tr>
  <td><label>Street:</label></td>
  <td><input type="text" name="street"></td>
  </tr>
  <tr>
  <td><label>City:</label></td>
  <td><input type="text" name="city"></td>
  </tr>
  <tr>
  <td><label>State:</label></td>
  <td><input type="text" name="state"></td>
  </tr>
  <tr>
  <td><label>Country:</label></td>
  <td><input type="text" name="country"></td>
  </tr>
  <tr>
  <td><label>Pincode:</label></td>
  <td><input type="text" name="pincode"></td>
  <tr>
  <td> ------------------------- </td>
  </tr>
  <tr>
  <td><label>Phone Number:</label></td>
  <td><input type="text" name="phonenumber"></td>
  </tr>
  <tr>
  <td><label>Login Name:</label></td>
  <td><input type="text" name="loginname"></td>
  </tr>
  <tr>
  <td><label>Password:</label></td>
  <td><input type="password" name="Password"></td>
  </tr>
  <tr>
  <td><input type="submit" value="Register"></td>
  <td><input type="reset" value="Clear"></td>
  </tr>
  </table>
 </form>
</body>
</html>