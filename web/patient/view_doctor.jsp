<%
   if(session.getAttribute("patient_id") == null){
        response.sendRedirect("patient_login.jsp");
   }
%>
<%@page import="com.hms.util.DbConnection"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Our Doctors | HMS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 4 -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Shared HMS theme -->
    <link rel="stylesheet" href="../assets/css/theme.css">
</head>

<body>

<!-- Sidebar -->
<div class="app-sidebar">
    <div class="brand"><span class="dot"></span> HMS Patient</div>
    <div class="who">
        Signed in as
        <strong><%= session.getAttribute("patient_name") %></strong>
    </div>
    <nav>
        <a href="patient_dashboard.jsp">&#8962;&nbsp; Dashboard</a>
        <a href="book_appointment.jsp">&#128197;&nbsp; Book Appointment</a>
        <a href="view_appointment.jsp">&#128203;&nbsp; My Appointments</a>
        <a href="view_doctor.jsp" class="active">&#128104;&#8205;&#9877;&#65039;&nbsp; Our Doctors</a>
        <a href="view_prescription.jsp">&#128138;&nbsp; Prescriptions</a>
    </nav>
    <div class="logout-link">
        <a href="../logout.jsp">&#8629;&nbsp; Logout</a>
    </div>
</div>

<div class="app-content">

    <div class="app-topbar">
        <div>
            <p class="eyebrow">Patient Portal</p>
            <h2>Our Doctors</h2>
        </div>
    </div>

    <div class="panel">
        <div class="panel-body">

            <div class="table-responsive">
                <table class="table text-center">

                    <thead>
                        <tr>
                            <th>Sr. No</th>
                            <th>Doctor Name</th>
                            <th>Department</th>
                        </tr>
                    </thead>

                    <tbody>

                    <%
                        Connection con = DbConnection.getConnection();
                        String q = "select d.doctor_id, d.doctor_name, dept.dept_name from doctor d JOIN department dept ON d.dept_id = dept.dept_id";
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery(q);
                        int i = 1;
                        while(rs.next()){
                    %>

                        <tr>
                            <td><%= i++ %></td>
                            <td><%= rs.getString("doctor_name") %></td>
                            <td><span class="badge-status badge-default"><%= rs.getString("dept_name") %></span></td>
                        </tr>

                    <%
                        }
                    %>

                    </tbody>

                </table>
            </div>

        </div>
    </div>

</div>

</body>
</html>
