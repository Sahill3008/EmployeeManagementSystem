<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>

    <head>
        <title>Add New Employee</title>
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
                background-color: #28a745;
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
            <h2>Add New Employee</h2>
            <form action="employees" method="post">
                <input type="hidden" name="action" value="insert">

                <label>Name:</label>
                <input type="text" name="name" required>

                <label>Department:</label>
                <input type="text" name="department" required>

                <label>Salary:</label>
                <input type="number" name="salary" step="0.01" required>

                <input type="submit" value="Save">
            </form>
            <a href="employees?action=list">Back to List</a>
        </div>
    </body>

    </html>