package service;

import java.util.List;

import javax.ws.rs.*;
import com.thoughtworks.xstream.XStream;

import bean.Produto;
import dao.ProdutoDAO;

@Path("/api")
public class ProdutoService {
	
	//Objeto que converte o objeto em XML e vice-versa
	private XStream conversor = new XStream();
	private ProdutoDAO dao;
	
	public ProdutoService(){
		try {
			dao = new ProdutoDAO();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	@GET
	public String teste() {
		return "WebService On-line...";
	}
	
	@GET
	@Path("produto/{id}")
	@Produces("application/xml")
	public String pesquisarAluno(@PathParam("id") int id) throws Exception {
		
		//Obtendo o Aluno do DB com base no rgm 
		Produto produto = dao.procurar(id);
		
		//Apelidando o nome "br.app.bean.Aluno" para "aluno"
		conversor.alias("aluno", Produto.class);
		
		//Verifica se o aluno buscado existe.
		if (produto != null)
			//Envia os dados do aluno em XML
			return conversor.toXML(produto);
		else
			//Envia o valor nulo em XML
			return conversor.toXML(null);
	}
	
	@POST
	@Path("produto")
	@Produces("application/xml")
	public String inserirAluno(String xml) {
		
		//Apelidando o nome "br.app.bean.Aluno" para "aluno"
		conversor.alias("produto", Produto.class);
		
		//Obtém o objeto Aluno a partir do XML
		Produto produto = (Produto) conversor.fromXML(xml);
		
		//Insere no Banco e retorna TRUE ou FALSE mediante a execução
		try {
			dao.salvar(produto);
			//Envia a resposta para o cliente.
			//Envia o valor TRUE em XML em caso de inserção com sucesso.
			return conversor.toXML(true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//Envia o valor FALSE em XML em caso de erro de inserção.
			return conversor.toXML(false);			
		}
		
	}
	
	@PUT
	@Path("produto")
	@Produces("application/xml")
	public String atualizarAluno(String xml) {
		
		//Apelidando o nome "br.app.bean.Aluno" para "aluno"
		conversor.alias("produto", Produto.class);
	
		//Obtém o objeto Aluno através do XML
		Produto produto = (Produto) conversor.fromXML(xml);			
		
		//Atualiza os dados do aluno no banco
		try {
			dao.atualizar(produto);
			//Envia o valor true em caso de sucesso
			return conversor.toXML(true);
		} catch (Exception e) {
			e.printStackTrace();
			//Envia o valor false em caso erro na atualização
			return conversor.toXML(false);
		}
	}
	
	@DELETE
	@Path("produto/{id}")
	@Produces("application/xml")
	public String excluirAluno(@PathParam("id") int id) {
		try {
			dao.excluir(id);
			return conversor.toXML(true);
		} catch (Exception e) {
			e.printStackTrace();
			return conversor.toXML(false);
		}
	}
	
	@GET
	@Path("produtos")
	@Produces("application/xml")
	public String listarTodosAlunos() throws Exception {
		//Apelidando o nome "br.app.bean.Aluno" para "aluno"
		conversor.alias("produto", Produto.class);
		
		//Apelidando o nome "List" para "alunos"
		conversor.alias("produtos", List.class);

		//Obtendo a lista de Alunos do Banco
		List<Produto> produtos = dao.listarProdutos();
		
		//Verificando se a lista existe
		if (produtos != null)
			//Envia esta lista convertida em XML
			return conversor.toXML(produtos);
		else
			//Envia o valor nulo convertido para XML
			return conversor.toXML(null);
	}	
}
