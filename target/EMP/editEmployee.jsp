<%@ page import="com.emp.model.Employee" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <html>

        <head>
            <title>Edit Employee</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 20px;
                }

                .form-container {
                    max-width: 400px;
                    margin: 0 auto;
                }

                label {
                    display: block;
                    margin-top: 10px;
                }

                input[type="text"],
                input[type="number"] {
                    width: 100%;
                    padding: 8px;
                    margin-top: 5px;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    box-sizing: border-box;
                }

                input[type="submit"] {
                    margin-top: 20px;
                    padding: 10px 20px;
                    background-color: #007bff;
                    color: white;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }

                a {
                    display: block;
                    margin-top: 10px;
                    color: #007bff;
                    text-decoration: none;
                }
            </style>
        </head>

        <body>
            <div class="form-container">
                <h2>Edit Employee</h2>
                <% Employee employee=(Employee) request.getAttribute("employee"); %>
                    <form action="employees" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="<%= employee.getId() %>">

                        <label>Name:</label>
                        <input type="text" name="name" value="<%= employee.getName() %>" required>

                        <label>Department:</label>
                        <input type="text" name="department" value="<%= employee.getDepartment() %>" required>

                        <label>Salary:</label>
                        <input type="number" name="salary" value="<%= employee.getSalary() %>" step="0.01" required>

                        <input type="submit" value="Update">
                    </form>
                    <a href="employees?action=list">Back to List</a>
            </div>
        </body>

        </html>