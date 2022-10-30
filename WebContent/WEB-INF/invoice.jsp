<%@page import="java.util.List"%>
<%@page import="entities.Order"%>
<%@page import="util.Misc"%>
<%@page import="entities.Address"%>
<%@page import="entities.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entities.ItemCart"%>
<%@page import="entities.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="util.Const"%>

<%!
public enum PageType {
	// Enum indiquant le contenu a afficher
    INVOICE, ORDER
}
%>
<%
	// Enum indiquant le contenu a afficher
	PageType pageType;
	
	if(session.getAttribute("orderList") != null && request.getParameter("no") != null){
		pageType = PageType.ORDER;
	}else{
		pageType = PageType.INVOICE;
	}
	
	
	//Format a deux decimal
	DecimalFormat df = new DecimalFormat("####0.00");

	// Recuperer le panier dans la session
	Cart cart = (Cart)session.getAttribute("cart");
	
	// Detruit le panier lorseque la transaction est completer.
	session.setAttribute("cart", null);
	
	// Recuperer l'utilisateur
	User user = (User)session.getAttribute("user");
	Address address = user.getShipAddress();
	
	Order order = null;
	// si une commande est presente dans la session et que le parametre get est present afficher l'hitorique
	if(pageType == PageType.ORDER){
		@SuppressWarnings("unchecked")
		List<Order> orderList = (List<Order>)session.getAttribute("orderList");
		int id = Integer.parseInt(request.getParameter("no")) - 1;
		order = orderList.get(id);
		cart = new Cart(order.getCart());
	}
%>

<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
<div class="container">
	<%
    	if(pageType == PageType.INVOICE){
	%>
			<div class="alert alert-dismissible alert-success">
			  	<button type="button" class="close" data-dismiss="alert">×</button>
			 	 Votre commande à été transmise.
			</div>
			<div class="progress-cart">
				<span class="label label-success">Panier</span>
				<span class="label label-success">Sommaire</span>
				<span class="label label-success">Compte</span>
				<span class="label label-success">Facture</span>
			</div>	
	<%
		}
	%>
	<div id="invoice-print">
    <div class="row" >
        <div class="col-xs-12">
    		<div class="invoice-title">
	    		<%
	    			if(pageType == PageType.ORDER){
	 			%>
	    			<h2>Facture</h2><h3 class="pull-right">Commande # <%=order.getId()%></h3>		
	    		<%
	    			}else{
	    		%>
	    			<h2>Facture</h2><h3 class="pull-right">Commande # <%=(Integer)request.getAttribute("orderId")%></h3>	
	    		<%
	    			}
	    		%>
    			
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Facturé à:</strong><br>
    					<%=user.getFirstName()%> <%=user.getLastName()%><br>
    					<%=address.getNo()%> <%=address.getStreet()%><br>
    					<%=((address.getAppt() == null)? "Apt. " + address.getAppt() + "<br>" : "")%>
    					<%=address.getCity()%>, <%=address.getState() %> <%=address.getZip()%><br>
    					<%=address.getCountry()%>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
        			<strong>Envoyé à:</strong><br>
    					<%=user.getFirstName()%> <%=user.getLastName()%><br>
    					<%=address.getNo()%> <%=address.getStreet()%><br>
    					<%=((address.getAppt() == null)? "Apt. " + address.getAppt() + "<br>" : "")%>
    					<%=address.getCity()%>, <%=address.getState() %> <%=address.getZip()%><br>
    					<%=address.getCountry()%>
    				</address>
    			</div>
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					<strong>Methode de paiment:</strong><br>
    					Visa **** 4242<br>
    					<%=user.getEmail()%>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Date:</strong><br>
    					<%=Misc.getCurrDate()%><br><br>
    				</address>
    			</div>
    		</div>
    	</div>
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
    </div>
    <button id="print-invoice" class="btn btn-default">
		Imprimer
	</button>
</div>
<!-- Footer -->
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>