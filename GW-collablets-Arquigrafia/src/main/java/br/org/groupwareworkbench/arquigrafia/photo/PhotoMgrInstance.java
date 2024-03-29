/*
 *    UNIVERSIDADE DE SÃO PAULO.
 *    Author: Marco Aurélio Gerosa (gerosa@ime.usp.br)
 *    This project was/is sponsored by RNP and FAPESP.
 *
 *    This file is part of Groupware Workbench (http://www.groupwareworkbench.org.br).
 *
 *    Groupware Workbench is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU Lesser General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    Groupware Workbench is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public License
 *    along with Swift.  If not, see <http://www.gnu.org/licenses/>.
 */
package br.org.groupwareworkbench.arquigrafia.photo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import br.org.groupwareworkbench.collablet.coord.user.User;
import br.org.groupwareworkbench.core.framework.AbstractBusiness;
import br.org.groupwareworkbench.core.framework.Collablet;
import br.org.groupwareworkbench.core.framework.annotations.ComponentInfo;
import br.org.groupwareworkbench.core.framework.annotations.DefaultProperty;
import br.org.groupwareworkbench.core.framework.annotations.RequiredProperty;
import br.org.groupwareworkbench.core.graphics.GraphicalResourceManager;
import br.org.groupwareworkbench.core.util.Pagination;

import com.google.common.collect.Maps;

    

@ComponentInfo(version = "0.1", configurationURL = "/photo/{photoMgr}/index", retrieveURL = "/photo/{id}", defaultProperties = {
        @DefaultProperty(name = "cropPrefix", defaultValue = "crop_"),
        @DefaultProperty(name = "thumbPrefix", defaultValue = "thumb_"),
        @DefaultProperty(name = "mostraPrefix", defaultValue = "mostra_")}, requiredProperties = {@RequiredProperty(name = "dirImages")})
public class PhotoMgrInstance extends AbstractBusiness {

    private GraphicalResourceManager graphicalResourceManager = null;
    
    public PhotoMgrInstance(Collablet collablet) {
        super(collablet);
    }

    public void save(Photo photo) {
        photo.setCollablet(getCollablet());
        photo.save();
    }

    public void update(Photo photo) {
        photo.setCollablet(getCollablet());
        photo.update();
    }

    public List<Photo> buscaFoto(String busca) {
        return Photo.busca(getCollablet(), busca, "", "", null);
    }

    public List<Photo> buscaFotoAvancada(String nome, String lugar, String descricao, Date date) {
        return Photo.busca(getCollablet(), nome.trim(), lugar.trim(), descricao.trim(), date);
    }

    public List<Photo> buscaFotoPorListaId(List<Object> listObjects) {
        List<Photo> photos = new ArrayList<Photo>(listObjects.size());
        for (Object object : listObjects) {
            if (object instanceof Photo) {
                photos.add((Photo) object);
            }
        }
        return photos;
    }
    
    public Map<String, List<Photo>> searchForAttributesOfThePhoto(String value, Pagination pagination) {
        Map<String, List<Photo>> results = Maps.newHashMap();

        for (String term : Search.getNames()) {
            results.put(term, Photo.findByAttribute(getCollablet(), term, value, pagination));
        }
        return results;
    }
    
    public boolean hasResults(Map<String, List<Photo>> search) {
        for (String term : search.keySet()) {
            if (search.get(term) != null && !search.get(term).isEmpty()) {
                return true;
            }
        }
        return false;
    }

    public List<Photo> searchForAttributeOfThePhoto(String term, String q, int page, int perPage) {
        Pagination pagination = new Pagination(page, perPage);
        List<Photo> photos = Photo.findByAttribute(getCollablet(), term, q, pagination);
        return photos;
    }

    public Map<String, Long> countsPhotosSearchByAttribute(String term) {
        Map<String, Long> results = Maps.newHashMap();
        for (String attr : Search.getNames()) {
            results.put(attr, Photo.countByAttribute(getCollablet(), attr, term));
        }
        return results;
    }
    
    public Long countPhotosSearchByAttribute(String term, String search) {
        return Photo.countByAttribute(getCollablet(), term, search);
    }


    public List<Photo> list() {
        return Photo.list(getCollablet());
    }

    public Long countAllPhotos() {
        return Photo.count();
    }
    
    public Long countLastMonthPhotos() {
        return Photo.lastMonthCount();
    }
    
    public Long countLastWeekPhotos() {
        return Photo.lastWeekCount();
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

    public List<Photo> listPhotoByUserPageAndOrder(User user, int pageSize, int pageNumber) {
        return Photo.listPhotoByUserPageAndOrder(getCollablet(), user, pageSize, pageNumber);
    }
    
    public List<Photo> listPhotoByUserPageAndOrder(User user, Long pageSize, Long pageNumber) {
        return this.listPhotoByUserPageAndOrder(user, pageSize.intValue(), pageNumber.intValue());
    }

    public List<Photo> listPhotosByUser(User user) {
        return Photo.listPhotosByUser(getCollablet(), user);
    }
    
    public Long countPhotosByUser(User user) {
        return Photo.countPhotosByUser(getCollablet(), user);
    }
    
    public Long photoPaginateCountByUser(Long countByPage, User user) {
        Long countPhotosByUser = countPhotosByUser(user);
        int pageCount = (countPhotosByUser.intValue() / countByPage.intValue());
        if ( (countPhotosByUser % countByPage) > 0 ) {
            pageCount++;
        }
        return Integer.valueOf(pageCount).longValue();
    }
    
    public List<Photo> listLastPhotos(Integer amount) {
        List<Photo> photos = Photo.listLastPhotos(getCollablet(), amount);
        return photos;
    }

    public List<Photo> listRandomPhotos(Integer amount) {
        List<Photo> result = new ArrayList<Photo>();
        List<Photo> photos = Photo.list(getCollablet());
        int size = photos.size();

        if (size > 0) {
            Random rand = new Random();
            for ( int i = 0; i < amount && photos.size() > 0 ; i++ ) {
                size = photos.size();
                Photo tmp = photos.get( rand.nextInt(size) );
                if ( tmp == null || tmp.getDeleted() ) {
                    //nao adiciona fotos excluidas
                    continue;
                }
                
                result.add( tmp );
                photos.remove(tmp);
                
            }
        }

        return result;
    }
    
    public GraphicalResourceManager getGraphicalResourceManager() {
        if ( this.graphicalResourceManager == null ) {
            this.graphicalResourceManager = new GraphicalResourceManager(this.getDirImages());
        }
        return this.graphicalResourceManager;
    }

}
