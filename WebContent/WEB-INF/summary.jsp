<%@page import="entities.ItemCart"%>
<%@page import="entities.Cart"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="util.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//Format a deux decimal
	DecimalFormat df = new DecimalFormat("####0.00");

	//Recuperer le panier dans la session
	Cart cart = (Cart)session.getAttribute("cart");
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<div class="container">
	<div class="progress-cart">
		<span class="label label-success">Panier</span>
		<span class="label label-success">Sommaire</span>
		<span class="label label-warning">Compte</span>
		<span class="label label-warning">Facture</span>
	</div>
	<div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Sommaire</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Item</strong></td>
        							<td class="text-center"><strong>Prix</strong></td>
        							<td class="text-center"><strong>Quantité</strong></td>
        							<td class="text-right"><strong>Totaux</strong></td>
                                </tr>
    						</thead>
    						<tbody>
 								<%					          
	 								for (ItemCart itemC : cart.getCart().values()) {				      
				 	            %>
    							<tr>
    								<td><%=itemC.getName()%></td>
    								<td class="text-center"><%=df.format(itemC.getPrice())%></td>
    								<td class="text-center"><%=itemC.getQty()%></td>
    								<td class="text-right"><%=df.format(itemC.getPrice() * itemC.getQty())%></td>
    							</tr>
 								<%
				                	}
			 	                %>
    							<tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>Sous-Total</strong></td>
    								<td class="thick-line text-right"><%=df.format(cart.generateSubTotal())%>$</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Livraison</strong></td>
    								<td class="no-line text-right"><%=df.format(cart.generateShipCost())%>$</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Total</strong></td>
    								<td class="no-line text-right"><%=df.format(cart.generateTotal())%>$</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
	<form action="summary" method="post">
	<button type="submit" name="fromCart" class="btn btn-success">
		Continuer <span class="glyphicon glyphicon-play"></span>
	</button>
	</form>
</div>
<!-- Footer -->
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>