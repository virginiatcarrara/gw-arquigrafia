package br.org.groupwareworkbench.arquigrafia.photo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

import br.com.caelum.vraptor.Resource;
import br.org.groupwareworkbench.core.bd.GenericEntity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Resource
@Entity
public class Photo extends GenericEntity {

    private static final long serialVersionUID = -4757949223957140519L;

    @Column(name="nome", unique=false, nullable=false)
    private String nome;

    @Column(name="nome_arquivo", unique=false, nullable=false)
    private String nomeArquivo;

    private String descricao;

    private String lugar;

    @Temporal(TemporalType.TIMESTAMP)
    private Date data;

    @Temporal(TemporalType.TIMESTAMP)
    private Date dataCriacao;

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

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCricao) {
        this.dataCriacao = dataCricao;
    }
}