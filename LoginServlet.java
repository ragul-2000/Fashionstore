package com.servletproj;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String emailOrMobile = request.getParameter("login");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/servlet_db?useSSL=false", "root", "Ragul@1275")) {
                PreparedStatement statement = connection.prepareStatement(
                        "SELECT * FROM users WHERE (EmailID = ? OR PhoneNumber = ?) AND Password = ?");
                statement.setString(1, emailOrMobile);
                statement.setString(2, emailOrMobile);
                statement.setString(3, password); // In a real app, hash and salt the password

                ResultSet rs = statement.executeQuery();

                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userEmail", rs.getString("EmailID"));
                    String userName = rs.getString("FirstName"); // Assuming the column name is FirstName
                    session.setAttribute("userName", userName);
                    response.sendRedirect("Afterlogin.jsp");
                } else {
                    response.sendRedirect("error.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
