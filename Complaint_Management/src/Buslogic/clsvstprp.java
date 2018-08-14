
package Buslogic;

import java.util.Date;


public class clsvstprp implements intvst
{
    private int vstcod,vstcmpcod,vstfed;
    private String vstdsc;
   private Date vstdat;
    {
        vstdsc=new String();   
    }

    @Override
    public void setvstcod(int vcod) {
        vstcod=vcod;
    }

    @Override
    public void setvstdat(Date vdat) {
        vstdat=vdat;
    }

    @Override
    public void setvstcmpcod(int vcmpcod) {
       vstcmpcod=vcmpcod;
    }

    @Override
    public void setvstdsc(String vdsc) {
       vstdsc=vdsc;
    }

    @Override
    public void setvstfed(int vfed) {
       vstfed=vfed;
    }

    @Override
    public int getvstcod() {
        return vstcod;
    }

    @Override
    public Date getvstdat() {
        return vstdat;
    }

    @Override
    public int getvstcmpcod() {
       return vstcmpcod;
    }

    @Override
    public String getvstdsc() {
        return vstdsc;
    }

    @Override
    public int getvstfed() {
       return vstfed;
    }
    
}
