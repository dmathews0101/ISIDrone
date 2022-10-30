<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.Const"%>
<%@ page import="util.Misc"%>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<!-- Page content -->
<div class="container">
<%
	if(request.getParameter("fromCart") != null){
		%>
			<div class="progress-cart">
				<span class="label label-success">Panier</span>
				<span class="label label-success">Sommaire</span>
				<span class="label label-warning">Compte</span>
				<span class="label label-warning">Facture</span>
			</div>
		<%
	}
%>
<%
@SuppressWarnings("unchecked")
HashMap<String, String> hm_login = (HashMap<String, String>)request.getAttribute("hm_login");
@SuppressWarnings("unchecked")
HashMap<String, String> hm_errorMsg = (HashMap<String, String>)request.getAttribute("hm_errorMsg");

if(hm_login == null)
	hm_login = new HashMap<String, String>();

if(request.getAttribute("logout") != null) {
%>
	<div class="alert alert-success" role="alert">
	  		Vous êtes maintenant déconnecté.
	  	</div>
<%	
}

if(hm_errorMsg != null && !hm_errorMsg.get("loginState").equals("ok")) {
%>
<div class="panel panel-danger">
	<div class="panel-heading">
 		<h3 class="panel-title">Login Invalide</h3>
	</div>
	<ul class="panel-body">
<%
	if(hm_errorMsg != null && hm_errorMsg.get("loginState").equals("badEmailPassword")) {
%>
		<li style="margin-bottom: 0px; white-space: pre-line;">Mauvais combinaison Email/Mot de passe</li>
<%
	}
	else if(hm_errorMsg != null && hm_errorMsg.get("loginState").equals("restrictionNotSatisfied")) {
		if(hm_errorMsg != null && hm_errorMsg.containsKey("login")) {
%>
		<li style="margin-bottom: 0px; white-space: pre-line;"><%=hm_errorMsg.get("login")%></li>
<%
		}

		if(hm_errorMsg != null && hm_errorMsg.containsKey("password")) {
%>
		<li style="margin-bottom: 0px; white-space: pre-line;"><%=hm_errorMsg.get("password")%></li>
<%
		}
	}
%>
 	</ul>
</div>
<%
}
%>
<form action="login" method="post" class="panel panel-primary form-horizontal" style="float: unset; margin: auto;">
	<div class="panel-heading">
		<h3 class="panel-title">Connexion</h3>
	</div>
	<div class="panel-body">
		<fieldset class="col-sm-10 col-lg-10 col-md-10">
			<legend>Informations de connexion</legend>
			<div class="form-group">
				<label for="login">E-mail: </label>
				<input type="email" id="login" class="form-control" name="login" placeholder="toto@gmail.com" value="<%=Misc.getOrDefault(hm_login, "login", "")%>" required />
			</div>
			<div class="form-group">
				<label for="password">Mot de passe: </label>
				<input type="password" id="password" class="form-control" name="password" required />
			</div>
			<div class="form-group login-group-checkbox">
				<input id="remember" name="remember" type="checkbox">
				<label for="remember">Connexion automatique</label>
			</div>
<%
				if(request.getParameter("fromCart") != null) {
%>
			<input type="hidden" name="fromCart" value="true">
<%
				}
%>
			<button type="submit" class="btn btn-default">Connexion</button>
		</fieldset>
	</div>
</form>
<!-- <a href="login?action=resetPassword" style="clear: left;">Mot de passe oublié ?</a><br /> -->
</div>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>