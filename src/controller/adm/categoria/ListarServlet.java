package controller.adm.categoria;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoriaDAO;

@WebServlet("/CategoriaListar")
public class ListarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoriaDAO daoCategoria;

	public ListarServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		RequestDispatcher rd = null;

		try {
			daoCategoria = new CategoriaDAO();
			request.setAttribute("listarCategorias", daoCategoria.listarCategorias());
		} catch (Exception e) {
			e.printStackTrace();
		}

		rd = request.getRequestDispatcher("adm/categoria/categorias.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
