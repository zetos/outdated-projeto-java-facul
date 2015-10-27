package controller.adm.produto;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.core.compiler.CategorizedProblem;

import bean.Categoria;
import bean.Produto;
import dao.CategoriaDAO;
import dao.ProdutoDAO;

@WebServlet("/ProdutoAlterar")
public class AlterarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoriaDAO daoCategoria;
	private ProdutoDAO daoProduto;
	private RequestDispatcher rd = null;

	public AlterarServlet() throws Exception {
		daoCategoria = new CategoriaDAO();
		daoProduto = new ProdutoDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		String produtoId = request.getParameter("produtoId");

		if (produtoId == null) {
			rd = request.getRequestDispatcher("/ProdutoListar");
		} else {
			try {
				request.setAttribute("produto", daoProduto.procurar(Integer.parseInt(produtoId)));
				request.setAttribute("listarCategorias", daoCategoria.listarCategorias());
			} catch (Exception e) {
				e.printStackTrace();
			}
			rd = request.getRequestDispatcher("adm/produto/alterar.jsp");
		}
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");

		try {
			Produto produto = new Produto();
			produto.setProdutoId(Integer.parseInt(request.getParameter("categoriaId")));
			produto.setNome(request.getParameter("nome"));
			produto.setDescricao(request.getParameter("descricao"));
			produto.setPreco(request.getParameter("preco"));		
			produto.setImg(request.getParameter("img"));
			produto.setCategoria(daoCategoria.procurar(Integer.parseInt(request.getParameter("categoriaId"))));
			daoProduto.atualizar(produto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		rd = request.getRequestDispatcher("/ProdutoListar");
		rd.forward(request, response);
	}

}
