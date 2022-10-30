$(function () {
	
	// Calcule le nouveau total
	$( ".qty-txt" ).keyup(function() {
		
		var str_id = $(this).attr("id");
		var id = str_id.substring(3);
		var qty = parseInt($(this).val());
		var stock = $("#stock-qty-" + id).html();
		
		// Erreur si champs vide ou == 0
		if(isNaN(qty) || qty == 0){
			$("#pt" + id).html("erreur!");
		}else{
			var price = parseFloat($("#pp-" + id).html());
			var old_total = parseFloat($("#pt-" + id).html());
			var sub_total = parseFloat($("#cart-subtotal").html());
			
			// Met a jour le prix du produit
			var total = price * qty;
			$("#pt-" + id).html(total.toFixed(2) + "$");
			
			// Met a jour le sous-total
			sub_total = sub_total - old_total + total;
			$("#cart-subtotal").html(sub_total.toFixed(2) + "$");
			
			// Met a jour le total
			var shipping = parseFloat($("#cart-shipping").html());
			var grand_total = sub_total + shipping; 
			$("#cart-total").html(grand_total.toFixed(2) + "$");
			
			// Met le stock status a jour
			
			if(qty > stock){
				if($("#stock-status-" + id).hasClass("text-success")){
					$("#stock-status-" + id).removeClass("text-success");
					$("#stock-status-" + id).addClass("text-warning");
					$("#stock-status-" + id).html("<strong>Stock Insufisant</strong>");
				}
			}else{
				if($("#stock-status-" + id).hasClass("text-warning")){
					$("#stock-status-" + id).removeClass("text-warning");
					$("#stock-status-" + id).addClass("text-success");
					$("#stock-status-" + id).html("<strong>En stock</strong>");
				}
			}
			
		}
	});
	
	$(".qty-txt").ForceNumericOnly();
	
})

// Valeur numerique seulement
jQuery.fn.ForceNumericOnly =
function()
{
    return this.each(function()
    {
        $(this).keydown(function(e)
        {
            var key = e.charCode || e.keyCode || 0;
            // permet backspace, tab, delete, enter, arrows, numbers et keypad numbers seulement
            // home, end, period, and numpad decimal
            return (
                key == 8 || 
                key == 9 ||
                key == 13 ||
                key == 46 ||
                key == 110 ||
                key == 190 ||
                (key >= 35 && key <= 40) ||
                (key >= 48 && key <= 57) ||
                (key >= 96 && key <= 105));
        });
    });
};

