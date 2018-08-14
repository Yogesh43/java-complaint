
package Buslogic;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class clsvst {
CallableStatement stm;
    public void save_rec(clsvstprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call insvst(?,?,?,?)}");      
            java.sql.Date s = new java.sql.Date(p.getvstdat().getTime());
            stm.setDate(1,s);
            stm.setInt(2,p.getvstcmpcod());
            stm.setString(3,p.getvstdsc());
            stm.setInt(4, p.getvstfed());
            stm.execute();
            obj.disconnect();
            
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
            
        }
    }
    public void upd_rec(clsvstprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call updvst(?,?,?,?,?)}");
            stm.setInt(1, p.getvstcod());
            java.sql.Date s = new java.sql.Date(p.getvstdat().getTime());
            stm.setDate(2,s);
            stm.setInt(3,p.getvstcmpcod());
            stm.setString(4,p.getvstdsc());
            stm.setInt(5, p.getvstfed());
            stm.execute();
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }    
    public List<clsvstprp> disp_rec()
    {
        List<clsvstprp> arr=new ArrayList<clsvstprp>();
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call dspvst()}");
            ResultSet rs=stm.executeQuery();
            
            while(rs.next())
            {
                clsvstprp p=new clsvstprp();
                p.setvstcod(rs.getInt("vstcod"));
                p.setvstdat(rs.getDate("vstdat"));
               p.setvstcmpcod(rs.getInt("vstcmpcod"));
                p.setvstdsc(rs.getString("vstdsc"));               
                p.setvstfed(rs.getInt("vstfed"));                          
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
    public  clsvstprp find_rec(int vcod)
    {
        clsvstprp p=new clsvstprp();
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call findvst(?)}");
            stm.setInt(1, vcod);
            ResultSet rs=stm.executeQuery();
            if(rs.next())
            {
                p.setvstcod(rs.getInt("vstcod"));
                p.setvstdat(rs.getDate("vstdat"));
               p.setvstcmpcod(rs.getInt("vstcmpcod"));
                p.setvstdsc(rs.getString("vstdsc"));               
                p.setvstfed(rs.getInt("vstfed")); 
                
            }
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
        return p;
    }
   
    public void del_rec(clsvstprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call delvst(?)}");
            stm.setInt(1,p.getvstcod());
            stm.execute();
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }    
}
