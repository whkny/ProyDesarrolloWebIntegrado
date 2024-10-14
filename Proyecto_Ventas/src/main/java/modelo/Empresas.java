
package modelo;

public class Empresas {
   
  private String cod_emp;
  private String nom_emp;
  private String direc_emp;
  private String telef_emp;
  private String email_emp;

  
  public Empresas(String cod_emp, String nom_emp, String direc_emp, String telef_emp, String email_emp) {
    this.cod_emp = cod_emp;
    this.nom_emp = nom_emp;
    this.direc_emp = direc_emp;
    this.telef_emp = telef_emp;
    this.email_emp = email_emp;
}

  @Override
public String toString() {
    return "Empresas{" +
           "cod_emp='" + cod_emp + '\'' +
           ", nom_emp='" + nom_emp + '\'' +
           ", direc_emp='" + direc_emp + '\'' +
           ", telef_emp='" + telef_emp + '\'' +
           ", email_emp='" + email_emp + '\'' +
           '}';
}


public Empresas() {
    // Constructor vacío
}
  
    public String getCod_emp() {
        return cod_emp;
    }

    public void setCod_emp(String cod_emp) {
        this.cod_emp = cod_emp;
    }

    public String getNom_emp() {
        return nom_emp;
    }

    public void setNom_emp(String nom_emp) {
        this.nom_emp = nom_emp;
    }

    public String getDirec_emp() {
        return direc_emp;
    }

    public void setDirec_emp(String direc_emp) {
        this.direc_emp = direc_emp;
    }

    public String getTelef_emp() {
        return telef_emp;
    }

    public void setTelef_emp(String telef_emp) {
        this.telef_emp = telef_emp;
    }

    public String getEmail_emp() {
        return email_emp;
    }

    public void setEmail_emp(String email_emp) {
        this.email_emp = email_emp;
    }
    
    
}
