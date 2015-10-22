package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Produto;
import dao.ProdutoDAO;

@WebServlet("/Produto")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProdutoDAO dao;
	private Produto produto;

	public ProdutoServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		RequestDispatcher rd = null;

		try {
			produto = dao.procurar(Integer.parseInt(request.getParameter("produtoId")));
		} catch (Exception e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession(true);
		session.setAttribute("produto", produto);

		rd = request.getRequestDispatcher("/produto.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
