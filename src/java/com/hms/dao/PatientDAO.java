
package com.hms.dao;

import com.hms.model.Patient;
import com.hms.util.DbConnection;
import java.sql.*;


public class PatientDAO {
    
    public static void registerPatient(Patient p)
    {
        
        try{
            Connection con = DbConnection.getConnection();
            String q = "insert into patient(patient_name, email, password, gender, contact, address) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, p.getPatient_name());
            pstmt.setString(2, p.getEmail());
            pstmt.setString(3, p.getPassword());
            pstmt.setString(4, p.getGender());
            pstmt.setString(5, p.getContact());
            pstmt.setString(6, p.getAddress());

            pstmt.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        
    }
    
    
    public static Patient loginPatient(String email, String password)
    {
         Patient p = null;
        try{
        Connection con = DbConnection.getConnection();
        String q = "select * from patient where email = ? AND password = ?";
        PreparedStatement pstmt = con.prepareStatement(q);
        
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        
        ResultSet rs = pstmt.executeQuery();
        
       
        if(rs.next())
        {
            p = new Patient();
            
            int id = rs.getInt("patient_id");
            String patient_name = rs.getString("patient_name");
            
            p.setPatient_id(id);
            p.setPatient_name(patient_name);
        }
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return p;
    }
}
