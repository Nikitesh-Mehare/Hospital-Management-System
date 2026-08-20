<%
    if(session.getAttribute("doctor_id") == null)
    {
      response.sendRedirect("doctor_login.jsp");
    }
%>
<%@page import="com.hms.dao.AppointmentDAO, java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Appointments | HMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/theme.css">
    </head>

    <body>

    <!-- Sidebar -->
    <div class="app-sidebar">
        <div class="brand"><span class="dot"></span> HMS Doctor</div>
        <div class="who">
            Signed in as
            <strong><%= session.getAttribute("doctor_name") %></strong>
        </div>
        <nav>
            <a href="doctor_dashboard.jsp">&#8962;&nbsp; Dashboard</a>
            <a href="view_appointment.jsp" class="active">&#128203;&nbsp; Appointments</a>
        </nav>
        <div class="logout-link">
            <a href="../logout.jsp">&#8629;&nbsp; Logout</a>
        </div>
    </div>

    <div class="app-content">

        <div class="app-topbar">
            <div>
                <p class="eyebrow">Doctor Portal</p>
                <h2>Appointment List</h2>
            </div>
        </div>

        <div class="panel">
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table text-center">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Patient Name</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Status</th>
                                <th>Prescription</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                int doctor_id = (int)session.getAttribute("doctor_id");
                                ResultSet rs = AppointmentDAO.getAppointmentsByDoctor(doctor_id);

                                boolean hasRows = false;
                                while(rs.next()) {
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
                                <td><%= rs.getInt("appointment_id") %></td>
                                <td><%= rs.getString("patient_name") %></td>
                                <td><%= rs.getString("appointment_date") %></td>
                                <td><%= rs.getString("appointment_time") %></td>
                                <td>
                                    <span class="badge-status <%= badgeClass %>">
                                        <%= status %>
                                    </span>
                                </td>
                                <td>
                                    <a href="add_prescription.jsp?aid=<%= rs.getInt("appointment_id") %>" 
                                       class="btn-pill btn-pill-primary">
                                        Add
                                    </a>
                                </td>
                                <td>
                                    <a href="../UpdateAppointmentStatusServlet?aid=<%= rs.getInt("appointment_id") %>" class="btn-pill btn-pill-success">
                                        Completed
                                    </a>
                                </td>
                            </tr>
                            <% }
                               if(!hasRows){
                            %>
                            <tr>
                                <td colspan="7">
                                    <div class="empty-state">
                                        <div class="icon">&#128203;</div>
                                        No appointments scheduled yet.
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

    </body>
</html>
