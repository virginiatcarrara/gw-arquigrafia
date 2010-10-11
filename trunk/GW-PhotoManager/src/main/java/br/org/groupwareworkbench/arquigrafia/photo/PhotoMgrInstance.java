package br.org.groupwareworkbench.arquigrafia.photo;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.org.groupwareworkbench.collablet.coord.user.User;
import br.org.groupwareworkbench.core.framework.AbstractBusiness;
import br.org.groupwareworkbench.core.framework.Collablet;
import br.org.groupwareworkbench.core.framework.annotations.ComponentInfo;
import br.org.groupwareworkbench.core.framework.annotations.DefaultProperty;

@ComponentInfo(
    version="0.1",
    configurationURL="/groupware-workbench/photo/{photoInstance}/index",
    retrieveURL="/groupware-workbench/photo/{id}",
    defaultProperties={
        @DefaultProperty(name="dirImages", defaultValue="images"),
        @DefaultProperty(name="cropPrefix", defaultValue="crop_"),
        @DefaultProperty(name="thumbPrefix", defaultValue="thumb_"),
        @DefaultProperty(name="mostraPrefix", defaultValue="mostra_")
    }
)
public class PhotoMgrInstance extends AbstractBusiness {

    public PhotoMgrInstance(Collablet collablet) {
        super(collablet);
    }

    public File imgThumb(String nomeArquivoUnico) {
        return Photo.getImageFile(getDirImages(), this.getThumbPrefix(), nomeArquivoUnico);        
    }

    public File imgCrop(String nomeArquivoUnico) {
        return Photo.getImageFile(getDirImages(), this.getCropPrefix(), nomeArquivoUnico);        
    }

    public File imgShow(String nomeArquivoUnico) {
        return Photo.getImageFile(getDirImages(), this.getMostraPrefix(), nomeArquivoUnico);        
    }

    public File imgOriginal(String nomeArquivoUnico) {
        return Photo.getImageFile(getDirImages(), "", nomeArquivoUnico);
    }

    public void save(Photo photo) {
        photo.setCollablet(getCollablet());
        photo.save();
    }

    public void assignToUser(Photo photo, User user) {
        photo.assignUser(user);
        
    }

    public void saveImage(InputStream foto, String nome) throws IOException {
        Photo.saveImage(foto, nome, this.getDirImages());
    }

    public List<Photo> buscaFoto(String busca) {
        return Photo.busca(getCollablet(), busca);
    }

    public List<Photo> buscaFotoAvancada(String nome, String descricao, String lugar, Date date) {
        return Photo.busca(getCollablet(), nome, lugar, descricao, date);
    }
       
    public List<Photo> buscaFotoPorListaId(List<Object> listObjects) {
        List<Photo> photos = new ArrayList<Photo>();
        for (Object object : listObjects) {
            if (object instanceof Photo) {
                photos.add((Photo) object);
            }
        }
        return photos;
    }

    public List<Photo> list() {
        return Photo.list(getCollablet());
    }

    public List<Photo> listPhotoByPageAndOrder(int pageSize, int pageNumber) {
        return Photo.listPhotoByPageAndOrder(getCollablet(), pageSize, pageNumber);
    }
   
     public String getDirImages() {
        return getCollablet().getProperty("dirImages");
    }

    public String getCropPrefix() {
        return getCollablet().getProperty("cropPrefix");
    }

    public String getThumbPrefix() {
        return getCollablet().getProperty("thumbPrefix");
    }

    public String getMostraPrefix() {
        return getCollablet().getProperty("mostraPrefix");
    }

    public String getDirImagesAbsoluto() {
        return this.getDirImages();
    }
}
