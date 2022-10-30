package action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.MCookies;
import manager.MLogin;
import util.Restriction;
import util.ResultValidation;
import util.Validation;
import entities.SingleEntry; 
import entities.User;

public class ActionLogin {
	
	public static void loginAttempt(HttpServletRequest request, HttpServletResponse response) {
		//Si le login n'est pas valide, alors on ajoute un attribut pour notifier le servlet
		//On créer un hashMap pour le contenir les données du formulaire
		HashMap<String, String> hm_login = new HashMap<String, String>();
		//On créer un HashMap pour contenir les potiennelles message d'erreurs
		HashMap<String, String> hm_errorMsg = new HashMap<String, String>();
		
		//On ajoute les données au HashMap
		hm_login.put("login", request.getParameter("login").toLowerCase());
		hm_login.put("password", request.getParameter("password"));
		
		//Création des restriction de validation
		Restriction restrictEmail = new Restriction(1, 45, Pattern.compile("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"));
		Restriction restrictPassword = new Restriction(8, 40, Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"));
		
		//Création d'un objet Validation et ajout des restrictions à ce dernier
		Validation validation = new Validation(hm_login);
		validation.addRestriction("login", restrictEmail);
		validation.addRestriction("password", restrictPassword);
		
		//On conserve les résultat des tests
		ArrayList<ResultValidation> resultValidations = validation.validate();
		//On parcours les résultat des tests
		for(ResultValidation rv : resultValidations) {
			//Si le test ne passe pas, alors on ajoute un message d'erreur
			if(rv.getCode() != 0)
					hm_errorMsg.put(rv.getKey(), getErrorMsg(rv));
		}
		
		//Si tous les test ont été passés sur les données du formulaire
		if(validation.isValidate()) {
			//Il faut tester la combinaison login/motdepasse
			//Retourne un utilisateur si les informations de connexion sont valides, sinon retourne null
			User user = MLogin.login(hm_login.get("login"), hm_login.get("password"));
			
			//Si c'est un utilisateur valide
			if(user != null) {
				//Si l'utilisateur à cocher la case Connexion automatique
				if(request.getParameter("remember") != null) {
					SingleEntry<Integer, String> se_idToken = MLogin.setAutoLogin(user);
					
					if(se_idToken != null) {
						MCookies.create("id", String.valueOf(se_idToken.key()), response);
						MCookies.create("token", String.valueOf(se_idToken.value()), response);
					}
				}
				
				hm_errorMsg.put("loginState", "ok");
				request.getSession().setAttribute("user", user);
			}
			else {
				hm_errorMsg.put("loginState", "badEmailPassword");
			}
		}
		//Si les test ne sont pas tout passé avec succès
		else
			hm_errorMsg.put("loginState", "restrictionNotSatisfied");
		
		request.setAttribute("hm_login", hm_login);
		request.setAttribute("hm_errorMsg", hm_errorMsg);
	}
	
	public static User getUserFromAutoLogin(HttpServletRequest request) {
		User user = null;
		if(MCookies.exist("id", request) && MCookies.exist("token", request)) {
			
			SingleEntry<Integer, String> se_idToken = new SingleEntry<Integer, String>(Integer.parseInt(MCookies.getValue("id", request)), MCookies.getValue("token", request));
			user = MLogin.getUserFromAutoLogin(se_idToken);
		}
		
		return user;
	}
	
	private static String getErrorMsg(ResultValidation resValid) {
		String errorMsg = "Champ: ";
		switch(resValid.getKey()) {
			case "login":
				errorMsg += "Email\n"+getErrorMsgForEmail(resValid);
				break;
			case "password":
				errorMsg += "Mot de passe\n"+getErrorMsgForPassword(resValid);
				break;
		}
		
		return errorMsg;
	}
	
	//Permet de traduire l'erreur en texte pour l'utilisateur puisque comprendre
	private static String getErrorMsgForEmail(ResultValidation resValid) {
		String errorMsg = "";
		Restriction restriction = resValid.getRestriction();
		switch(resValid.getCode()) {
			case 1:
				errorMsg += "Vous devez remplir le champ.\n";
			case 2:
				if(restriction.isMinLength())
					errorMsg += "Vous devez saisir au moins "+restriction.getMinLength()+" caractère(s).\n";
			case 3:
				if(restriction.isMaxLength())
					errorMsg += "Vous devez saisir un maximum de "+restriction.getMaxLength()+" caractère(s).\n";
			case 4:
				errorMsg += "Veuillez saisir une adresse email Valide.\n";
				break;
			case 5:
				break;
		}
		
		return errorMsg;
	}
	
	//Permet de traduire l'erreur en texte pour l'utilisateur puisque comprendre
	private static String getErrorMsgForPassword(ResultValidation resValid) {
		String errorMsg = "";
		Restriction restriction = resValid.getRestriction();
		switch(resValid.getCode()) {
			case 1:
				errorMsg += "Vous devez remplir le champ.\n";
			case 2:
				if(restriction.isMinLength())
					errorMsg += "Vous devez saisir au moins "+restriction.getMinLength()+" caractère(s).\n";
			case 3:
				if(restriction.isMaxLength())
					errorMsg += "Vous devez saisir un maximum de "+restriction.getMaxLength()+" caractère(s).\n";
			case 4:
				errorMsg += "Veuillez entrez une mot de passe comprenand au moins 1 minuscule, 1 majuscule, 1 chiffre et 1 caractère spécial.";
			case 5:
				break;
		}
		
		return errorMsg;
	}
}
