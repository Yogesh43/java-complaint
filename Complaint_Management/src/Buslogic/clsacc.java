/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Buslogic;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author csgroup
 */
public class clsacc 
{
     CallableStatement stm;
    public void save_rec(clsaccprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call insacc(?,?,?,?,?,?)}");
            stm.setString(1,p.getaccnam());
            java.sql.Date s = new java.sql.Date(p.getacccrtdat().getTime());
            stm.setDate(2,s);
            stm.setString(3,p.getaccadd());
            stm.setString(4,p.getaccloc());
            stm.setString(5, p.getaccphnno());
            stm.setString(6, p.getacctyp());
            stm.execute();
            obj.disconnect();
            
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
            
        }
    }
    public void upd_rec(clsaccprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call updacc(?,?,?,?,?,?,?)}");
            stm.setInt(1, p.getaccno());
            stm.setString(2,p.getaccnam());
            java.sql.Date s = new java.sql.Date(p.getacccrtdat().getTime());
            stm.setDate(3,s);
            stm.setString(4,p.getaccadd());
            stm.setString(5,p.getaccloc());
            stm.setString(6, p.getaccphnno());
            stm.setString(7, p.getacctyp());
            stm.execute();
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }    
    public List<clsaccprp> disp_rec()
    {
        List<clsaccprp> arr=new ArrayList<clsaccprp>();
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call dspacc()}");
            ResultSet rs=stm.executeQuery();
            
            while(rs.next())
            {
                clsaccprp p=new clsaccprp();
                p.setaccno(rs.getInt("accno"));
                p.setaccnam(rs.getString("accnam"));
               p.setacccrtdat(rs.getDate("acccrtdat"));
                p.setaccadd(rs.getString("accadd"));               
                p.setaccloc(rs.getString("accloc"));
               p.setaccphnno(rs.getString("accphnno"));
                p.setacctyp(rs.getString("acctyp"));              
                arr.add(p);
            }
            obj.disconnect();
            
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
        return arr;
    }
  public  clsaccprp find_rec(int ano)
    {
        clsaccprp p=new clsaccprp();
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call findacc(?)}");
            stm.setInt(1, ano);
            ResultSet rs=stm.executeQuery();
            if(rs.next())
            {
                p.setaccno(rs.getInt("accno"));
                p.setaccnam(rs.getString("accnam"));
               p.setacccrtdat(rs.getDate("acccrtdat"));
                p.setaccadd(rs.getString("accadd"));               
                p.setaccloc(rs.getString("accloc"));
               p.setaccphnno(rs.getString("accphnno"));
                p.setacctyp(rs.getString("acctyp"));  
                
            }
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
        return p;
    }
   
 public void del_rec(clsaccprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call delacc(?)}");
            stm.setInt(1,p.getaccno());
            stm.execute();
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }
}
