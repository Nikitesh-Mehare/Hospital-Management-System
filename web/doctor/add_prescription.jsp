<%
    if(session.getAttribute("doctor_id") == null)
    {
      response.sendRedirect("doctor_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Prescription | HMS</title>
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
            <strong>Dr. <%= session.getAttribute("doctor_name") %></strong>
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
                <h2>Add Prescription</h2>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-8">

                <div class="panel">
                    <div class="panel-body">
                        <form action="../AddPrescriptionServlet" method="post">

                            <!-- Hidden Appointment ID -->
                            <input type="hidden" name="appointment_id" value="<%= request.getParameter("aid") %>">

                            <div class="form-group">
                                <label>Diagnosis</label>
                                <textarea rows="4" class="form-control" name="diagnosis"
                                          placeholder="Enter diagnosis details"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Medicines</label>
                                <textarea rows="4" class="form-control" name="medicines"
                                          placeholder="Enter prescribed medicines"></textarea>
                            </div>

                            <div class="form-group">
                                <label>Remarks</label>
                                <textarea rows="4" class="form-control" name="remarks"
                                          placeholder="Additional remarks (if any)"></textarea>
                            </div>

                            <button type="submit" class="btn btn-brand">
                                Save Prescription
                            </button>

                        </form>
                    </div>
                </div>

            </div>
        </div>

    </div>

    </body>
</html>
