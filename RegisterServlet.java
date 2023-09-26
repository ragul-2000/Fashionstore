package com.servletproj;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerservlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/servlet_db?useSSL=false", "root", "Ragul@1275")) {
                PreparedStatement statement = connection.prepareStatement(
                        "INSERT INTO users (FirstName, PhoneNumber, EmailID, Password, Address) VALUES (?, ?, ?, ?, ?)");

                statement.setString(1, name);
                statement.setString(2, mobile);
                statement.setString(3, email);
                statement.setString(4, password); // In a real app, hash and salt the password
                statement.setString(5, address);

                int rowCount = statement.executeUpdate();

                if (rowCount > 0) {
                    response.sendRedirect("success.jsp");
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
