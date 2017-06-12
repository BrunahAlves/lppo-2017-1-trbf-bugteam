package br.cesjf.lppo.servlet;

import br.cesjf.lppo.Etiqueta;
import br.cesjf.lppo.dao.EtiquetaJpaController;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "EtiquetaServlet", urlPatterns = {"/criarEtiqueta.html", "/listarEtiqueta.html", "/excluirEtiqueta.html", "/editarEtiqueta.html"})
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
        etiqueta1.setReferencia_autor(request.getParameter("referencia_autor"));
        etiqueta1.setReferencia_tarefa(request.getParameter("referencia_tarefa"));
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
            EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
            Long id = Long.parseLong(request.getParameter("id"));
            Etiqueta etiqueta = dao.findEtiqueta(id);
            etiqueta.setReferencia_autor(request.getParameter("referencia_autor"));
            etiqueta.setReferencia_tarefa(request.getParameter("referencia_tarefa"));
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
}
