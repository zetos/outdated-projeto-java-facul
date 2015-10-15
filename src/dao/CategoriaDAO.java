package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Categoria;
import util.ConnectionFactory;

public class CategoriaDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public CategoriaDAO() throws Exception {
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage(), e);
		}
	}

	public void salvar(Categoria categoria) throws Exception {
		if (categoria == null)
			throw new Exception("O valor passado nao pode ser nulo");

		try {
			String SQL = "INSERT INTO categoria (categoriaId, nome, linha, faixaEtaria) values ( ?, ?, ?, ?)";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, categoria.getCategoriaId());
			ps.setString(2, categoria.getNome());
			ps.setString(3, categoria.getLinha());
			ps.setString(4, categoria.getFaixaEtaria());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao inserir dados " + sqle, sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}
	
	public void atualizar(Categoria categoria) throws Exception {
		if (categoria == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "UPDATE categoria set nome=?, linha=?, faixaEtaria=? WHERE categoriaId=?";
			ps = conn.prepareStatement(SQL);	
			ps.setString(1, categoria.getNome());
			ps.setString(2, categoria.getLinha());
			ps.setString(3, categoria.getFaixaEtaria());
			ps.setInt(4, categoria.getCategoriaId());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao alterar dados " + sqle, sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	public void excluir(Categoria categoria) throws Exception {
		if (categoria == null)
			throw new Exception("O valor passado nao pode ser nulo");
		
		try {
			String SQL = "DELETE FROM categoria WHERE categoriaId=?";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, categoria.getCategoriaId());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao excluir dados " + sqle, sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}
	
	public Categoria procurar(int categoriaId) throws Exception {
		try {
			Categoria categoria = new Categoria();
			String SQL = "SELECT  * FROM categoria WHERE categoriaId=?";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, categoriaId);
			rs = ps.executeQuery();
			if (rs.next()) {
				categoria.setCategoriaId(categoriaId);
				categoria.setNome(rs.getString(2));
				categoria.setLinha(rs.getString(3));
				categoria.setFaixaEtaria(rs.getString(4));
			}
			return categoria;
		} catch (SQLException sqle) {
			throw new Exception(sqle);	
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	public List<Categoria> listarCategorias() throws Exception {
		try {
			ps = conn.prepareStatement("SELECT * FROM categoria");
			rs = ps.executeQuery();
			List<Categoria> list = new ArrayList<Categoria>();
			while (rs.next()) {
				int categoriaId = rs.getInt(1);
				String nome = rs.getString(2);
				String linha = rs.getString(3);
				String faixaEtaria = rs.getString(4);
				list.add(new Categoria(categoriaId, nome, linha, faixaEtaria));
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
}
