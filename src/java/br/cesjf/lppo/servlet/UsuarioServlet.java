
package br.cesjf.lppo.servlet;

import br.cesjf.lppo.Usuario;
import br.cesjf.lppo.dao.UsuarioJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;


@WebServlet(name = "UsuarioServlet", urlPatterns = {"/criar.html", "/listar.html", "/excluir.html", "/editar.html"})
public class UsuarioServlet extends HttpServlet {

    @PersistenceUnit(unitName = "trbflppo-2017-1PU")
    EntityManagerFactory emf;
    
    @Resource(name = "java:comp/UserTransaction")
    UserTransaction ut;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         if (request.getServletPath().contains("/editar.html")) {
            
        } else if(request.getServletPath().contains("/excluir.html")){
            
        } else if(request.getServletPath().contains("/listar.html")){
            doListarGet(request, response);
        } else if(request.getServletPath().contains("/criar.html")){
            doCriarGet(request, response);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         if (request.getServletPath().contains("/editar.html")) {
            
        } if (request.getServletPath().contains("/criar.html")) {
            doCriarPost(request, response);
        } 
        
    }


    private void doListarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     List<Usuario> usuarios = new ArrayList<>();
        UsuarioJpaController dao = new UsuarioJpaController(ut, emf);
        usuarios = dao.findUsuarioEntities();
        
        request.setAttribute("usuarios", usuarios);
        request.getRequestDispatcher("WEB-INF/listar-usuarios.jsp").forward(request, response);
    }

    private void doCriarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("WEB-INF/cria-usuario.jsp").forward(request, response);
    }

    private void doCriarPost(HttpServletRequest request, HttpServletResponse response) {
        Usuario usuario1 = new Usuario();
        usuario1.setNomecompleto(request.getParameter("nomecompleto"));
        usuario1.setEmail(request.getParameter("email"));
        usuario1.setSenha(request.getParameter("senha"));

        UsuarioJpaController dao = new UsuarioJpaController(ut, emf);
        try {
            dao.create(usuario1);
            response.sendRedirect("listar.html");
        } catch (Exception ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
