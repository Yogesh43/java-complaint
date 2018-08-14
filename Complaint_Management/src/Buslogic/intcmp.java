/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Buslogic;
import java.util.Date;
/**
 *
 * @author Ayush
 */
public interface intcmp {
    
    public void setcmpcod(int ccod);
    public void setcmpaccno(int caccno);
    public void setcmpdat(Date cdat);
    public void setcmpdsc(String cdsc);
    public void setcmpasgempcod(int casgempcod);
    public void setcmpsts(String csts);
    
    
    
    public int getcmpcod();
    public int getcmpaccno();
    public Date getcmpdat();
    public String getcmpdsc(); 
    public int getcmpasgempcod();
    public String getcmpsts();
   
   
}
