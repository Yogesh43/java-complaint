/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Buslogic;

import java.util.Date;

public interface intacc
{
    public void setaccno(int ano);
    public void setaccnam(String anam);
    public void setacccrtdat(Date adat);
    public void setaccadd(String aadd);
    public void setaccloc(String aloc);
    public void setaccphnno(String aphnno);
    public void setacctyp(String atyp);
   
    
    public int getaccno();
    public String getaccnam();
    public Date getacccrtdat();
    public String getaccadd(); 
    public String getaccloc();
    public String getaccphnno();
    public String getacctyp();
}
