
package modelo;

public class Ventas {
   private int mes;
   private double monto;
   
public String Lmes(){
 String vec[]={"","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto",
     "Setiembre","Octbre","Noviembre","Diciembre"};   
    return vec[mes];
}   

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

}
