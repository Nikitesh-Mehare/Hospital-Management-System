<%@page import="com.hms.dao.PrescriptionDAO, java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prescriptions | HMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap 4 CSS -->
        <link rel="stylesheet" 
              href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            <a href="view_doctor.jsp">&#128104;&#8205;&#9877;&#65039;&nbsp; Our Doctors</a>
            <a href="view_prescription.jsp" class="active">&#128138;&nbsp; Prescriptions</a>
        </nav>
        <div class="logout-link">
            <a href="../logout.jsp">&#8629;&nbsp; Logout</a>
        </div>
    </div>

    <div class="app-content">

        <div class="app-topbar">
            <div>
                <p class="eyebrow">Patient Portal</p>
                <h2>Prescription Details</h2>
            </div>
        </div>

        <div class="panel">
            <div class="panel-body">
                <!-- Responsive table -->
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Appointment Id</th>
                                <th>Doctor Name</th>
                                <th>Diagnosis</th>
                                <th>Medicines</th>
                                <th>Remarks</th>
                                <th>Date</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                int patient_id = (int)session.getAttribute("patient_id");
                                
                                if (patient_id == 0) {
                               
                                    response.sendRedirect("patient/paitent_login.jsp");
                                    return;
                                }
                                
                                ResultSet rs =  PrescriptionDAO.getPrescriptionByPatient(patient_id);

                                while(rs.next())
                                { 
                            %>
                            <tr>
                                <td><%= rs.getInt("appointment_id") %></td>
                                <td><%= rs.getString("doctor_name") %></td>
                                <td><%= rs.getString("diagnosis") %></td>
                                <td><%= rs.getString("medicines") %></td>
                                <td><%= rs.getString("remarks") %></td>
                                <td><%= rs.getString("appointment_date") %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap 4 JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
