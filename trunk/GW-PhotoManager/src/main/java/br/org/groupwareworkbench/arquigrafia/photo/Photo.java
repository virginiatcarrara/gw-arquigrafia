package br.org.groupwareworkbench.arquigrafia.photo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Query;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.Resource;
import br.org.groupwareworkbench.collablet.communic.tag.Tag;
import br.org.groupwareworkbench.collablet.coord.user.User;
import br.org.groupwareworkbench.core.bd.EntityManagerProvider;
import br.org.groupwareworkbench.core.bd.ObjectDAO;
import br.org.groupwareworkbench.core.framework.Collablet;

@Resource
@Entity
public class Photo implements Serializable {

    private static final long serialVersionUID = -4757949223957140519L;
    private static final ObjectDAO<Photo, Long> DAO = new ObjectDAO<Photo, Long>(Photo.class);
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
    
    @ManyToOne
    private Collablet collablet;

    @Column(name="nome", unique=false, nullable=false)
    private String nome;

    @Column(name="nome_arquivo", unique=false, nullable=false)
    private String nomeArquivo;

    private String descricao;

    private String lugar;
   
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataCriacao;
    
      
    @ManyToMany
    private List<User> users=new LinkedList<User>();
        

    public Photo(){}
    public Photo(Collablet collablet){
        this.collablet=collablet;
    }
    
    
    
    public void assignUser(User user){
        users.add(user);
        DAO.update(this);
        
    }
    
    public void deassignUser(User user){
        users.remove(user);
        DAO.update(this);
    }
    
    
    public static void deleteAll(Collablet collablet){
        Map<String,Object> fields=new HashMap<String,Object>();
        fields.put("collablet", collablet);        
        DAO.deleteByFields(fields);
    }
    
    public void delete() {
        DAO.delete(this);
    }
           
    
    public void save() {
        if (id == null) {
            DAO.insert(this);
        } else {
            DAO.update(this);
        }
    }
    
    
    public static List<Photo> list(Collablet collablet){
        return DAO.listByField("collablet", collablet);
    }
    
    public static List<Photo> listAll(){
        return DAO.listAll();
    } 
    
    public static File getImageFile(String pasta, String prefix, String nomeArquivoUnico) {
        String path= pasta + prefix + nomeArquivoUnico;
        return new File(path);
    }
    
    public static void saveImage(InputStream foto, String nome, String pasta) throws IOException {
        File file = new File(pasta, nome);
        file.createNewFile();
        IOUtils.copy(foto, new FileOutputStream(file));
    }
    
    public static List<Photo> listPhotoByPageAndOrder(Collablet collablet, int pageSize, int pageNumber) {
        EntityManager em=EntityManagerProvider.getEntityManager();
        String querySentence = "SELECT p FROM " + Photo.class.getSimpleName() + " p WHERE p.collablet=:collablet ORDER BY p.dataCriacao DESC";
        TypedQuery<Photo> query = em.createQuery(querySentence, Photo.class);
        query.setParameter("collablet", collablet);
        int firstElement = pageNumber * pageSize;
        query.setFirstResult(firstElement);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }
        
    public static List<Photo> busca(Collablet collablet, String busca) {
        String queryString = "SELECT p FROM " + Photo.class.getSimpleName() + " p WHERE p.collablet=:collablet AND UPPER(p.nome) LIKE :nome";
        EntityManager em=EntityManagerProvider.getEntityManager();
        TypedQuery<Photo> query=em.createQuery(queryString,Photo.class);
        query.setParameter("nome", "%" + busca.toUpperCase() + "%");
        query.setParameter("collablet", collablet);
        //query.setParameter("lugar", "%"+busca.toUpperCase()+"%");
        //query.setParameter("descricao", "%"+busca.toUpperCase()+"%");
        return query.getResultList();
    }
    
    public static List<Photo> busca(Collablet collablet, String nome, String lugar, String descricao, Date date) {
        String query;
        EntityManager em=EntityManagerProvider.getEntityManager();
        TypedQuery<Photo> consulta;
        if (date == null) {
            query = "SELECT p FROM " + Photo.class.getSimpleName() + " p WHERE p.collablet=:collablet AND (UPPER(p.nome) LIKE :nome AND UPPER(p.lugar) LIKE :lugar AND UPPER(p.descricao) LIKE :descricao)";
            consulta = em.createQuery(query, Photo.class);
        } else {
            query = "SELECT p FROM " + Photo.class.getSimpleName() + " p WHERE p.collablet=:collablet AND (UPPER(p.nome) LIKE :nome AND UPPER(p.lugar) LIKE :lugar AND UPPER(p.descricao) LIKE :descricao AND p.data = :date)";
            consulta = em.createQuery(query, Photo.class);
            consulta.setParameter("date", date);
        }
        consulta.setParameter("collablet", collablet);
        consulta.setParameter("nome", "%" + nome.toUpperCase() + "%");
        consulta.setParameter("lugar", "%" + lugar.toUpperCase() + "%");
        consulta.setParameter("descricao", "%" + descricao.toUpperCase() + "%");
        return consulta.getResultList();
    }
    
    
    public static Photo findById(long id) {
        return DAO.findById(id);
    }
        
    
    public String getNomeArquivoUnico(){
        return this.getId() + this.getNomeArquivo();
    }

    public String getNomeArquivo() {
        return nomeArquivo;
    }

    public void setNomeArquivo(String nomeArquivo) {
        this.nomeArquivo = nomeArquivo;
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Photo)) return false;
        Photo other = (Photo) o;
        return other.getNome().equals(this.getNome());
    }

    @Override
    public int hashCode() {
        return nome == null ? 0 : nome.hashCode();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public Date getDataCriacao() {
        return dataCriacao == null ? null : (Date) dataCriacao.clone();
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = (dataCriacao == null ? null : (Date) dataCriacao.clone());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public Collablet getCollablet() {
        return collablet;
    }
    public void setCollablet(Collablet collablet) {
        this.collablet = collablet;
    }
}
