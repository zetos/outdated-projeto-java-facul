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

@WebServlet("/UsuarioAdicionar")
public class AdicionarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO daoUsuario;
	private RequestDispatcher rd = null;
	
    public AdicionarServlet() throws Exception { 
    	daoUsuario = new UsuarioDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		Usuario usuario = new Usuario();
		
		try {
			usuario.setNome(request.getParameter("nome"));
			usuario.setLogin(request.getParameter("login"));
			usuario.setSenha(request.getParameter("senha"));
			daoUsuario.salvar(usuario);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rd = request.getRequestDispatcher("/UsuarioListar");
		rd.forward(request, response);
	}
}
