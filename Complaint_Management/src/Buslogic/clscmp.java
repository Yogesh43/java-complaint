
package Buslogic;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class clscmp {
    CallableStatement stm;
    public int save_rec(clscmpprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call inscmp(?,?,?,?,?,?)}");
            stm.setInt(1,p.getcmpaccno());
            java.sql.Date s = new java.sql.Date(p.getcmpdat().getTime());
            stm.setDate(2,s);
            stm.setString(3,p.getcmpdsc());
            stm.setInt(4,p.getcmpasgempcod());
            stm.setString(5, p.getcmpsts());
  stm.registerOutParameter(6,Types.INTEGER);
            stm.execute();
      int a=stm.getInt(6);
            obj.disconnect();
            return a;
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
            
        }
        return -1;
    }
    public void upd_rec(clscmpprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call updcmp(?,?)}");
            stm.setInt(1, p.getcmpcod());
          
            stm.setString(2, p.getcmpsts());
            
            stm.execute();
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }    
    public List<clscmpprp> disp_rec()
    {
        List<clscmpprp> arr=new ArrayList<clscmpprp>();
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call dspcmp()}");
            ResultSet rs=stm.executeQuery();
            
            while(rs.next())
            {
                clscmpprp p=new clscmpprp();
                p.setcmpcod(rs.getInt("cmpcod"));
                p.setcmpaccno(rs.getInt("cmpaccno"));
               p.setcmpdat(rs.getDate("cmpdat"));
                p.setcmpdsc(rs.getString("cmpdsc"));               
                p.setcmpasgempcod(rs.getInt("cmpasgempcod"));
               p.setcmpsts(rs.getString("cmpsts"));
                            
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
     public ResultSet dispcmpofmonth() 
  {
      ResultSet rs=null;
      try {
          clscon obj=clscon.getInstance();
          obj.connect();
          CallableStatement stm=obj.con.prepareCall
                ("{call dispcurrmonthrep()}");
         
          rs=stm.executeQuery();
         // obj.disconnect();
      } catch (SQLException ex) {
          Logger.getLogger(clsrep.class.getName()).log(Level.SEVERE, null, ex);
      }
      return rs;
  }
  public  clscmpprp find_rec(int ccod)
    {
        clscmpprp p=new clscmpprp();
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call findcmp(?)}");
            stm.setInt(1, ccod);
            ResultSet rs=stm.executeQuery();
            if(rs.next())
            {
               p.setcmpcod(rs.getInt("cmpcod"));
                p.setcmpaccno(rs.getInt("cmpaccno"));
               p.setcmpdat(rs.getDate("cmpdat"));
                p.setcmpdsc(rs.getString("cmpdsc"));               
                p.setcmpasgempcod(rs.getInt("cmpasgempcod"));
               p.setcmpsts(rs.getString("cmpsts"));
                
            }
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
        return p;
    }
   
 public void del_rec(clscmpprp p)
    {
        try
        {
            clscon obj=clscon.getInstance();
            obj.connect();
            stm=obj.con.prepareCall("{call delcmp(?)}");
            stm.setInt(1,p.getcmpcod());
            stm.execute();
            obj.disconnect();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }
}
