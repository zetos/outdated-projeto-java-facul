package controller.adm.categoria;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Categoria;
import dao.CategoriaDAO;

@WebServlet("/CategoriaAlterar")
public class AlterarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoriaDAO daoCategoria;
	private RequestDispatcher rd = null;

	public AlterarServlet() throws Exception {
		daoCategoria = new CategoriaDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		String categoriaId = request.getParameter("categoriaId");

		if (categoriaId == null) {
			rd = request.getRequestDispatcher("/CategoriaListar");
		} else {
			try {
				request.setAttribute("categoria", daoCategoria.procurar(Integer.parseInt(categoriaId)));
			} catch (Exception e) {
				e.printStackTrace();
			}
			rd = request.getRequestDispatcher("adm/categoria/alterar.jsp");
		}
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		try {
			Categoria categoria = new Categoria();
			categoria.setCategoriaId(Integer.parseInt(request.getParameter("categoriaId")));
			categoria.setNome(request.getParameter("nome"));
			categoria.setFaixaEtaria(request.getParameter("faixaEtaria"));
			categoria.setLinha(request.getParameter("linha"));
			daoCategoria.atualizar(categoria);
		} catch (Exception e) {
			e.printStackTrace();
		}

		rd = request.getRequestDispatcher("/CategoriaListar");
		rd.forward(request, response);
	}

}
