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
public class clscmpprp implements intcmp
{
    private int cmpcod,cmpaccno,cmpasgempcod;
    private String cmpdsc,cmpsts;
    public Date cmpdat;
   
    {
        cmpdsc=new String();   
        cmpsts=new String();   
    }

    @Override
    public void setcmpcod(int ccod) {
       cmpcod=ccod;
    }

    @Override
    public void setcmpaccno(int caccno) {
        cmpaccno=caccno;
    }

    @Override
    public void setcmpdat(Date cdat) {
       cmpdat=cdat;
    }

    @Override
    public void setcmpdsc(String cdsc) {
        cmpdsc=cdsc;
    }

    @Override
    public void setcmpasgempcod(int casgempcod) {
        cmpasgempcod=casgempcod;
    }

    @Override
    public void setcmpsts(String csts) {
        cmpsts=csts;
    }

    @Override
    public int getcmpcod() {
        return cmpcod;
    }

    @Override
    public int getcmpaccno() {
       return cmpaccno;
    }

    @Override
    public Date getcmpdat() {
      return cmpdat;
    }

    @Override
    public String getcmpdsc() {
       return cmpdsc;
    }

    @Override
    public int getcmpasgempcod() {
      return cmpasgempcod;
    }

    @Override
    public String getcmpsts() {
      return cmpsts;
    }
    
}
