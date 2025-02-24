///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */


package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Lecturer;
import model.User;

public abstract class BaseRequiredLecturerAuthenticationController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            return false;
        } else {
            Lecturer lecturer = user.getLecturer();
            return lecturer != null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        System.out.println("User from session in doGet: " + (user != null ? user.getUsername() : "null"));
        System.out.println("Lecturer from session in doGet: " + (user != null && user.getLecturer() != null ? user.getLecturer().getName() : "null"));

        if (isAuthenticated(request)) {
            doGet(request, response, user, user.getLecturer());
        } else {
            response.getWriter().println("Access Denied!");
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, User user, Lecturer lecturer)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        System.out.println("User from session in doPost: " + (user != null ? user.getUsername() : "null"));
        System.out.println("Lecturer from session in doPost: " + (user != null && user.getLecturer() != null ? user.getLecturer().getName() : "null"));

        if (isAuthenticated(request)) {
            doPost(request, response, user, user.getLecturer());
        } else {
            response.getWriter().println("Access Denied!");
        }
    }

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, User user, Lecturer lecturer)
            throws ServletException, IOException;

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
