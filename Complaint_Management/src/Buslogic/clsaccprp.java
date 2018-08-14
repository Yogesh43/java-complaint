/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Buslogic;

import java.util.Date;

/**
 *
 * @author csgroup
 */

    public class clsaccprp implements intacc
{
    private int accno;
    private String accnam,accadd,accloc,accphnno,acctyp;
    public Date acccrtdat;
    {
        accnam=new String();
         accadd=new String();
          accloc=new String();
           accphnno=new String();
            acctyp=new String();
    }

    @Override
    public void setaccno(int ano) {
       accno=ano;
    }

    @Override
    public void setaccnam(String anam) {
       accnam=anam;
    }

    @Override
    public void setacccrtdat(Date adat) {
       acccrtdat=adat;
    }

    @Override
    public void setaccadd(String aadd) {
      accadd=aadd;
    }

    @Override
    public void setaccloc(String aloc) {
     accloc=aloc;
    }

    @Override
    public void setaccphnno(String aphnno) {
    accphnno=aphnno;
    }

    @Override
    public void setacctyp(String atyp) {
       acctyp=atyp;
    }

    @Override
    public int getaccno() {
       return accno;
    }

    @Override
    public String getaccnam() {
        return accnam;
    }

    @Override
    public Date getacccrtdat() {
       return acccrtdat;
    }

    @Override
    public String getaccadd() {
        return accadd;
    }

    @Override
    public String getaccloc() {
        return accloc;
    }

    @Override
    public String getaccphnno() {
       return accphnno;
    }

    @Override
    public String getacctyp() {
        return acctyp;
    }

    
}

