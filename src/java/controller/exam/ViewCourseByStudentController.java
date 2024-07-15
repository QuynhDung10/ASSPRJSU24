/////*
//// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
//// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
//// */
////


package controller.exam;

import controller.auth.BaseRequiredStudentAuthenticationController;
import dal.CourseDBContext;
import dal.ExamDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;
import model.Exam;
import model.Student;
import model.User;

public class ViewCourseByStudentController extends BaseRequiredStudentAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Student student = (Student) request.getSession().getAttribute("student");

        if (student == null) {
            // Redirect to login page if student is not found in session
            response.sendRedirect("../view/auth/login.jsp");
            return;
        }

        CourseDBContext db = new CourseDBContext();
        int sid = student.getId();
        ArrayList<Course> courses = db.getCoursesByStudent(sid);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("../view/course/student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Student student = (Student) request.getSession().getAttribute("student");

             int cid = Integer.parseInt(request.getParameter("cid"));
        int sid = student.getId();

        ExamDBContext db = new ExamDBContext();
        ArrayList<Exam> exams = db.getExamsByCourse(cid);
        request.setAttribute("exams", exams);

        request.getRequestDispatcher("../view/exam/student.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for students to view their courses and exams";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
