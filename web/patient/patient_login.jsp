<%
   if(session.getAttribute("patient_id")!=null)
   {
        response.sendRedirect("patient_dashboard.jsp");
   }
   
%>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Login | HMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 4 CDN -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Shared HMS theme -->
    <link rel="stylesheet" href="../assets/css/theme.css">
</head>

<body>

<div class="auth-wrap">
    <div class="auth-card">

        <div class="auth-head">
            <p class="brand"><span class="dot" style="width:9px;height:9px;border-radius:50%;background:#E2A34C;display:inline-block;"></span> HMS &middot; Patient Portal</p>
            <h4>Welcome back</h4>
            <p class="sub">Log in to manage your appointments and prescriptions.</p>

            <svg class="vital-line" viewBox="0 0 300 22" preserveAspectRatio="none">
                <path d="M0,11 L70,11 L82,2 L94,20 L106,11 L300,11"></path>
            </svg>
        </div>

        <div class="auth-body">

            <form action="../loginPatientServlet" method="post">

                <!-- Email -->
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control"
                           placeholder="you@example.com" required>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control"
                           placeholder="Enter password" required>
                </div>

                <!-- Submit -->
                <button type="submit" class="btn btn-brand btn-block mt-3">
                    Log in
                </button>

            </form>

            <p class="auth-foot">
                New patient? <a href="patient_register.jsp">Create an account</a>
            </p>
        </div>

    </div>
</div>

</body>
</html>
