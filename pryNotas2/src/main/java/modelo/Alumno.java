package modelo;

public class Alumno {
  private String coda;
  private String apea;
  private String noma;
  private String code;
  private String proce;

  public String apeNom(){
      return apea+","+noma;
  }
  
  
    public String getCoda() {
        return coda;
    }

    public void setCoda(String coda) {
        this.coda = coda;
    }

    public String getApea() {
        return apea;
    }

    public void setApea(String apea) {
        this.apea = apea;
    }

    public String getNoma() {
        return noma;
    }

    public void setNoma(String noma) {
        this.noma = noma;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getProce() {
        return proce;
    }

    public void setProce(String proce) {
        this.proce = proce;
    }
    
}
