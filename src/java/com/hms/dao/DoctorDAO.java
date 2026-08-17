/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hms.dao;

import com.hms.model.Doctor;
import com.hms.util.DbConnection;
import java.sql.*;


public class DoctorDAO {
    
    
    public static Doctor loginDoctor(String email, String password)
    {
        Doctor d = null;
        
        try{
           
            Connection con = DbConnection.getConnection();
            String q = "select * from doctor where email = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if(rs.next())
            {
                d = new Doctor();
                int doctor_id = rs.getInt("doctor_id");
                String doctor_name = rs.getString("doctor_name");
                String doctor_email = rs.getString("email");
                
                d.setDoctor_id(doctor_id);
                d.setDoctor_name(doctor_name);
                d.setEmail(doctor_email);
            }
            else{
                
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return d;
    }
    
}
