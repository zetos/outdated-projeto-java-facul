package controller.adm.usuario;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoriaDAO;
import dao.UsuarioDAO;

@WebServlet("/UsuarioExcluir")
public class ExcluirServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO daoUsuario;
	private RequestDispatcher rd = null;

	public ExcluirServlet() throws Exception {
		daoUsuario = new UsuarioDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		rd = request.getRequestDispatcher("/UsuarioListar");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			daoUsuario.excluir(Integer.parseInt(request.getParameter("id")));
			response.setStatus(HttpServletResponse.SC_OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
