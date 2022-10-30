<%@page import="java.text.DecimalFormat"%>
<%@page import="entities.ItemCart"%>
<%@page import="entities.Order"%>
<%@page import="java.util.List"%>
<%@page import="util.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Format a deux decimal
	DecimalFormat df = new DecimalFormat("####0.00");

	// Recupere la liste de commande
	@SuppressWarnings("unchecked")
	List<Order> orderList = (List<Order>)session.getAttribute("orderList");
%>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>

<div class="container">
	<div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Historique des commandes</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<%
    							if(orderList.size() != 0){
    						%>
    						<thead>
                                <tr>
        							<td><strong>ID</strong></td>
        							<td class="text-center"><strong>Date</strong></td>
        							<td class="text-center"><strong>Nombre d'item</strong></td>
        							<td class="text-right"><strong>Total</strong></td>
                                </tr>
    						</thead>
    						<%
    							}else{
    						%>
    							<span>Aucune commande</span>
    						<%
    							}
    						%>
    						<%
    							int i = 0;
    							for(Order order: orderList){
    								i++;
    						%>
    							
	    							<tr>
	    								<td style=":hover"><%="<a href='order?no=" + i + "'>" + order.getId() + "</a>"%></td>
	    								<td class="text-center"><%=order.getDate()%></td>
	    								<td class="text-center">
	    								<%
	    									int size = 0;
	    									for (ItemCart itemC : order.getCart().values()) {
	    										size += itemC.getQty();
	    									}
	    		 	               			out.println(size);
	    								%>
	    								</td>
	    								<td class="text-right"><%=df.format(order.generateTotal())%>$</td>
	    							</tr>
    							
    						<%	
    							}
    						%>
    					</table>
    				</div>
    			</div>
			</div>
		</div>
	</div>

</div>

<!-- Footer -->
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>