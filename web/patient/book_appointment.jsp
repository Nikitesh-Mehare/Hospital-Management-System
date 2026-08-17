<%
   if(session.getAttribute("patient_id") == null){
        response.sendRedirect("patient_login.jsp");
   }
%>
<%@page import="com.hms.util.DbConnection, java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book Appointment | HMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        <a href="book_appointment.jsp" class="active">&#128197;&nbsp; Book Appointment</a>
        <a href="view_appointment.jsp">&#128203;&nbsp; My Appointments</a>
        <a href="view_doctor.jsp">&#128104;&#8205;&#9877;&#65039;&nbsp; Our Doctors</a>
        <a href="view_prescription.jsp">&#128138;&nbsp; Prescriptions</a>
    </nav>
    <div class="logout-link">
        <a href="../logout.jsp">&#8629;&nbsp; Logout</a>
    </div>
</div>

<!-- Main Content -->
<div class="app-content">

    <div class="app-topbar">
        <div>
            <p class="eyebrow">Patient Portal</p>
            <h2>Book Appointment</h2>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-8">

            <div class="panel">
                <div class="panel-body">

                    <form action="../BookAppointmentServlet" method="post">

                        <div class="form-group">
                            <label>Doctor</label>

                            <select name="doctor_id" class="form-control">
                                <%
                                    Connection con = DbConnection.getConnection();
                                    String q = "select doctor_id, doctor_name from doctor";
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery(q);   
                                    while(rs.next())
                                    {
                                %> <option value="<%= rs.getInt("doctor_id")%>"> <%= rs.getString("doctor_name")%></option> <%
                                }
                                %>
                            </select>

                        </div>

                        <div class="form-group">
                            <label>Appointment Date</label>
                            <input type="date" name="appointment_date" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label>Preferred Time</label>
                            <input type="time" name="appointment_time" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-brand btn-block mt-3">
                            Book Appointment
                        </button>

                    </form>

                </div>
            </div>

        </div>
    </div>

</div>

<!-- Bootstrap Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
