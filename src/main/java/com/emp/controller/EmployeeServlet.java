package com.emp.controller;

import com.emp.dao.EmployeeDAO;
import com.emp.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/employees", loadOnStartup = 1)
public class EmployeeServlet extends HttpServlet {

    private EmployeeDAO employeeDAO;

    @Override
    public void init() {
        employeeDAO = new EmployeeDAO();
        // Warm up the EntityManagerFactory (Create DB connection pool on startup)
        com.emp.util.EntityManagerFactoryProvider.getEntityManagerFactory();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null)
            action = "list";

        switch (action) {
            case "insert":
                insertEmployee(req, resp);
                break;
            case "update":
                updateEmployee(req, resp);
                break;
            default:
                listEmployees(req, resp);
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null)
            action = "list";

        switch (action) {
            case "new":
                showNewForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                deleteEmployee(req, resp);
                break;
            default:
                listEmployees(req, resp);
                break;
        }
    }

    private void listEmployees(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Employee> listEmployee = employeeDAO.findAll();
        req.setAttribute("listEmployee", listEmployee);
        req.getRequestDispatcher("listEmployees.jsp").forward(req, resp);
    }

    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("addEmployee.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        Employee existingEmployee = employeeDAO.findById(id);
        req.setAttribute("employee", existingEmployee);
        req.getRequestDispatcher("editEmployee.jsp").forward(req, resp);
    }

    private void insertEmployee(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String department = req.getParameter("department");
        Double salary = Double.parseDouble(req.getParameter("salary"));

        Employee newEmployee = new Employee(name, department, salary);
        employeeDAO.save(newEmployee);
        resp.sendRedirect("employees?action=list");
    }

    private void updateEmployee(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        String department = req.getParameter("department");
        Double salary = Double.parseDouble(req.getParameter("salary"));

        Employee employee = new Employee(name, department, salary);
        employee.setId(id);
        employeeDAO.update(employee);
        resp.sendRedirect("employees?action=list");
    }

    private void deleteEmployee(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        employeeDAO.delete(id);
        resp.sendRedirect("employees?action=list");
    }
}
