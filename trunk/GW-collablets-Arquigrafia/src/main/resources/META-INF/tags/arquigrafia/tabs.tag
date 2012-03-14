<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.groupwareworkbench.org.br/widgets/security" %>
<%@ taglib prefix="p" uri="http://www.groupwareworkbench.org.br/widgets/photomanager" %>

<%@ attribute name="arquigrafiaInstance" required="true" rtexprvalue="true" type="br.org.groupwareworkbench.arquigrafia.main.ArquigrafiaMgrInstance" %>


	  <!--   BARRA DE ABAS   -->
	  <ul class="tabs">
        <!--   ABAS   -->
        <li class="selected_tab">
	      <a href="#" class="selected_tab_link">NOVAS IMAGENS</a>
		</li>
		<!-- <li class="tab_not_selected">
		  <a href="#" class="tab_link">POPULARES</a>
		</li>
		<li class="tab_not_selected">
		  <a href="#" class="tab_link">CONTROVERSAS</a>
		</li>
		<li class="tab_not_selected">
		  <a href="#" class="tab_link">AVALIADAS</a>
		</li>
		<li class="tab_not_selected">
		  <a href="#" class="tab_link">COMENTADAS</a>
		</li>  -->
      </ul>
	  <!--   BARRA DE IMAGENS - (RODAPÉ)   -->
	  <div class="footer_images">
	    <!--   LINHA DE IMAGENS - (RODAPÉ)   -->
		<div class="images_line">  
		  <!--   SETAS DE NAVEGAÇÃO DAS FOTOS (RODAPÉ)-->
		  <!-- <a href="#" id="arrow-left" class="arrows">&laquo;</a>
		  <a href="#" id="arrow-right" class="arrows">&raquo;</a>  -->
		  <!--   IMAGENS - (RODAPÉ)   -->
		  <p:listLastPhotos photoInstance="${photoMgr}" amount="8" />
		  
	    </div>
        <!--   FIM - LINHA DE IMAGENS - (RODAPÉ)   -->
	  </div>
	  
	  
	  <div>
	  </div>
	  <!--   FIM - BARRA DE IMAGENS - (RODAPÉ)   -->