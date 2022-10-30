package util;

public class ResultValidation {
	private int code;
	private String key;
	private Restriction restriction;
	
	public ResultValidation(){}
	
	public ResultValidation(int code, String key, Restriction restriction) {
		this.code = code;
		this.key = key;
		this.restriction = restriction;
	}

	public int getCode() {
		return code;
	}
	
	public String getKey() {
		return key;
	}
	
	public Restriction getRestriction() {
		return restriction;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
	
	public void setKey(String key) {
		this.key = key;
	}
	
	public void setRestriction(Restriction restriction) {
		this.restriction = restriction;
	}
}
