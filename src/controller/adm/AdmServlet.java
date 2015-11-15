package controller.adm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDAO;

/**
 * Servlet implementation class AdmServlet
 */
@WebServlet("/Adm")
public class AdmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioDAO dao;
	private RequestDispatcher rd = null;
	
    public AdmServlet() {    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try {
			dao = new UsuarioDAO();
			if(dao.Logar(request.getParameter("usuario"), request.getParameter("senha")))
			{
				rd = request.getRequestDispatcher("/CategoriaListar");
			} else {
				rd = request.getRequestDispatcher("/Adm");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		rd.forward(request, response);
	}

}
