<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Registration | HMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 4 CDN -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Shared HMS theme -->
    <link rel="stylesheet" href="../assets/css/theme.css">
</head>

<body>

<div class="auth-wrap">
    <div class="auth-card" style="max-width:560px;">

        <div class="auth-head">
            <p class="brand"><span class="dot" style="width:9px;height:9px;border-radius:50%;background:#E2A34C;display:inline-block;"></span> HMS &middot; Patient Portal</p>
            <h4>Create your account</h4>
            <p class="sub">Book appointments and track prescriptions in one place.</p>

            <svg class="vital-line" viewBox="0 0 300 22" preserveAspectRatio="none">
                <path d="M0,11 L70,11 L82,2 L94,20 L106,11 L300,11"></path>
            </svg>
        </div>

        <div class="auth-body">

            <form action="../registerPatientServlet" method="post">

                <!-- Patient Name -->
                <div class="form-group">
                    <label>Patient Name</label>
                    <input type="text" name="patient_name" class="form-control"
                           placeholder="Enter full name" required>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control"
                           placeholder="Enter email" required>
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control"
                           placeholder="Enter password" required>
                </div>

                <!-- Gender -->
                <div class="form-group">
                    <label>Gender</label><br>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"
                               name="gender" value="Male" required>
                        <label class="form-check-label" style="text-transform:none;font-weight:400;">Male</label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio"
                               name="gender" value="Female">
                        <label class="form-check-label" style="text-transform:none;font-weight:400;">Female</label>
                    </div>
                </div>

                <!-- Contact -->
                <div class="form-group">
                    <label>Contact Number</label>
                    <input type="text" name="contact" class="form-control"
                           placeholder="Enter mobile number" required>
                </div>

                <!-- Address -->
                <div class="form-group">
                    <label>Address</label>
                    <textarea name="address" class="form-control"
                              rows="3" placeholder="Enter address" required></textarea>
                </div>

                <!-- Submit -->
                <button type="submit" class="btn btn-brand btn-block mt-3">
                    Create account
                </button>

            </form>

            <p class="auth-foot">
                Already registered? <a href="patient_login.jsp">Log in</a>
            </p>
        </div>

    </div>
</div>

</body>
</html>
