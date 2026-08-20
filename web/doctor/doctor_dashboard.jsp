<%
    if(session.getAttribute("doctor_id") == null)
    {
      response.sendRedirect("doctor_login.jsp");
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Dashboard | HMS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/theme.css">
    </head>
    <body>

        <%
            String doctor_name = (String)session.getAttribute("doctor_name");
        %>

        <!-- Sidebar -->
        <div class="app-sidebar">
            <div class="brand"><span class="dot"></span> HMS Doctor</div>
            <div class="who">
                Signed in as
                <strong> <%= doctor_name %></strong>
            </div>
            <nav>
                <a href="doctor_dashboard.jsp" class="active">&#8962;&nbsp; Dashboard</a>
                <a href="view_appointment.jsp">&#128203;&nbsp; Appointments</a>
            </nav>
            <div class="logout-link">
                <a href="../logout.jsp">&#8629;&nbsp; Logout</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="app-content">

            <div class="app-topbar">
                <div>
                    <p class="eyebrow">Doctor Portal</p>
                    <h2>Hello, <%= doctor_name %> 👋</h2>
                </div>
            </div>

            <div class="stat-grid">
                <div class="stat-card">
                    <div class="label">Quick action</div>
                    <div class="value" style="font-size:1.1rem;">
                        <a href="view_appointment.jsp">View Appointments &rarr;</a>
                    </div>
                </div>
            </div>

            <div class="panel">
                <div class="panel-head">
                    <h4>Welcome to your dashboard</h4>
                </div>
                <div class="panel-body">
                    <p style="color:var(--muted); margin:0;">
                        Review your appointment list, mark visits as completed, and add
                        prescriptions for your patients from the Appointments page.
                    </p>
                </div>
            </div>

        </div>

    </body>
</html>
