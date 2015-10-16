package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Usuario;
import util.ConnectionFactory;

public class UsuarioDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UsuarioDAO() throws Exception {
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage(), e);
		}
	}

	public void salvar(Usuario usuario) throws Exception {
		if (usuario == null)
			throw new Exception("O valor passado nao pode ser nulo");

		try {
			String SQL = "INSERT INTO usuario (usuarioId, nome, login, senha) values ( ?, ?, ?, ?)";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, usuario.getUsuarioId());
			ps.setString(2, usuario.getNome());
			ps.setString(3, usuario.getLogin());
			ps.setString(4, usuario.getSenha());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao inserir dados " + sqle, sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}
	
	public void atualizar(Usuario usuario) throws Exception {
		if (usuario == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "UPDATE usuario set nome=?, login=?, senha=? WHERE usuarioId=?";
			ps = conn.prepareStatement(SQL);	
			ps.setString(1, usuario.getNome());
			ps.setString(2, usuario.getLogin());
			ps.setString(3, usuario.getSenha());
			ps.setInt(4, usuario.getUsuarioId());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao alterar dados " + sqle, sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	public void excluir(Usuario usuario) throws Exception {
		if (usuario == null)
			throw new Exception("O valor passado nao pode ser nulo");
		
		try {
			String SQL = "DELETE FROM usuario WHERE usuarioId=?";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, usuario.getUsuarioId());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao excluir dados " + sqle, sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}
	
	public Usuario procurar(int usuarioId) throws Exception {
		try {
			Usuario usuario = new Usuario();
			String SQL = "SELECT  * FROM usuario WHERE usuarioId=?";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, usuarioId);
			rs = ps.executeQuery();
			if (rs.next()) {
				usuario.setUsuarioId(usuarioId);
				usuario.setNome(rs.getString(2));
				usuario.setLogin(rs.getString(3));
				usuario.setSenha(rs.getString(4));
			}
			return usuario;
		} catch (SQLException sqle) {
			throw new Exception(sqle);	
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	public List<Usuario> listarUsuarios() throws Exception {
		try {
			ps = conn.prepareStatement("SELECT * FROM usuario");
			rs = ps.executeQuery();
			List<Usuario> list = new ArrayList<Usuario>();
			while (rs.next()) {
				int usuarioId = rs.getInt(1);
				String nome = rs.getString(2);
				String login = rs.getString(3);
				String senha = rs.getString(4);
				list.add(new Usuario(usuarioId, nome, login, senha));
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
}
