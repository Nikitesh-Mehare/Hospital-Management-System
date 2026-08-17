
package com.hms.dao;

import com.hms.util.DbConnection;
import java.sql.*;

public class AppointmentDAO {
    
    public static boolean bookAppointment(int doctor_id, int patient_id, String date, String time)
    {
        //System.out.println(doctor_id+" "+patient_id);
        try{
                Connection con = DbConnection.getConnection();
                String q = "insert into appointment(doctor_id, patient_id, appointment_date, appointment_time) values(?,?,?,?)";
                PreparedStatement pstmt = con.prepareStatement(q);
                pstmt.setInt(1, doctor_id);
                pstmt.setInt(2, patient_id);
                pstmt.setString(3, date);
                pstmt.setString(4, time);

                int row = pstmt.executeUpdate();
                return row>0;
       }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
       return false;
    }
    
    public static ResultSet getAppointmentsByDoctor(int doctor_id)
    {
        ResultSet rs = null;
         try{
                Connection con = DbConnection.getConnection();
                String q = "select a.appointment_id, p.patient_name, a.appointment_date, a.appointment_time, a.status from appointment a JOIN patient p ON a.patient_id = p.patient_id where doctor_id = ?";
                
                PreparedStatement pstmt = con.prepareStatement(q);
                pstmt.setInt(1, doctor_id);
                
                rs = pstmt.executeQuery();
                return rs;
         }
         
         catch(Exception e)
         {
             e.printStackTrace();
         }
         return rs;
    }
    
    public static boolean updateStatus(int appointment_id, String status)
    {
        try{
            Connection con = DbConnection.getConnection();
            String q = "update appointment set status = ? where appointment_id = ?";
            PreparedStatement pstmt =  con.prepareStatement(q);

            pstmt.setString(1, status);
            pstmt.setInt(2, appointment_id);

            return pstmt.executeUpdate() > 0;
        
        }
        catch(Exception e){
            e.printStackTrace();
            
        }
        return false;
    }
}
