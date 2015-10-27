package controller.adm.produto;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Categoria;
import bean.Produto;
import dao.CategoriaDAO;
import dao.ProdutoDAO;

@WebServlet("/ProdutoAdicionar")
public class AdicionarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoriaDAO daoCategoria;
	private ProdutoDAO daoProduto;
	private RequestDispatcher rd = null;
	
    public AdicionarServlet() throws Exception {
    	daoProduto = new ProdutoDAO();
    	daoCategoria = new CategoriaDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		Produto produto = new Produto();
		
		try {
			produto.setNome(request.getParameter("nome"));
			produto.setDescricao(request.getParameter("descricao"));
			produto.setPreco(request.getParameter("preco"));		
			produto.setImg(request.getParameter("img"));
			produto.setCategoria(daoCategoria.procurar(Integer.parseInt(request.getParameter("categoriaId"))));
			daoProduto.salvar(produto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rd = request.getRequestDispatcher("/ProdutoListar");
		rd.forward(request, response);
	}
}
