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

@WebServlet("/UsuarioListar")
public class ListarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO daoUsuario;

	public ListarServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		RequestDispatcher rd = null;

		try {
			daoUsuario = new UsuarioDAO();
			request.setAttribute("listarUsuarios", daoUsuario.listarUsuarios());
		} catch (Exception e) {
			e.printStackTrace();
		}

		rd = request.getRequestDispatcher("adm/usuario/usuarios.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
