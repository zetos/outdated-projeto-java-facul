package bean;

public class Categoria {
		
	private int categoriaId;
	private String nome;
	private String linha;
	private String faixaEtaria;
	
	public Categoria() { }
	
	public Categoria(int categoriaId, String nome, String linha, String faixaEtaria) {
		super();
		this.categoriaId = categoriaId;
		this.nome = nome;
		this.linha = linha;
		this.faixaEtaria = faixaEtaria;
	}
	
	public int getCategoriaId() {
		return categoriaId;
	}
	public void setCategoriaId(int categoriaId) {
		this.categoriaId = categoriaId;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getLinha() {
		return linha;
	}
	public void setLinha(String linha) {
		this.linha = linha;
	}
	
	public String getFaixaEtaria() {
		return faixaEtaria;
	}
	public void setFaixaEtaria(String faixaEtaria) {
		this.faixaEtaria = faixaEtaria;
	}
}
