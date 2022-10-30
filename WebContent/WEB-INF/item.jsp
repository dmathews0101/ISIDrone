<%@page import="java.text.DecimalFormat"%>
<%@page import="entities.Item"%>
<%@page import="action.ActionCategory"%>
<%@page import="java.util.ArrayList, entities.Category"%>
<%@page import="entities.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.Const"%>
<%
	//Format a deux decimal
	DecimalFormat df = new DecimalFormat("####0.00");

	Item item = (Item)request.getAttribute("item");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
	<!-- /.container -->
    <!-- Page Content -->
    <div class="container">
<%
if(item != null) {
%>
		<div class="row">
			<a href="<%=Const.PATH_IMG_PRODUCT+item.getImage()%>" title="Agrandir">
				<img style="float: left; margin: 20px; max-width: 320px; max-height: 150px;" src="<%=Const.PATH_IMG_PRODUCT+item.getImage()%>" alt="Image du produit <%=item.getName()%>" />
			</a>
			<h3><%=item.getName()%></h3>
		</div>
		<div class="row" style="margin-left:0px;">
		<h4><%=df.format(item.getPrice())+ "$"%></h4>
			<div><%=item.getDescription()%></div>
			<div class="ratings">	    
	            <p>
	                <span class="glyphicon glyphicon-star"></span>
	                <span class="glyphicon glyphicon-star"></span>
	                <span class="glyphicon glyphicon-star"></span>
	                <span class="glyphicon glyphicon-star"></span>
	                <span class="glyphicon glyphicon-star"></span>
	                <span style="margin-left:40px;">0 reviews</span>
	            </p>
	           
	        </div>
			<form method="post" id="form-add-item">
	       		<div>
		       		<input type="hidden" name="itemId" value="<%=item.getId()%>">
			        <button type="submit" class="btn btn-info">
						<span class="glyphicon glyphicon-shopping-cart"></span> Ajouter</button>
						<input type="number" min="1" max="999" name="qty" class="item-qty form-control">
				</div>
			</form>
		</div>
<%
}
else {
%>
		<div class="alert alert-info">
			Aucun produit ne correspond à votre demande.
		</div>
		<a href="items?category=1" class="btn btn-default">Retour à l'inventaire</a>
<%
}
%>
    </div>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>