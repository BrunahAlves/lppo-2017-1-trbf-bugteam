package br.cesjf.lppo.servlet;

import br.cesjf.lppo.Etiqueta;
import br.cesjf.lppo.Usuario;
import br.cesjf.lppo.dao.EtiquetaJpaController;
import br.cesjf.lppo.dao.UsuarioJpaController;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
 * @author Adriano
 */
@WebServlet(name = "Kanban", urlPatterns = {"/kanban.html"})
public class KanbanServlet extends HttpServlet {

    @PersistenceUnit(unitName = "trbflppo-2017-1PU")
    EntityManagerFactory emf;

    @Resource(name = "java:comp/UserTransaction")
    UserTransaction ut;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doListarKanbanPorAutorGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doListarKanbanPorAutorPost(request, response);
    }

    private void doListarKanbanPorAutorGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Etiqueta> etiquetas = new ArrayList<>();
        EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
        etiquetas = dao.findEtiquetaEntities();

        request.setAttribute("etiquetas", etiquetas);
        request.getRequestDispatcher("WEB-INF/kanbam.jsp").forward(request, response);
    }

    private void doListarKanbanPorAutorPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("usuario"));
        List<Usuario> usuarios = new ArrayList<>();
        UsuarioJpaController dao2 = new UsuarioJpaController(ut, emf);
        usuarios = dao2.findUsuarioEntities();

        List<Etiqueta> etiquetas2 = new ArrayList<>();
        EtiquetaJpaController dao = new EtiquetaJpaController(ut, emf);
        etiquetas2 = dao.getEtiquetaByAutor(id);

        List<Etiqueta> etiquetas = new ArrayList<>();
        etiquetas = dao.findEtiquetaEntities();

        request.setAttribute("usuarios", usuarios);
        request.setAttribute("etiquetas", etiquetas);
        request.setAttribute("etiquetas2", etiquetas2);
        request.getRequestDispatcher("WEB-INF/kanbam.jsp").forward(request, response);
    }
}
