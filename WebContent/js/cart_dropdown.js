function getXMLHttpRequest() {
	var xhr = null;
	if (window.XMLHttpRequest || window.ActiveXObject) {
		if (window.XMLHttpRequest || window.ActiveXObject) {
			// si internet explorer
			if (window.ActiveXObject) {
			  try {
			     xhr = new ActiveXObject("Msxml2.XMLHTTP");
			  } catch(e) {
			     xhr = new ActiveXObject("Microsoft.XMLHTTP");
			  }
			// sinon c est mozilla ou chrome
			} else {
			xhr = new XMLHttpRequest(); 
			}
		}

	} else {
		alert("Votre navigateur ne supporte pas l'objet XMLHTTPRequest change de pc ...");
		return null;
	}
	return xhr;
}

$( document ).ready(function() {

	// Envoie la requete au serveur par AJAX pour supprimer un item du panier
	$(".remove-cart-item").click(function() {
		var xmlHttpR = getXMLHttpRequest();
		var serial = $(this).attr("data");
		var my_li = $(this).closest("li");
		
		xmlHttpR.open("GET", "cartDropdownAPI?removeItem=" + serial, true);
		xmlHttpR.send(null);
		
		var reponse;
		xmlHttpR.onreadystatechange = function() {
			if (xmlHttpR.readyState == 4 && xmlHttpR.status == 200) {
				// Suprime le li parent
				$(my_li).remove();
				
				// Decremente le nombre d'item
				var nb_item = parseInt($("#nb_cart_item").html());
				$("#nb_cart_item").html(nb_item - 1);
				
				// Si le panier est vide, suprime le lien
				if (nb_item == 1){
					$("#dd-info").html("<span>Le panier est vide</span>");
				}
			}
		}
		 
		
		});
	
});


