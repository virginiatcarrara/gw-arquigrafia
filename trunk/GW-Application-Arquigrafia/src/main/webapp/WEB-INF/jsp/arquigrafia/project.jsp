<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="arquigrafia" uri="http://www.groupwareworkbench.org.br/widgets/arquigrafia" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Arquigrafia - Seu universo de imagens de arquitetura</title>
<arquigrafia:includes arquigrafiaInstance="${arquigrafiaMgr}" />
</head>

<body>
  <!--   CONTAINER   -->
  <div id="container">
  
  <!--   CABEÇALHO   -->
    <arquigrafia:header arquigrafiaInstance="${arquigrafiaMgr}" />
    
    <!--   MEIO DO SITE - ÁREA DE NAVEGAÇÃO   -->
    <div id="content">
      <!--   COLUNA ESQUERDA   -->
      <div id="sub_content">
        <!--   CONTEÚDO SOBRE O PROJETO   -->
        <h1>O Projeto</h1>
        <a href="#"  id="printer_icon"></a>
        <!--   TEXTO DO PROJETO   -->
        <div id="project_text">
          <p>O estudo da arquitetura deve ser feito, preferencialmente, in loco, vivenciando diretamente o espaço, percebendo suas estruturas fixas e suas dinâmicas, intuindo suas interações locais e sua inserção na paisagem (Zevi, 1996).</p>
          <img class="left" src="<c:url value="/img/project_photos/foto_1.jpg" />" width="377" height="261" alt="Texto alternativo da foto" title="Título da foto" />
          <p>Quando esta visita não é possível, as representações entram em cena e desempenham seu papel histórico.</p>
		  
		  <p>Desde a Antiguidade, quem visita um lugar, um edifício ou uma cidade, e se encanta com seu espaço arquitetônico, tenta retê-lo na memória e, para tanto, muitas vezes, elabora representações que procuram recriá-lo “em miniatura” e que podem ser levadas consigo à distância.</p>
		  <p>A partir do final dos anos 60, houve uma iniciativa dos alunos da FAU, organizada incomodados com a ausência de material visual sobre a arquitetura brasileira, os alunos da graduação – com o apoio do Grêmio da FAU e de alguns professores colaboradores –, iniciaram uma produção coletiva e sistemática de diapositivos de edifícios e espaços urbanos aproveitando visitas, viagens de férias, etc. Cedidos à biblioteca, tal conjunto de diapositivos constitui hoje o maior acervo de slides da arquitetura brasileira, que somado a imagens de arquiteturas de outras partes do mundo, chega a mais de 82 mil imagens, provavelmente o maior acervo de slides de arquitetura do hemisfério sul. Até o início dos anos 2000, esse acervo de slides foi o principal recurso visual de apoio às aulas, seminários e atividades docentes da FAUUSP, quando, então, passou gradativamente a ser substituído por imagens retiradas da Internet (especialmente de sites de busca como o Google images), montadas em Powerpoint e projetadas em Datashow. Atualmente este acervo de slides encontra-se parcialmente digitalizado, e está sendo gradualmente incorporado ao Arquigrafia.</p>
		  
          <p>A iniciativa colaborativa que entre os anos 60 e 80, em outro contexto e com outros recursos técnicos, formou o acervo atual de slides da FAUUSP, pode ser hoje reformulada, com o mesmo caráter colaborativo, mas em uma escala muito mais abrangente, por um meio de uma rede social na Web 2.0. Tal iniciativa pode reunir imagens digitais de todos os recantos do país produzidas por arquitetos, estudantes, professores, fotógrafos e pessoas interessadas em arquitetura, conformando uma rede que pode ser ampliada em breve à arquitetura mundial.          </p>
          <img class="left" src="<c:url value="/img/project_photos/foto_1.jpg" />" alt="Texto alternativo da foto" title="Título da foto" />
          <p>Disponível on line, esse acervo de imagens fotográficas em crescimento contínuo, possibilita ainda o georreferenciamento das imagens, maior liberdade de acesso com dispositivos móveis (Tablets e Smartphones), e o gerenciamento dos direitos autorais pautados pelo Creative Commons. A partir da dinâmica de interação nesta rede, o projeto Arquigrafia se propõe a investigar como a construção do conhecimento individual se relaciona com a construção do conhecimento coletivo, compartilhando subjetividades sobre experiências interativas e comunicativas relativas a um acervo coletivo online de fotografias de arquitetura. Com este propósito, contamos com a sua colaboração para construirmos juntos edifundirmos este acervo de imagens.</p>
        </div>
        <!--   FIM - TEXTO DO PROJETO   -->
      </div>
      <!--   FIM - COLUNA ESQUERDA   -->
      <!--   COLUNA DIREITA   -->
      <div id="sidebar">
        <h2>Equipe</h2>
		<h3>Pesquisadores</h3>
		<ul>
			<li><small>Prof. Dr. Artur Simões Rozestraten - FAUUSP</small></li>
			<li><small>Prof. Dr. Marco Aurélio Gerosa - IMEUSP</small></li>
			<li><small>Profa. Dra. Maria Laura Martinez - ECAUSP</small></li>
		</ul>
		
		<h3>Colaboradores</h3>
		<ul>
			<li><small>Prof. Dr. Fábio Kon - IMEUSP</small></li>
			<li><small>Prof. Dr. Julio Roberto Katinsky - FAUUSP</small></li>
			<li><small>Prof. Dr. Luiz Américo de Souza Munari - FAUUSP</small></li>
			<li><small>Prof. Dr. Abílio Guerra e equipe VITRUVIUS</small></li>
			<li><small>Profa. Dra. Roberta Lima Gomes - Informática, UFES</small></li>
			<li><small>Prof. Dr. Magnos Martinello - Informática, UFES</small></li>
			<li><small>Dina Uliana - Diretora biblioteca FAUUSP</small></li>
			<li><small>Eliana de Azevedo Marques - Biblioteca FAUUSP</small></li>
			<li><small>Elizabete da Cruz Neves - Biblioteca FAUUSP</small></li>
			<li><small>Rejane Alves - Biblioteca FAUUSP</small></li>
			<li><small>Prof. Dr. Cristiano Mascaro - Consultor de fotografia</small></li>
			<li><small>Arq. Nelson Kon - Consultor de fotografia</small></li>
			<li><small>Arq. Rodrigo Luiz Minot Gutierrez - SENAC</small></li>
		</ul>
		
		<h3>Alunos participantes</h3>
		<ul>
			<li><small>Ana Paula Oliveira dos Santos - Mestranda IMEUSP</small></li>
			<li><small>Straus Michalsky Martins - Mestrando IMEUSP</small></li>
			<li><small>Carlos Leonardo Herrera Muñoz - Mestrando IMEUSP</small></li>
			<li><small>Edith Zaida Sonco Mamani - Mestrando, IMEUSP</small></li>
			<li><small>Lucas Santos de Oliveira - Mestre IMEUSP</small></li>
			<li><small>Mauricio José de Oliveira de Diana - Mestrando IMEUSP</small></li>
			<li><small>Victor Williams Stafusa da Silva - Mestrando IMEUSP</small></li>
			<li><small>André Luís de Lima - Mestrando FAUUSP</small></li>
			<li><small>Diogo Augusto - graduando em IC, PIBIC/CNPq, FAUUSP</small></li>
			<li><small>Lucas Caracik - graduando em IC, FAUUSP</small></li>
			<li><small>Samuel Carvalho Gomes Fukumoto - graduando, bolsista TT1, FAPESP, FAUUSP</small></li>
			<li><small>Bhakta Krpa das Santos - graduando, bolsista IC, FAPESP, FAUUSP</small></li>
			<li><small>Guilherme A. Nogueira Cesar - graduando, FAUUSP</small></li>
			<li><small>Claudio Roberto Franca Pereira - graduando, UFES</small></li>
			<li><small>Enzo Toshio S. L. de Mello - Técnico em Informática para Internet, bolsista TT2, FAPESP, FITO</small></li>
		</ul>
		
		<h3>Parceiros de desenvolvimento</h3>
		<ul>
			<li><small>Jean Pierre Chamouton,</small></li>
			<li><small>Benchmark Design Total,</small></li>
			<li><small>BRZ Comunicação.</small></li>
		</ul>
      </div>
      <!--   FIM - COLUNA DIREITA   -->
    </div>
    <!--   FIM - MEIO DO SITE-->
    <!--   FUNDO DO SITE   -->
    <div id="footer">
	  <!--   BARRA DE ABAS   -->
	  <arquigrafia:tabs arquigrafiaInstance="${arquigrafiaMgr}" />
	  <!--   FIM - BARRA DE IMAGENS - (RODAPÉ)   -->
	  
	  
	  <!--   CRÉDITOS - LOGOS   -->
      <arquigrafia:footer arquigrafiaInstance="${arquigrafiaMgr}" />
    </div>
    <!--   FIM - FUNDO DO SITE   -->
    <!--   MODAL   -->
    <div id="mask"></div>
    <div id="form_window"> 
      <!-- ÁREA DE LOGIN - JANELA MODAL --> 
      <a class="close" href="#" title="FECHAR"></a>
      <div id="registration">
      </div>
    </div>
    <!--   FIM - MODAL   -->
  </div>
  <!--   FIM - CONTAINER   -->
</body>
</html>