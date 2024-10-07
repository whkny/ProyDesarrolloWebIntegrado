package controlador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Negocio;
import modelo.Alumno;
public class control extends HttpServlet {
     Negocio obj=new Negocio();
     Alumno alu=new Alumno();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    int op=Integer.parseInt(request.getParameter("opc"));
    if(op==1)lisalu(request, response);
    if(op==2)lispago(request, response);
    if(op==3)lisnota(request, response);
     if(op==4)allAlu(request, response);
     if(op==5)editar(request, response);
     if(op==7)adiAlu(request, response);
     if(op==6)delAlu(request, response);
     
    }
    //borrar alumno
    
    protected void delAlu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod=request.getParameter("id");
        obj.borra(cod);
        request.setAttribute("dato", obj.getAllAlu());
        request.setAttribute("titulo", "Registro de Alumnos");
        request.setAttribute("nro", 7);
        request.setAttribute("alu", new Alumno());
        String pag="pagCrudAlu.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    
    
    //editar alumno pasando un codigp
     protected void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod=request.getParameter("id");
         
        request.setAttribute("dato", obj.getAllAlu());
        request.setAttribute("titulo", "Actualizar Dato Alumno");
        request.setAttribute("nro", 7);
        request.setAttribute("alu", obj.busAlu(cod));
        String pag="pagCrudAlu.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    
    
    
    protected void allAlu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("dato", obj.getAllAlu());
        request.setAttribute("titulo", "Registro de Alumnos");
        request.setAttribute("nro", 7);
        request.setAttribute("alu", alu);
        String pag="pagCrudAlu.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    //grabar
    protected void adiAlu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sw=0;//0=adicionar 1=actualizar
        if(request.getParameter("coda")!=null && request.getParameter("coda").length()>1){
          alu.setCoda(request.getParameter("coda"));
          sw=1;
        }
        alu.setApea(request.getParameter("ape"));
        alu.setNoma(request.getParameter("noma"));
        alu.setCode(request.getParameter("codes"));
        alu.setProce(request.getParameter("proce"));
        if(sw==0)
        obj.adicion(alu);
        else
           obj.cambia(alu);
        
        request.setAttribute("dato", obj.getAllAlu());
        request.setAttribute("titulo", "Registro de Alumnos");
        request.setAttribute("nro", 7);
        request.setAttribute("alu", new Alumno());
        String pag="pagCrudAlu.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    
    
    protected void lisalu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code=request.getParameter("id");
        String nome=request.getParameter("nome");
        request.setAttribute("dato", obj.LisAlu(code));
        request.setAttribute("nome", nome);
        
        String pag="pagAlumno.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
protected void lispago(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String coda=request.getParameter("id");
        request.setAttribute("dato", obj.LisPago(coda));
        String pag="pagPago.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
protected void lisnota(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String coda=request.getParameter("id");
        request.setAttribute("dato", obj.LisNota(coda));
        String pag="pagNota.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    

    
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
