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
                <style>
                    /* Search Form Styles */
                    .search-container {
                        margin-bottom: 20px;
                        margin-top: 10px;
                    }

                    .search-input {
                        padding: 6px;
                        width: 200px;
                    }

                    .search-btn {
                        padding: 6px 12px;
                        background-color: #007bff;
                        color: white;
                        border: none;
                        cursor: pointer;
                    }

                    .search-btn:hover {
                        background-color: #0056b3;
                    }
                </style>
            </head>

            <body>
                <a href="login?logout=true" class="logout">Logout</a>
                <h2>Employee List</h2>

                <div class="search-container">
                    <form action="employees" method="get" style="display: inline;">
                        <input type="hidden" name="action" value="list">
                        <input type="text" name="searchTerm" class="search-input"
                            placeholder="Search by name or dept..." value="<%= request.getParameter(" searchTerm")
                            !=null ? request.getParameter("searchTerm") : "" %>">
                        <button type="submit" class="search-btn">Search</button>
                        <% if(request.getParameter("searchTerm") !=null) { %>
                            <a href="employees?action=list">Clear</a>
                            <% } %>
                    </form>
                    <a href="employees?action=new" class="btn" style="float: right;">Add New Employee</a>
                </div>

                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Salary</th>
                        <th>Actions</th>
                    </tr>
                    <% List<Employee> listEmployee = (List<Employee>) request.getAttribute("listEmployee");
                            String role = (String) session.getAttribute("ROLE");
                            Long userId = (Long) session.getAttribute("ID");
                            boolean isAdmin = "ADMIN".equals(role);

                            if (listEmployee != null) {
                            for (Employee employee : listEmployee) {
                            boolean isOwnProfile = userId != null && userId.equals(employee.getId());
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
                                    <% if (isAdmin || isOwnProfile) { %>
                                        <a href="employees?action=edit&id=<%= employee.getId() %>">Edit</a>
                                        <% } %>

                                            <% if (isAdmin) { %>
                                                <a href="employees?action=delete&id=<%= employee.getId() %>"
                                                    onclick="return confirm('Are you sure?')">Delete</a>
                                                <% } %>
                                </td>
                            </tr>
                            <% } } %>
                </table>
            </body>

            </html>