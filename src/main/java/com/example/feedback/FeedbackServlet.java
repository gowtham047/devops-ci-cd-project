package com.example.feedback;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedback = request.getParameter("feedback");
        String rating = request.getParameter("rating");

        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("feedback", feedback);
        request.setAttribute("rating", rating);

        request.getRequestDispatcher("success.jsp")
               .forward(request, response);
    }
}

