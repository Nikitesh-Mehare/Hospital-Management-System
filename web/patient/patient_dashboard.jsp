<%
   if(session.getAttribute("patient_id") == null){
        response.sendRedirect("patient_login.jsp");
   }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Dashboard | HMS</title>
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
        <a href="patient_dashboard.jsp" class="active">&#8962;&nbsp; Dashboard</a>
        <a href="book_appointment.jsp">&#128197;&nbsp; Book Appointment</a>
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
            <h2>Hello, <%= session.getAttribute("patient_name") %> 👋</h2>
        </div>
    </div>

    <div class="stat-grid">
        <div class="stat-card">
            <div class="label">Quick action</div>
            <div class="value" style="font-size:1.1rem;">
                <a href="book_appointment.jsp">Book Appointment &rarr;</a>
            </div>
        </div>
        <div class="stat-card">
            <div class="label">Quick action</div>
            <div class="value" style="font-size:1.1rem;">
                <a href="view_appointment.jsp">View Appointments &rarr;</a>
            </div>
        </div>
        <div class="stat-card">
            <div class="label">Quick action</div>
            <div class="value" style="font-size:1.1rem;">
                <a href="view_prescription.jsp">View Prescriptions &rarr;</a>
            </div>
        </div>
    </div>

    <div class="panel">
        <div class="panel-head">
            <h4>Welcome to your dashboard</h4>
        </div>
        <div class="panel-body">
            <p style="color:var(--muted); margin:0;">
                Use the menu on the left to book a new appointment, browse doctors by department,
                or check appointment status and prescriptions issued by your doctor.
            </p>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
