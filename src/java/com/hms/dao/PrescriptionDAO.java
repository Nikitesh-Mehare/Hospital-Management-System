/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hms.dao;

import com.hms.model.Prescription;
import com.hms.util.DbConnection;
import java.sql.*;


public class PrescriptionDAO {
    public static boolean addPrescription(Prescription p)
    {
        try{
            Connection con = DbConnection.getConnection();
            String q = "insert into prescription(appointment_id, diagnosis, medicines, remarks) values(?,?,?,?)";
            
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, p.getAppointment_id());
            pstmt.setString(2, p.getDiagnosis());
            pstmt.setString(3, p.getMedicines());
            pstmt.setString(4, p.getRemarks());
            
            int row = pstmt.executeUpdate();
            
            return row>0;
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return false;
 
    }
    
    public static  ResultSet getPrescriptionByPatient(int patient_id)
    {
        ResultSet rs = null;
        try{
                Connection con = DbConnection.getConnection();
                String q = "select d.doctor_name, a.appointment_date, pr.appointment_id, pr.diagnosis, pr.medicines, pr.remarks from prescription pr JoIN appointment a ON pr.appointment_id = a.appointment_id  JOIN doctor d ON a.doctor_id = d.doctor_id where a.patient_id = ? ";

                PreparedStatement pstmt = con.prepareStatement(q);
                pstmt.setInt(1, patient_id);

                rs = pstmt.executeQuery();
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return rs;
      
        
        
    }
    
}
