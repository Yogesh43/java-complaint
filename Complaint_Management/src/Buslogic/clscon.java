package Buslogic;

import java.sql.Connection;
import java.sql.DriverManager;
public final class clscon
{
    Connection con;
    static clscon db;
    private clscon()
    {
        
    }
    public static clscon getInstance()
    {
        if(db==null)
            db=new clscon();
        return db;
    }
    void connect()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/complaintms","root","");
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }
    void disconnect()
    {
        try
        {
        con.close();
        }
        catch(Exception exp)
        {
            exp.printStackTrace();
        }
    }
}

