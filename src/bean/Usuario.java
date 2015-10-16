package bean;

public class Usuario {

	private int usuarioId;
	private String nome;
	private String login;
	private String senha;
	
	public Usuario() {	}
	
	public Usuario(int usuarioId, String nome, String login, String senha) {
		super();
		this.usuarioId = usuarioId;
		this.nome = nome;
		this.login = login;
		this.senha = senha;
	}
	
	public int getUsuarioId() {
		return usuarioId;
	}
	public void setUsuarioId(int usuarioId) {
		this.usuarioId = usuarioId;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
