package controller.adm.usuario;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Categoria;
import bean.Usuario;
import dao.CategoriaDAO;
import dao.UsuarioDAO;

@WebServlet("/UsuarioAlterar")
public class AlterarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO daoUsuario;
	private RequestDispatcher rd = null;

	public AlterarServlet() throws Exception {
		daoUsuario = new UsuarioDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		String usuarioId = request.getParameter("usuarioId");

		if (usuarioId == null) {
			rd = request.getRequestDispatcher("/UsuarioListar");
		} else {
			try {
				request.setAttribute("usuario", daoUsuario.procurar(Integer.parseInt(usuarioId)));
			} catch (Exception e) {
				e.printStackTrace();
			}
			rd = request.getRequestDispatcher("adm/usuario/alterar.jsp");
		}
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		try {
			Usuario usuario = new Usuario();
			usuario.setUsuarioId(Integer.parseInt(request.getParameter("usuarioId")));
			usuario.setNome(request.getParameter("nome"));
			usuario.setLogin(request.getParameter("login"));
			usuario.setSenha(request.getParameter("senha"));
			daoUsuario.atualizar(usuario);
		} catch (Exception e) {
			e.printStackTrace();
		}

		rd = request.getRequestDispatcher("/UsuarioListar");
		rd.forward(request, response);
	}

}