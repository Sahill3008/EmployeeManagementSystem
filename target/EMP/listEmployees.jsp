<%@ page import="java.util.List" %>
    <%@ page import="com.emp.model.Employee" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <html>

            <head>
                <title>Employee List</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }

                    h2 {
                        color: #333;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                    }

                    th,
                    td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: left;
                    }

                    th {
                        background-color: #f2f2f2;
                    }

                    tr:nth-child(even) {
                        background-color: #f9f9f9;
                    }

                    a {
                        text-decoration: none;
                        color: #007bff;
                        margin-right: 10px;
                    }

                    a:hover {
                        text-decoration: underline;
                    }

                    .btn {
                        padding: 5px 10px;
                        background-color: #28a745;
                        color: white;
                        border-radius: 4px;
                    }

                    .btn:hover {
                        background-color: #218838;
                        text-decoration: none;
                    }

                    .logout {
                        float: right;
                        color: red;
                    }
                </style>
            </head>

            <body>
                <a href="login?logout=true" class="logout">Logout</a>
                <h2>Employee List</h2>
                <a href="employees?action=new" class="btn">Add New Employee</a>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Salary</th>
                        <th>Actions</th>
                    </tr>
                    <% List<Employee> listEmployee = (List<Employee>) request.getAttribute("listEmployee");
                            if (listEmployee != null) {
                            for (Employee employee : listEmployee) {
                            %>
                            <tr>
                                <td>
                                    <%= employee.getId() %>
                                </td>
                                <td>
                                    <%= employee.getName() %>
                                </td>
                                <td>
                                    <%= employee.getDepartment() %>
                                </td>
                                <td>
                                    <%= employee.getSalary() %>
                                </td>
                                <td>
                                    <a href="employees?action=edit&id=<%= employee.getId() %>">Edit</a>
                                    <a href="employees?action=delete&id=<%= employee.getId() %>"
                                        onclick="return confirm('Are you sure?')">Delete</a>
                                </td>
                            </tr>
                            <% } } %>
                </table>
            </body>

            </html>