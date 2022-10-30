<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.Const"%>
<jsp:include page="<%=Const.PATH_HEAD_JSP%>"/>
<jsp:include page="<%=Const.PATH_MENU_JSP%>"/>
	<!-- /.container -->
    <!-- Page Content -->
    <div class="container">
    	<div class="col-md-5">
		    <div class="form-area">  
		        <form role="form" action="contact" method="post">
                    <h3 style="margin-bottom: 25px; text-align: center;">Formulaire de contact</h3>
    				<div class="form-group">
						<input type="text" class="form-control" id="name" name="name" placeholder="Nom" required>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="subject" name="subject" placeholder="Sujet" required>
					</div>
                    <div class="form-group">
                    <textarea class="form-control" id="message" placeholder="Message" rows="7"></textarea>                  
                    </div>
		        	<button type="submit" id="submit" class="btn btn-default pull-right">Envoyer</button>
				</form>
    		</div>
    	</div>
   		<div class="col-md-5">
   			 <div class="span4">
	    		<h2>ISI Drone</h2>
	    		<address>
	    			255 boul. Crémazie Est<br>
	    			bureau 100<br>
	    			Montréal (Québec)<br>
	    			H2M 1M2<br>
	    			<abbr title="Téléphone">Tel:</abbr> (514) 842-2426
	    		</address>
	    	</div>
   			 <div class="span8">
	        	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2794.309875018925!2d-73.6402476!3d45.5440916!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4cc918e0c061b07f%3A0x647a6b6d7cb681a7!2sISI%2C+l&#39;Institut+sup%C3%A9rieur+d&#39;informatique!5e0!3m2!1sfr!2sca!4v1436448211689" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
	    	</div>
   		</div>
	</div>
<jsp:include page="<%=Const.PATH_FOOTER_JSP%>"/>