# Deploying HMS

## Local development
Runs exactly as before in NetBeans + local MySQL (XAMPP/WAMP). `DbConnection`
falls back to `localhost:3306/hospitaldb`, `root`/`root` when no environment
variables are set, so nothing changes for local dev.

## Live hosting (Render, using Docker)
Vercel cannot run this project — it only hosts static sites and Node/Python/Go
serverless functions, not a Java Servlet/JSP container. Use Render (or Railway/
Google Cloud Run) instead. See the chat walkthrough for full steps.

1. In NetBeans: **Clean and Build** → produces `dist/hms.war`.
2. Push the repo (including `dist/hms.war`) to GitHub.
3. On Render: New → Web Service → Docker → point at this repo. Render builds
   the `Dockerfile` and runs the WAR on Tomcat 9.
4. Create a MySQL database (Render/Aiven/TiDB Cloud all have free tiers) and
   import your `hospitaldb` schema into it.
5. On the Render service, set environment variables:
   - `DB_URL` = `jdbc:mysql://<host>:<port>/<db>?useSSL=true&serverTimezone=UTC`
   - `DB_USER` = your DB username
   - `DB_PASSWORD` = your DB password
6. Deploy. Render gives you a live `https://your-app.onrender.com` URL.
