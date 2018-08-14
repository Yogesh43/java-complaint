
package Buslogic;


public class clsempprp implements intemp
{
private int empcod;
    private String empnam,emppic,emploc,empphnno;
   
    {
        empnam=new String();   
        emppic=new String();
        emploc=new String();   
        empphnno=new String();
    }
    @Override
    public void setempcod(int ecod) {
       empcod=ecod;
    }

    @Override
    public void setempnam(String enam) {
        empnam=enam;
    }

    @Override
    public void setemppic(String epic) {
        emppic=epic;
    }

    @Override
    public void setemploc(String eloc) {
       emploc=eloc;
    }

    @Override
    public void setempphnno(String ephnno) {
        empphnno=ephnno;
    }

    @Override
    public int getempcod() {
       return empcod;
    }

    @Override
    public String getempnam() {
        return empnam;
    }

    @Override
    public String getemppic() {
        return emppic;
    }

    @Override
    public String getemploc() {
        return emploc;
    }

    @Override
    public String getempphnno() {
       return empphnno;
    }
    
}
