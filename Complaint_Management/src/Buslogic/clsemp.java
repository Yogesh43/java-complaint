
package Buslogic;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class clsemp {
    
    CallableStatement stm;
    public void save_rec(clsempprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call insemp(?,?,?,?)}");
            stm.setString(1,p.getempnam());    
            stm.setString(2,p.getemppic());
            stm.setString(3,p.getemploc());
            stm.setString(4, p.getempphnno());
            
            stm.execute();
            obj.disconnect();
            
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
            
        }
    }
    public void upd_rec(clsempprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call updemp(?,?,?,?,?,?)}");
            stm.setInt(1, p.getempcod());
            stm.setString(2,p.getempnam());    
            stm.setString(3,p.getemppic());
            stm.setString(4,p.getemploc());
            stm.setString(5, p.getempphnno());
            
            stm.execute();
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }    
    public List<clsempprp> disp_rec()
    {
        List<clsempprp> arr=new ArrayList<clsempprp>();
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call dspemp()}");
            ResultSet rs=stm.executeQuery();
            
            while(rs.next())
            {
                clsempprp p=new clsempprp();
                p.setempcod(rs.getInt("empcod"));
                p.setempnam(rs.getString("empnam"));
               p.setemppic(rs.getString("emppic"));
                p.setemploc(rs.getString("emploc"));               
                p.setempphnno(rs.getString("empphnno"));              
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
    
    
    
     public List<clsempprp> dspempbyloc(String loc)
    {
        List<clsempprp> arr=new ArrayList<clsempprp>();
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call dspempbyloc(?)}");
            stm.setString(1, loc);
            ResultSet rs=stm.executeQuery();
            
            while(rs.next())
            {
                clsempprp p=new clsempprp();
                p.setempcod(rs.getInt("empcod"));
                p.setempnam(rs.getString("empnam"));
               p.setemppic(rs.getString("emppic"));
                p.setemploc(rs.getString("emploc"));               
                p.setempphnno(rs.getString("empphnno"));              
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
     
  public  clsempprp find_rec(int ecod)
    {
        clsempprp p=new clsempprp();
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call findemp(?)}");
            stm.setInt(1, ecod);
            ResultSet rs=stm.executeQuery();
            if(rs.next())
            {
             p.setempcod(rs.getInt("empcod"));
                p.setempnam(rs.getString("empnam"));
               p.setemppic(rs.getString("emppic"));
                p.setemploc(rs.getString("emploc"));               
                p.setempphnno(rs.getString("empphnno"));
                
            }
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
        return p;
    }
   
 public void del_rec(clsempprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call delemp(?)}");
            stm.setInt(1,p.getempcod());
            stm.execute();
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }
}
