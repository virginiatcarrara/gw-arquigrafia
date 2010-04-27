package br.org.groupware_workbench.photo.internal;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import org.apache.commons.io.IOUtils;

import br.org.groupware_workbench.commons.bd.jpa.ObjectDAO;
import br.org.groupware_workbench.photo.Photo;

//public class PhotoRegisterDAO extends GenericDAO<PhotoRegister> {
public class PhotoDAO extends ObjectDAO<Photo, Long> {	
	
	public PhotoDAO() {
		super(Photo.class);
	}

	public void saveImage(InputStream foto, String nome, String pasta) throws IOException {
		File file = new File(pasta, nome);
		file.createNewFile();
		IOUtils.copy(foto, new FileOutputStream(file));
	}

	@SuppressWarnings("unchecked")
	public List<Photo> busca(String busca, Long idInstance) {
		String query="SELECT p FROM Photo p WHERE  p.idInstance=:idInstance and upper(p.nome) like :nome ";   //or upper(p.lugar) like :lugar or upper(p.descricao) like :descricao)";
		Query consulta=getEntityManager().createQuery(query);
		consulta.setParameter("idInstance", idInstance);
		consulta.setParameter("nome", "%"+busca.toUpperCase()+"%");
		//consulta.setParameter("lugar", "%"+busca.toUpperCase()+"%");
		//consulta.setParameter("descricao", "%"+busca.toUpperCase()+"%");
		List<Photo> result=(List<Photo>)consulta.getResultList();
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Photo> busca(String nome,String lugar,String descricao, Date date, Long idInstance) {
		String query;
		Query consulta;
		if(date==null){
			query="SELECT p FROM Photo p WHERE  p.idInstance=:idInstance and (upper(p.nome) like :nome and upper(p.lugar) like :lugar and upper(p.descricao) like :descricao)";
			consulta=getEntityManager().createQuery(query);
		}
		else{
			query="SELECT p FROM Photo p WHERE  p.idInstance=:idInstance and (upper(p.nome) like :nome and upper(p.lugar) like :lugar and upper(p.descricao) like :descricao and p.data=:date)";
			consulta=getEntityManager().createQuery(query);
			consulta.setParameter("date", date);			
		}		
		consulta.setParameter("idInstance", idInstance);
		consulta.setParameter("nome", "%"+nome.toUpperCase()+"%");
		consulta.setParameter("lugar", "%"+lugar.toUpperCase()+"%");
		consulta.setParameter("descricao", "%"+descricao.toUpperCase()+"%");
		List<Photo> result=(List<Photo>)consulta.getResultList();
		
		return result;
	}
}
