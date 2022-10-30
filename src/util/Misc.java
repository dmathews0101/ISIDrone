package util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

public class Misc {

	// Retourne le nom du fichier et son extension en examinant un URL
	public static String getFileNameFromUrl(String url){
		System.out.println(url);
		String fileNameWithoutExtn = "";
		
		if(! (url.lastIndexOf('.') == -1)){
			String fileName = url.substring(url.lastIndexOf('/')+1);
			fileNameWithoutExtn = fileName.substring(0, fileName.lastIndexOf('.'));
		}else
			return "index";
		return fileNameWithoutExtn;
	}
	
	//WorkAround pour éviter les nullPointer. On veut la chaine par défaut s'il n'existe pas
	public static String getOrDefault(HashMap<String, String> hm, String key, String defaultValue) {
		String returnValue = (hm != null ? hm.getOrDefault(key, defaultValue) : defaultValue);
		
		return (returnValue != null ? returnValue : defaultValue);
	}
	
	public static boolean isNumeric(String str)  
	{  
	  try  
	  {  
	    @SuppressWarnings("unused")
		double d = Double.parseDouble(str);  
	  }  
	  catch(NumberFormatException nfe)  
	  {  
	    return false;  
	  }  
	  return true;  
	}
	public static String getCurrDate(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/dd/MMM");
		Date date = new Date();
		System.out.println(dateFormat.format(date));
		return dateFormat.format(date);
	}
}
