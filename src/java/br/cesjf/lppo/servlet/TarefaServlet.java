package br.cesjf.lppo.servlet;

import br.cesjf.lppo.Tarefa;
import br.cesjf.lppo.dao.TarefaJpaController;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * @author Adriano
 */
@WebServlet(name = "TarefaServlet", urlPatterns = {"/criarTarefa.html", "/listarTarefa.html", "/excluirTarefa.html", "/editarTarefa.html"})
public class TarefaServlet extends HttpServlet {

    @PersistenceUnit(unitName = "trbflppo-2017-1PU")
    EntityManagerFactory emf;

    @Resource(name = "java:comp/UserTransaction")
    UserTransaction ut;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getServletPath().contains("/editarTarefa.html")) {
            doEditarGet(request, response);
        } else if (request.getServletPath().contains("/excluirTarefa.html")) {
            doExcluirGet(request, response);
            response.sendRedirect("listarTarefa.html");
        } else if (request.getServletPath().contains("/listarTarefa.html")) {
            doListarGet(request, response);
        } else if (request.getServletPath().contains("/criarTarefa.html")) {
            doCriarGet(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getServletPath().contains("/editarTarefa.html")) {
            doEditarPost(request, response);
        }
        if (request.getServletPath().contains("/criarTarefa.html")) {
            try {
                doCriarPost(request, response);
            } catch (ParseException ex) {
                Logger.getLogger(TarefaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void doListarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Tarefa> tarefas = new ArrayList<>();
        TarefaJpaController dao = new TarefaJpaController(ut, emf);
        tarefas = dao.findTarefaEntities();

        request.setAttribute("tarefas", tarefas);
        request.getRequestDispatcher("WEB-INF/listar-tarefas.jsp").forward(request, response);
    }

    private void doCriarGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/cria-tarefa.jsp").forward(request, response);
    }

    private void doCriarPost(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        Date data = formato.parse(request.getParameter("dt-concluir"));
        Tarefa tarefa1 = new Tarefa();
        tarefa1.setTitulo(request.getParameter("titulo"));
        tarefa1.setDescricao(request.getParameter("descricao"));
        tarefa1.setData_concluir(data);

        TarefaJpaController dao = new TarefaJpaController(ut, emf);
        try {
            dao.create(tarefa1);
            response.sendRedirect("listarTarefa.html");
        } catch (Exception ex) {
            Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void doEditarGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            TarefaJpaController dao = new TarefaJpaController(ut, emf);
            Long id = Long.parseLong(request.getParameter("id"));
            Tarefa tarefa = dao.findTarefa(id);
            request.setAttribute("tarefa", tarefa);
            request.getRequestDispatcher("WEB-INF/editar-tarefa.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("listarTarefa.html");

        }

    }

    private void doEditarPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            Date data = formato.parse(request.getParameter("dt-concluir"));
            Date dtConclusao = formato.parse(request.getParameter("dt-concluida"));
            TarefaJpaController dao = new TarefaJpaController(ut, emf);
            Long id = Long.parseLong(request.getParameter("id"));
            Tarefa tarefa = dao.findTarefa(id);
            tarefa.setTitulo(request.getParameter("titulo"));
            tarefa.setDescricao(request.getParameter("descricao"));
            tarefa.setData_concluir(data);
            tarefa.setData_conclusao(dtConclusao);
            dao.edit(tarefa);

            response.sendRedirect("listarTarefa.html");

        } catch (Exception e) {
            response.sendRedirect("listarTarefa.html");

        }
    }

    private void doExcluirGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            TarefaJpaController dao = new TarefaJpaController(ut, emf);
            Long id = Long.parseLong(request.getParameter("id"));

            dao.destroy(id);
        } catch (Exception ex) {
            response.sendRedirect("listarTarefa.html");
        }
    }
}
