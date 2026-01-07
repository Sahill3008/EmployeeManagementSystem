package com.emp.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String u = req.getParameter("username");
        String p = req.getParameter("password");

        // Hard-coded role assignment for Interview purposes
        if ("admin".equals(u) && "admin123".equals(p)) {
            HttpSession session = req.getSession();
            session.setAttribute("user", u);
            session.setAttribute("ROLE", "ADMIN"); // Admin Role
            resp.sendRedirect("employees?action=list");
        } else if ("user".equals(u) && "user123".equals(p)) {
            HttpSession session = req.getSession();
            session.setAttribute("user", u);
            session.setAttribute("ROLE", "EMPLOYEE"); // Employee Role
            session.setAttribute("ID", 1L); // Mock ID for Employee (Mapped to ID 1)
            resp.sendRedirect("employees?action=list");
        } else {
            req.setAttribute("error", "Invalid Credentials");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        resp.sendRedirect("login.jsp");
    }
}
