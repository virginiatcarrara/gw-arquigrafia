<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="forgot_password_modal_box">
<h2>Alterar minha senha</h2>
<br />
<form id="send_forgot_password" method="post" name="loginForm" action="<c:url value="/users/${userMgr.id}/password/${token}" />">
	<div>
	  <label>Senha:</label>
	  <input name="password" type="password" class="email" />
	  <br />
	  <label>Confirmar senha:</label>
	  <input name="confirmation" type="password" class="text" />
	  <br />
	</div>
	
  <div id="validation_error" class="message_delivery_generic" >
  </div>   

	
	<input name="enviar" type="submit" value="" id="login_white_button" />
</form>
</div>

<script type="text/javascript" src="<c:url value="/js/login.js" />"></script>	
