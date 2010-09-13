/*
*    UNIVERSIDADE DE SÃO PAULO.
*    Author: Marco Aurélio Gerosa (gerosa@ime.usp.br)
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

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.util.test.MockResult;
import br.com.caelum.vraptor.util.test.MockValidator;
import br.com.caelum.vraptor.validator.Message;
import br.com.caelum.vraptor.validator.ValidationException;
import br.org.groupwareworkbench.core.bd.DatabaseTester;

import br.org.groupwareworkbench.core.bd.EntityManagerProvider;
import br.org.groupwareworkbench.core.framework.Collablet;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import org.mockito.Mockito;

public class PhotoControllerTest {

    private DatabaseTester db;
    private EntityManager em;
    private Collablet collablet;
    private PhotoController controller;
    private PhotoMgrInstance photoInstance;

    private Collablet outroCollablet;

    private MockResult result;

    private Photo photo1;
    private Photo photo2;
    private Photo photo3;

    @Before
    public void setUp() {
        db = new DatabaseTester();
        em = EntityManagerProvider.getEntityManager();

        collablet = db.makeCollablet(PhotoMgrInstance.class);
        photoInstance = (PhotoMgrInstance) collablet.getBusinessObject();

        outroCollablet = db.makeCollablet(PhotoMgrInstance.class);

        result = new MockResult();
        controller = new PhotoController(result, new MockValidator(), null);

        populateDatabase();
    }

    @After
    public void tearDown() {
        db.close();
    }

    private void populateDatabase() {
        em.getTransaction().begin();

        photo1 = new Photo();
        photo1.setIdInstance(collablet.getId());
        photo1.setNome("foto Um");
        photo1.setNomeArquivo("fotoum.jpg");
        em.persist(photo1);

        photo2 = new Photo();
        photo2.setIdInstance(collablet.getId());
        photo2.setNome("foto Dois");
        photo2.setNomeArquivo("fotodois.jpg");
        em.persist(photo2);

        photo3 = new Photo();
        photo3.setIdInstance(outroCollablet.getId());
        photo3.setNome("foto Tres");
        photo3.setNomeArquivo("fototres.jpg");
        em.persist(photo3);

        em.getTransaction().commit();
    }

    private UploadedFile getImage() {
        return new UploadedFile() {

            @Override
            public String getContentType() {
                throw new UnsupportedOperationException();
            }

            @Override
            public InputStream getFile() {
                try {
                    return new BufferedInputStream(new FileInputStream(new File(PhotoControllerTest.class.getResource("fotoum.jpg").getFile())));
                } catch (FileNotFoundException e) {
                    throw new AssertionError(e);
                }
            }

            @Override
            public String getFileName() {
                return "fotoquatro.jpg";
            }
        };
    }

    private List<String> listErrors(ValidationException e) {
        List<Message> errors = e.getErrors();

        List<String> outMensagens = new ArrayList<String>(errors.size());
        for (Message message : errors) {
            outMensagens.add(message.getMessage());
        }
        return outMensagens;
    }

    @Test
    public void testPhotoSearchWithShortString() {
        try {
            controller.buscaFoto("fo", photoInstance);
            Assert.fail();
        } catch (ValidationException e) {
            List<Message> errors = e.getErrors();
            Assert.assertEquals(1, errors.size());
            Assert.assertEquals(PhotoController.MSG_MIN_3_LETRAS, errors.get(0).getMessage());
        }
    }

    @Test
    public void testPhotoSearchWithLongEnoughString() {
        controller.buscaFoto("fot", photoInstance);

        @SuppressWarnings("unchecked")
        List<Photo> fotosResult = (List<Photo>) result.included("fotos");

        Assert.assertEquals(2, fotosResult.size());
        Assert.assertTrue(fotosResult.contains(photo1));
        Assert.assertTrue(fotosResult.contains(photo2));
        Assert.assertFalse(fotosResult.contains(photo3));
    }

    @Test
    public void testAdvancedSearchWithoutAnyFields() {
        try {
            controller.buscaFotoAvancada("", "", "", null, photoInstance);
            Assert.fail();
        } catch (ValidationException e) {
            List<Message> errors = e.getErrors();
            Assert.assertEquals(1, errors.size());
            Assert.assertEquals(PhotoController.MSG_NENHUM_CAMPO_PREENCHIDO, errors.get(0).getMessage());
        }
    }

    @Test
    public void testAdvancedSearchByName() {
        controller.buscaFotoAvancada("fotoum", "", "", null, photoInstance);

        @SuppressWarnings("unchecked")
        List<Photo> fotosResult = (List<Photo>) result.included("fotos");

        Assert.assertEquals(2, fotosResult.size());
        Assert.assertTrue(fotosResult.contains(photo1));
        Assert.assertTrue(fotosResult.contains(photo2));
        Assert.assertFalse(fotosResult.contains(photo3));
    }

    @Test
    public void testSaveWithoutNameNorImage() {
        Photo quatro = new Photo();
        quatro.setIdInstance(collablet.getId());
        quatro.setNome("");

        try {
            controller.save(quatro, null, photoInstance, null);
            Assert.fail();
        } catch (ValidationException e) {
            List<String> outMensagens = listErrors(e);
            Assert.assertTrue(outMensagens.contains(PhotoController.MSG_NOME_OBRIGATORIO));
            Assert.assertTrue(outMensagens.contains(PhotoController.MSG_IMAGEM_OBRIGATORIA));
            Assert.assertEquals(2, outMensagens.size());
        }
    }

    @Test
    public void testSaveWithoutImage() {
        Photo quatro = new Photo();
        quatro.setIdInstance(collablet.getId());
        quatro.setNome("foto Quatro");
        quatro.setNomeArquivo("fotoquatro.jpg");

        try {
            controller.save(quatro, null, photoInstance, null);
            Assert.fail();
        } catch (ValidationException e) {
            List<String> outMensagens = listErrors(e);
            Assert.assertTrue(outMensagens.contains(PhotoController.MSG_IMAGEM_OBRIGATORIA));
            Assert.assertEquals(1, outMensagens.size());
        }
    }

    @Test
    public void testSaveWithoutName() {
        Photo quatro = new Photo();
        quatro.setIdInstance(collablet.getId());
        quatro.setNome("");

        try {
            controller.save(quatro, getImage(), photoInstance, null);
            Assert.fail();
        } catch (ValidationException e) {
            List<String> outMensagens = listErrors(e);
            Assert.assertTrue(outMensagens.contains(PhotoController.MSG_NOME_OBRIGATORIO));
            Assert.assertEquals(1, outMensagens.size());
        }
    }

    @Test
    public void testSucessfulSave() {
        Photo quatro = new Photo();
        quatro.setIdInstance(collablet.getId());
        quatro.setNome("foto Quatro");
        quatro.setNomeArquivo("fotoquatro.jpg");

        try {
            controller.save(quatro, getImage(), photoInstance, null);
        } catch (ValidationException e) {
            List<String> outMensagens = listErrors(e);
            for (String erro : outMensagens) {
                System.err.println(erro);
            }
            Assert.fail();
        }
    }
}
