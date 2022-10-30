package util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class Validation {
	
	int qtyTest = 0,
		testPassed = 0;
	
	HashMap<String, String> hm_toValidate;
	HashMap<String, Restriction> hm_keysRestrictions;
	
	public Validation(HashMap<String, String> hm_toValidate) {
		this.hm_toValidate = hm_toValidate;
		hm_keysRestrictions = new HashMap<String, Restriction>();
	}
	
	public void addRestriction(String key, Restriction restriction) {
		hm_keysRestrictions.put(key, restriction);
		qtyTest++;
	}
	
	public ArrayList<ResultValidation> validate() {
		boolean isValidate = true;
		ArrayList<ResultValidation> resultValidations = new ArrayList<ResultValidation>();
		
		//On créer un Itérateur pour passer en revue chaque pair du hashMap clé -> Restriction
		Iterator<Entry<String, Restriction>> iterator = hm_keysRestrictions.entrySet().iterator();
		//On créer un variable qui contiendra chaque paire clé -> restrictions une à la fois
		Map.Entry<String, Restriction> me_current;
  
		//Si le teste précédent était valide et qu'il y a un prochain élément à itérer
		while(isValidate && iterator.hasNext()) {
			me_current = (Map.Entry<String, Restriction>) iterator.next();
			ResultValidation tmp_resultValidation = Validation.validate(hm_toValidate, (String)me_current.getKey(), (Restriction)me_current.getValue());
		    resultValidations.add(tmp_resultValidation);
			
			if(tmp_resultValidation.getCode() == 0)
				testPassed++;
		}
		
		return resultValidations;
	}
	
	public static ResultValidation validate(HashMap<String, String> hm, String key , Restriction restriction) {
		ResultValidation result = new ResultValidation(0, key, restriction);
		
		//Erreur si la valeur n'est pas optionnel (Donc obligatoire) et quel n'est pas présente
		if(!restriction.isOptionalValid() && hm.get(key) == null 
				|| (!restriction.isOptionalValid() && hm.get(key) != null && hm.get(key).length() == 0)) {
				result.setCode(1);
			}
		
		//Je suis optionnel, mais on n'a saisie quelque chose
		// Ou je suis obligatoire et je ne suis pas null (La case n'existait même pas dans le formulaire : Tentative de hack..
		// ou vide (ce qui veut dire que la case n'a pas été rempli)
		if(result.getCode() == 0 && ((restriction.isOptionalValid() && hm.get(key) != null && hm.get(key).length() > 0) ||
				(!restriction.isOptionalValid() && hm.get(key) != null))) {
			//Erreur si le nombre caractère de la valeur est inférieur à la restriction
			if(restriction.isMinLength() && hm.get(key).length() < restriction.getMinLength()) {
				result.setCode(2);
			}
			//Erreur si le nombre de caractère de la valeur est supérieur à la restriction
			else if(restriction.isMaxLength() && hm.get(key).length() > restriction.getMaxLength()) {
				result.setCode(3);
			}
			//Erreur si la valeur ne correspond pas au pattern (Regexp)
			else if(restriction.isPattern() && !restriction.getPattern().matcher(hm.get(key)).matches()) {
				result.setCode(4);
			}
			//Erreur si la valeur n'est pas égale à la restriction
			else if(restriction.isString() && !restriction.getString().equals(hm.get(key))) {
				result.setCode(5);
			}
		}

		return result;
	}
	
	public boolean isValidate() {
		return (qtyTest == testPassed);
	}
}
