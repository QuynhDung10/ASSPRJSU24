///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//
//package controller.exam;
//
//import controller.auth.BaseRequiredStudentAuthenticationController;
//import dal.GradeDBContext;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.ArrayList;
//import model.Grade;
//import model.Student;
//import model.User;
//
///**
// *
// * @author ADMIN
// */
//public class ViewExamController extends BaseRequiredStudentAuthenticationController {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student)
//            throws ServletException, IOException {
//        GradeDBContext gradeDB = new GradeDBContext();
//
//        // Assuming student ID is accessible from the student object
//        int studentId = student.getId();
//
//        // Retrieve grades for the student
//        ArrayList<Grade> grades = gradeDB.getGradesByStudentId(studentId);
//
//        request.setAttribute("grades", grades);
//        request.getRequestDispatcher("../view/exam/view.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student)
//            throws ServletException, IOException {
//        // You can implement POST logic if needed, such as handling form submissions
//        // For viewing purposes, typically doGet is sufficient
//        // Redirect or handle POST as per your application needs
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "View Exam Controller";
//    }
//}
package controller.exam;

import dal.GradeDBContext;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Grade;
import model.Student;
import model.User;

public class ViewExamController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Assume the user is authenticated and has a student role
        User user = (User) request.getSession().getAttribute("user");
        Student student = user.getStudent();

        if (student == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
            return;
        }

        // Retrieve grades for the logged-in student
        GradeDBContext gradeDB = new GradeDBContext();
        ArrayList<Grade> studentGrades = gradeDB.getGradesByStudentId(student.getId());

        // Set grades as request attribute to be accessed in JSP
        request.setAttribute("studentGrades", studentGrades);
        request.getRequestDispatcher("/view/exam/viewGrades.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "View Exam Controller";
    }
}
