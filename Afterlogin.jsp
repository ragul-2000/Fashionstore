<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <style>
 * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  .Fashion-dropdown {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
}

.loggedin-username {
            background-color: #ff523b; /* Replace with your desired background color */
            padding: 5px 10px; /* Optional: Add some padding to the username element */
            color: #ffffff; /* Optional: Change the text color to make it readable on the background */
            border-radius: 5px; /* Optional: Add rounded corners */
        }

.Fashion-dropdown a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.Fashion-dropdown a:hover {
  background-color: #f1f1f1;
}

.Fashion:hover .Fashion-dropdown {
  display: block;
}
.dropdown-menu{
  background-color: #adadad;
}

  
  body {
    font-family: "Poppins", sans-serif;
  }
  
  .navbar {
    display: flex;
    align-items: center;
    padding: 20px;
  }
  
  nav {
    flex: 1;
    text-align: right;
  }
  
  nav ul {
    display: inline-block;
    list-style-type: none;
  }
  
  nav ul li {
    display: inline-block;
    margin-right: 20px;
  }
  
  a {
    text-decoration: none;
    color: #555;
  }
  
  p {
    color: #555;
  }
  
  .container {
    max-width: 1300px;
    margin: auto;
    padding-left: 25px;
    padding-right: 25px;
  }
  
  .row {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-around;
  }
  
  .col-2 {
    flex-basis: 50%;
    min-width: 300px;
  }
  
  .col-2 img {
    max-width: 100%;
    padding: 50px 0;
  }
  
  .col-2 h1 {
    font-size: 50px;
    line-height: 60px;
    margin: 25px 0;
  }
  
  .btn {
    display: inline-block;
    background: #ff523b;
    color: #ffffff;
    padding: 8px 30px;
    margin: 30px 0;
    border-radius: 30px;
    transition: background 0.5s;
  }
  
  .btn:hover {
    background: #563434;
  }
  
  .header {
    background: radial-gradient(#fff, #ffd6d6);
  }
  
  .header .row {
    margin-top: 70px;
  }

  /* footer */
  
  .footer {
    background: #000;
    color: #8a8a8a;
    font-size: 14px;
    padding: 60px 0 20px;
  }
  
  .footer p {
    color: #8a8a8a;
  }
  
  .footer h3 {
    color: #ffffff;
    margin-bottom: 20px;
  }
  
  .footer-col-1,
  .footer-col-2,
  .footer-col-3,
  .footer-col-4 {
    min-width: 250px;
    margin-bottom: 20px;
  }
  
  .footer-col-1 {
    flex-basis: 30%;
  }
  
  .footer-col-2 {
    flex: 1;
    text-align: center;
  }
  
  .footer-col-2 img {
    width: 180px;
    margin-bottom: 20px;
  }
  
  .footer-col-3,
  .footer-col-4 {
    flex-basis: 12%;
    text-align: center;
  }
  
  ul {
    list-style-type: none;
  }
  
  .app-logo {
    margin-top: 20px;
  }
  .app-logo img {
    width: 140px;
  }
  
  .footer hr {
    border: none;
    background: #b5b5b5;
    height: 1px;
    margin: 20px 0;
  }
  
  .copyright {
    text-align: center;
  }
  
  .menu-icon {
    width: 28px;
    margin-left: 20px;
    display: none;
  }
  
  /* media query for menu */
  
  @media only screen and (max-width: 800px) {
    nav ul {
      position: absolute;
      top: 70px;
      left: 0;
      background: #333;
      width: 100%;
      overflow: hidden;
      transition: max-height 0.5s;
    }
    nav ul li {
      display: block;
      margin-right: 50px;
      margin-top: 10px;
      margin-bottom: 10px;
    }
  
    nav ul li a {
      color: #fff;
    }
    .menu-icon {
      display: block;
      cursor: pointer;
    }
  }
  
  /* single product details */
  
  .single-product {
    margin-top: 80px;
  }
  
  .single-product .col-2 img {
    padding: 0;
  }
  
  .single-product .col-2 {
    padding: 20px;
  }
  
  .single-product h4 {
    margin: 20px 0;
    font-size: 22px;
    font-weight: bold;
  }
  
  .single-product select {
    display: block;
    padding: 10px;
    margin-top: 20px;
  }
  
  .single-product input {
    width: 50px;
    height: 40px;
    padding-left: 10px;
    font-size: 20px;
    margin-right: 10px;
    border: 1px solid #ff523b;
  }
  
  input:focus {
    outline: none;
  }
  
  .single-product .fas {
    color: #ff523b;
    margin-left: 10px;
  }
  
  .small-img-row {
    display: flex;
    justify-content: space-between;
  }
  
  .small-img-col {
    flex-basis: 24%;
    cursor: pointer;
  }
  
  /* cart items */
  
  .cart-page {
    margin: 90px auto;
  }
  
  table {
    width: 100%;
    border-collapse: collapse;
  }
  
  .cart-info {
    display: flex;
    flex-wrap: wrap;
  }
  
  .dropdown
  th {
    text-align: left;
    padding: 5px;
    color: #ffffff;
    background: #ff523b;
    font-weight: normal;
  }
  td {
    padding: 10px 5px;
  }
  
  td input {
    width: 40px;
    height: 30px;
    padding: 5px;
  }
  
  td a {
    color: #ff523b;
    font-size: 12px;
  }
  
  td img {
    width: 80px;
    height: 80px;
    margin-right: 10px;
  }
  
  .total-price {
    display: flex;
    justify-content: flex-end;
  }
  
  .total-price table {
    border-top: 3px solid #ff523b;
    width: 100%;
    max-width: 400px;
  }
  
  td:last-child {
    text-align: right;
  }
  
  th:last-child {
    text-align: right;
  }
  /* account page */
  .account-page {
    padding: 50px 0;
    background: radial-gradient(#fff, #ffd6d6);
  }
  
  .form-container {
    background: #ffffff;
    width: 300px;
    height: 400px;
    position: relative;
    text-align: center;
    padding: 20px 0;
    margin: auto;
    box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.1);
    overflow: hidden;
  }
  
  .form-container span {
    font-weight: bold;
    padding: 0 10px;
    color: #555555;
    cursor: pointer;
    width: 100px;
    display: inline-block;
  }
  
  .form-btn {
    display: inline-block;
  }
  
  .form-container form {
    max-width: 300px;
    padding: 0 20px;
    position: absolute;
    top: 130px;
    transition: transform 1s;
  }
  
  form input {
    width: 100%;
    height: 30px;
    margin: 10px 0;
    padding: 0 10px;
    border: 1px solid #ccc;
  }
  
  form .btn {
    width: 100%;
    border: none;
    cursor: pointer;
    margin: 10px 0;
  }
  
  form .btn:focus {
    outline: none;
  }
  
  #LoginForm {
    left: -300px;
  }
  
  #RegForm {
    left: 0;
  }
  
  form a {
    font-size: 12px;
  }
  
  #Indicator {
    width: 100px;
    border: none;
    background: #ff523b;
    height: 3px;
    margin-top: 8px;
    transform: translateX(100px);
    transition: transform 1s;
  }
  
  /* media query for less than 600 screen size */
  
  @media only screen and (max-width: 600px) {
    .row {
      text-align: center;
    }
    .col-2,
    .col-3,
    .col-4 {
      flex-basis: 100%;
    }
  
    .single-product .row {
      text-align: left;
    }
  
    .single-product .col-2 {
      padding: 20px 0;
    }
    .single-product h1 {
      font-size: 26px;
      line-height: 32px;
    }
    .cart-info p {
      display: none;
    }
  }
  
    </style>
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="navbar">
              <div class="logo">
          <a href="index.html"><img src="https://img.freepik.com/free-vector/fashion-logo_23-2148558723.jpg" alt="FashionStore" width="150px" /></a>

        </div>
        <nav>
          <ul id="MenuItems">
                  <a class="btn btn-primary" href="index.html" role="button">Home</a>
                <li>
                        <div class="dropdown">
                          <a class="btn btn-secondary dropdown-toggle" href="product_details.html" role="button" data-bs-toggle="dropdown" aria-expanded="false">Fashion
                          </a>
                        
                          <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="men.html">Men</a></li>
                            <li><a class="dropdown-item" href="women.html">women</a></li>
                            <li><a class="dropdown-item" href="kids.html">Kids</a></li>
                          </ul>
                          <a class="btn btn-primary" href="About.html" role="button">About</a>
                          
                          <a class="btn btn-primary" href="help.html" role="button">Help Center</a>
                          
                          <a class="btn btn-primary" href="logout.html" role="button">Log out</a>
                         <li>
                          <a href="cart.html"><img src="https://i.ibb.co/PNjjx3y/cart.png" alt="" width="40px" height="40px" /></a>
                          <img src="https://i.ibb.co/6XbqwjD/menu.png" alt="cart-info" class="menu-icon" onclick="menutoggle()" />
                        </li>
                        </div>
                    </div>
                </li>   
          </ul>
        </nav>
      <%
    String loggedInUsername = (String) session.getAttribute("userName");
    if (loggedInUsername != null) {
%>
    <div class="loggedin-username">
        Welcome, <%= loggedInUsername %>!
    </div>
<%
    } else {
%>
    <a class="btn btn-primary" href="login.html" role="button">Log In</a>
<%
    }
%>
      </div> 
            <div class="row">
                <div class="col-2">
                    <h1>
                        Fashion is a state of mind!..
                    </h1>
                    <p>
                        Create your own style. Let it be unique for yourself and yet identifiable for others...
                    </p>
                    <a href="product_details.html" target="_blank" rel="noopener noreferrer" class="btn">Explore Now → </a>
                </div>
                <div class="col-2">
                    <img src="https://img.lovepik.com/photo/45014/3740.jpg_wh860.jpg" alt="" />
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <h3>Download Our App</h3>
                    <p>Download App for Android and iso mobile phone.</p>
                    <div class="app-logo">
                        <img src="https://i.ibb.co/KbPTYYQ/play-store.png" alt="" />
                        <img src="https://i.ibb.co/hVM4X2p/app-store.png" alt="" />
                    </div>
                </div>
                <!-- Rest of the footer content here -->
                <div class="footer-col-2">
        <img src="https://www.vhv.rs/dpng/d/134-1348158_shopping-dresses-fashion-clothing-shopper-clothes-man-and.png" alt="" />
        <p>
          Our Purpose Is To Sustainably Make the Pleasure and Benefits of
          Sports Accessible to the Many.
        </p>
      </div>

      <div class="footer-col-3">
        <h3>Useful Links</h3>
        <ul>
          <li>Coupons</li>
          <li>Blog Post</li>
          <li>Return Policy</li>
          <li>Join Affiliate</li>
        </ul>
      </div>

      <div class="footer-col-4">
        <h3>Follow us</h3>
        <ul>
          <li>Facebook</li>
          <li>Twitter</li>
          <li>Instagram</li>
          <li>YouTube</li>
        </ul>
      </div>
            </div>
            <hr />
            <p class="copyright">Copyright &copy; 2021 - Fashion Store</p>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">
    window.onload = function () {
        var loggedInUsername = '<%= session.getAttribute("userName") %>';
        var loginButton = document.querySelector('a[href="login.html"]');
        var usernamePlaceholder = document.querySelector('.loggedin-username');

        if (loggedInUsername) {
            loginButton.style.display = 'none';
            usernamePlaceholder.textContent = 'Welcome, ' + loggedInUsername + '!';
        } else {
            usernamePlaceholder.style.display = 'none';
        }
    };
</script>

</body>
</html>
