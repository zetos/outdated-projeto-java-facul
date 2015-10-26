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

@WebServlet("/CategoriaAdicionar")
public class AdicionarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoriaDAO daoCategoria;
	private RequestDispatcher rd = null;
	
    public AdicionarServlet() throws Exception { 
    	daoCategoria = new CategoriaDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		Categoria categoria = new Categoria();
		
		try {
			categoria.setNome(request.getParameter("nome"));
			categoria.setLinha(request.getParameter("linha"));
			categoria.setFaixaEtaria(request.getParameter("faixaEtaria"));
			daoCategoria.salvar(categoria);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rd = request.getRequestDispatcher("/CategoriaListar");
		rd.forward(request, response);
	}
}
