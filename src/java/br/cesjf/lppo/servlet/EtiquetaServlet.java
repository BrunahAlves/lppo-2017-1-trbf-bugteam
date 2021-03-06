package br.cesjf.lppo.servlet;

import br.cesjf.lppo.Etiqueta;
import br.cesjf.lppo.Tarefa;
import br.cesjf.lppo.Usuario;
import br.cesjf.lppo.dao.EtiquetaJpaController;
import br.cesjf.lppo.dao.TarefaJpaController;
import br.cesjf.lppo.dao.UsuarioJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Bruna Alves
 */
@WebServlet(name = "EtiquetaServlet", urlPatterns = {"/criarEtiqueta.html", "/listarEtiqueta.html", "/excluirEtiqueta.html", "/editarEtiqueta.html", "/listarEtiquetaPorAutor.html", "/listarEtiquetaPorAutoreTitulo.html"})
public class EtiquetaServlet extends HttpServlet {

    @PersistenceUnit(unitName = "trbflppo-2017-1PU")
    EntityManagerFactory emf;

    @Resource(name = "java:comp/UserTransaction")
    UserTransaction ut;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getServletPath().contains("/editarEtiqueta.html")) {
            doEditarGet(request, response);
        } else if (request.getServletPath().contains("/excluirEtiqueta.html")) {
            doExcluirGet(request, response);
            response.sendRedirect("listarEtiqueta.html");
        } else if (request.getServletPath().contains("/listarEtiqueta.html")) {
            doListarGet(request, response);
        } else if (request.getServletPath().contains("/criarEtiqueta.html")) {
            doCriarGet(request, response);
        } else if (request.getServletPath().contains("/listarEtiquetaPorAutor.html")) {
            doListarEtiquetaPorAutorGet(request, response);
        } else if (request.getServletPath().contains("/listarEtiquetaPorAutoreTitulo.html")) {
            doListarEtiquetaPorAutoreTituloGet(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getServletPath().contains("/editarEtiqueta.html")) {
            doEditarPost(request, response);
        }
        if (request.getServletPath().contains("/criarEtiqueta.html")) {
            doCriarPost(request, response);
        }
        if (request.getServletPath().contains("/listarEtiquetaPorAutor.html")) {
            doListarEtiquetaPorAutorPost(request, response);
        }
        if (request.getServletPath().contains("/listarEtiquetaPorAutoreTitulo.html")) {
            doListarEtiquetaPorAutoreTituloPost(request, response);
        }
    }

    private void doListarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Etiqueta> etiquetas = new ArrayList<>();
        EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
        etiquetas = dao.findEtiquetaEntities();

        request.setAttribute("etiquetas", etiquetas);
        request.getRequestDispatcher("WEB-INF/listar-etiquetas.jsp").forward(request, response);
    }

    private void doCriarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/cria-etiqueta.jsp").forward(request, response);
    }

    private void doCriarPost(HttpServletRequest request, HttpServletResponse response) {
        Etiqueta etiqueta1 = new Etiqueta();
        UsuarioJpaController u = new UsuarioJpaController(ut, emf);
        TarefaJpaController t = new TarefaJpaController(ut, emf);
        etiqueta1.setUsuario((u.findUsuario(Long.parseLong(request.getParameter("usuario_id")))));
        etiqueta1.setTarefa((t.findTarefa(Long.parseLong(request.getParameter("tarefa_id")))));
        etiqueta1.setTitulo(request.getParameter("titulo"));

        EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
        try {
            dao.create(etiqueta1);
            response.sendRedirect("listarEtiqueta.html");
        } catch (Exception ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void doEditarGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
            Long id = Long.parseLong(request.getParameter("id"));
            Etiqueta etiqueta = dao.findEtiqueta(id);
            request.setAttribute("etiqueta", etiqueta);
            request.getRequestDispatcher("WEB-INF/editar-etiqueta.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("listarEtiqueta.html");

        }

    }

    private void doEditarPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {

            /**
             * Etiqueta etiqueta1 = new Etiqueta(); UsuarioJpaController u = new
             * UsuarioJpaController(ut, emf); TarefaJpaController t = new
             * TarefaJpaController(ut, emf);
             * etiqueta1.setUsuario((u.findUsuario(Long.parseLong(request.getParameter("usuario_id")))));
             * etiqueta1.setTarefa((t.findTarefa(Long.parseLong(request.getParameter("tarefa_id")))));
             * etiqueta1.setTitulo(request.getParameter("titulo"));
             *
             */
            EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
            Long id = Long.parseLong(request.getParameter("id"));
            Etiqueta etiqueta = dao.findEtiqueta(id);
            UsuarioJpaController u = new UsuarioJpaController(ut, emf);
            TarefaJpaController t = new TarefaJpaController(ut, emf);

            etiqueta.setUsuario((u.findUsuario(Long.parseLong(request.getParameter("usuario_id")))));
            etiqueta.setTarefa((t.findTarefa(Long.parseLong(request.getParameter("tarefa_id")))));
            etiqueta.setTitulo(request.getParameter("titulo"));

            dao.edit(etiqueta);

            response.sendRedirect("listarEtiqueta.html");

        } catch (Exception e) {
            response.sendRedirect("listarEtiqueta.html");
        }

    }

    private void doExcluirGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
            Long id = Long.parseLong(request.getParameter("id"));

            dao.destroy(id);
        } catch (Exception ex) {
            response.sendRedirect("listarEtiqueta.html");
        }
    }

    private void doListarEtiquetaPorAutorGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Long id = Long.parseLong(request.getParameter("id"));

        List<Etiqueta> etiquetas = new ArrayList<>();
        EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
        etiquetas = dao.findEtiquetaEntities();
        //    etiquetas = dao.; JPQL - SELECT
        List<Usuario> usuarios = new ArrayList<>();
        UsuarioJpaController dao2 = new UsuarioJpaController(ut, emf);
        usuarios = dao2.findUsuarioEntities();

        request.setAttribute("usuarios", usuarios);
        request.setAttribute("etiquetas", etiquetas);
        request.getRequestDispatcher("WEB-INF/listar-etiquetasporautor.jsp").forward(request, response);
    }

    private void doListarEtiquetaPorAutorPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("usuario"));

        List<Etiqueta> etiquetas2 = new ArrayList<>();
        EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
        etiquetas2 = dao.getEtiquetaByAutor(id);

        List<Usuario> usuarios = new ArrayList<>();
        UsuarioJpaController dao2 = new UsuarioJpaController(ut, emf);
        usuarios = dao2.findUsuarioEntities();

        List<Etiqueta> etiquetas = new ArrayList<>();
        etiquetas = dao.findEtiquetaEntities();

        request.setAttribute("usuarios", usuarios);
        request.setAttribute("etiquetas", etiquetas);
        request.setAttribute("etiquetas2", etiquetas2);
        request.getRequestDispatcher("WEB-INF/listar-etiquetasporautor.jsp").forward(request, response);
    }

    private void doListarEtiquetaPorAutoreTituloGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Long id = Long.parseLong(request.getParameter("id"));

        List<Etiqueta> etiquetas = new ArrayList<>();
        EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
        etiquetas = dao.findEtiquetaEntities();
        //    etiquetas = dao.; JPQL - SELECT
        List<Usuario> usuario = new ArrayList<>();
        UsuarioJpaController dao2 = new UsuarioJpaController(ut, emf);
        usuario = dao2.findUsuarioEntities();

        request.setAttribute("usuario", usuario);
        request.setAttribute("etiquetas", etiquetas);
        request.getRequestDispatcher("WEB-INF/listar-etiquetasporautoretitulo.jsp").forward(request, response);
    }

    private void doListarEtiquetaPorAutoreTituloPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        Long id = Long.parseLong(request.getParameter("id"));

        List<Etiqueta> etiquetas2 = new ArrayList<>();
        EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
        etiquetas2 = dao.getEtiquetaByAutorAndTitulo(titulo, id);

        List<Etiqueta> etiquetas = new ArrayList<>();
        etiquetas = dao.findEtiquetaEntities();

        List<Usuario> usuario = new ArrayList<>();
        UsuarioJpaController dao2 = new UsuarioJpaController(ut, emf);
        usuario = dao2.findUsuarioEntities();

        request.setAttribute("usuario", usuario);
        request.setAttribute("etiquetas", etiquetas);
        request.setAttribute("etiquetas2", etiquetas2);
        request.getRequestDispatcher("WEB-INF/listar-etiquetasporautoretitulo.jsp").forward(request, response);
    }

}
