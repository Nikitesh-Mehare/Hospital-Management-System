<%
   if(session.getAttribute("patient_id") == null){
        response.sendRedirect("patient_login.jsp");
   }
%>
<%@page import="com.hms.util.DbConnection, java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Appointments | HMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap 4 CDN -->
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
            <a href="view_appointment.jsp" class="active">&#128203;&nbsp; My Appointments</a>
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
                <h2>My Appointments</h2>
            </div>
        </div>

        <div class="panel">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Sr. No</th>
                                <th>Doctor Name</th>
                                <th>Appointment Date</th>
                                <th>Appointment Time</th>
                                <th>Status</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                int patient_id =(int)session.getAttribute("patient_id");

                                Connection con = DbConnection.getConnection();

                                String q = "select d.doctor_name, a.appointment_date, a.appointment_time, a.status from appointment a JOIN doctor d on d.doctor_id = a.doctor_id where a.patient_id = ?";

                                PreparedStatement pstmt =  con.prepareStatement(q);

                                pstmt.setInt(1, patient_id);

                                ResultSet rs = pstmt.executeQuery();

                                int count = 1;
                                boolean hasRows = false;
                                while(rs.next())
                                {
                                    hasRows = true;
                                    String status = rs.getString("status");
                                    String badgeClass = "badge-default";
                                    if(status != null){
                                        String s = status.trim().toLowerCase();
                                        if(s.equals("completed")) badgeClass = "badge-completed";
                                        else if(s.equals("pending")) badgeClass = "badge-pending";
                                        else if(s.equals("cancelled")) badgeClass = "badge-cancelled";
                                    }
                            %>
                               <tr>
                                   <td> <%= count++ %></td>
                                    <td> <%= rs.getString("doctor_name") %></td>
                                    <td><%= rs.getString("appointment_date") %></td>
                                    <td><%= rs.getString("appointment_time") %></td>
                                    <td><span class="badge-status <%= badgeClass %>"><%= status %></span></td>
                               </tr>
                           <%
                                }
                                if(!hasRows){
                           %>
                                <tr>
                                    <td colspan="5">
                                        <div class="empty-state">
                                            <div class="icon">&#128197;</div>
                                            No appointments yet. <a href="book_appointment.jsp">Book one now &rarr;</a>
                                        </div>
                                    </td>
                                </tr>
                           <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
