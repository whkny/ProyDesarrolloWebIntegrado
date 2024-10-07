package modelo;

public class Notas {
    private String codc;
    private String nomc;
    private int exp;
    private int exf;
    public double prome(){
      return (exp+exf)/2.0;  
    }
    public String Obser(){
       return prome()>=11.5?"Aprobado":"Desaprobado";
    }

    public String getCodc() {
        return codc;
    }

    public void setCodc(String codc) {
        this.codc = codc;
    }

    public String getNomc() {
        return nomc;
    }

    public void setNomc(String nomc) {
        this.nomc = nomc;
    }

    public int getExp() {
        return exp;
    }

    public void setExp(int exp) {
        this.exp = exp;
    }

    public int getExf() {
        return exf;
    }

    public void setExf(int exf) {
        this.exf = exf;
    }
    
}
