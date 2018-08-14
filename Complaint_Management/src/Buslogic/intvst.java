
package Buslogic;

import java.util.Date;
public interface intvst {
    public void setvstcod(int vcod);
    public void setvstdat(Date vdat);
    public void setvstcmpcod(int vcmpcod);
    public void setvstdsc(String vdsc);
    public void setvstfed(int vfed);
   
    public int getvstcod();
    public Date getvstdat();
    public int getvstcmpcod();
    public String getvstdsc(); 
    public int getvstfed();
}
