package util;

import java.util.regex.Pattern;

public class Restriction {

	private boolean isOptionalValid = false,
			isMinLength = false,
			isMaxLength = false,
			isPattern = false,
			isString = false;
	
	private int minLength, maxLength;
	private Pattern pattern;
	private String string;
	
	//Constructeurs
	public Restriction() {}
	
	public Restriction(boolean isOptionalValid) {
		setOptionalValid(isOptionalValid);
	}
	
	public Restriction(boolean isOptionalValid, String string) {
		setOptionalValid(isOptionalValid);
		setString(string);
	}
	
	public Restriction(boolean isOptionalValid, int minLength) {
		setOptionalValid(isOptionalValid);
		setMinLength(minLength);
	}
	
	public Restriction(boolean isOptionalValid, Pattern pattern) {
		this(isOptionalValid);
		setPattern(pattern);
	}
	
	public Restriction(boolean isOptionalValid, int minLength, int maxLength) {
		setOptionalValid(isOptionalValid);
		setMinLength(minLength);
		setMaxLength(maxLength);
	}
	
	public Restriction(boolean isOptionalValid, int minLength, Pattern pattern) {
		this(isOptionalValid, minLength);
		setPattern(pattern);
	}
	
	public Restriction(boolean isOptionalValid, int minLength, int maxLength, Pattern pattern) {
		this(isOptionalValid, minLength, maxLength);
		setPattern(pattern);
	}
	
	public Restriction(int minLength) {
		setMinLength(minLength);
	}
	
	public Restriction(int minLength, int maxLength) {
		setMinLength(minLength);
		setMaxLength(maxLength);
	}
	
	public Restriction(int minLength, int maxLength, Pattern pattern) {
		this(minLength, maxLength);
		setPattern(pattern);
	}
	
	public Restriction(Pattern pattern) {
		setPattern(pattern);
	}
	
	public Restriction(String string) {
		setString(string);
	}
	
	//Méthodes
	public boolean isOptionalValid() {
		return isOptionalValid;
	}
	
	public boolean isMinLength() {
		return isMinLength;
	}
	
	public boolean isMaxLength() {
		return isMaxLength;
	}
	
	public boolean isPattern() {
		return isPattern;
	}
	
	public boolean isString() {
		return isString;
	}
	
	public int getMinLength() {
		return minLength;
	}
	
	public int getMaxLength() {
		return maxLength;
	}
	
	public Pattern getPattern() {
		return pattern;
	}
	
	public String getString() {
		return string;
	}
	
	public void setOptionalValid(boolean isValid) {
		isOptionalValid = isValid;
	}
	
	public void setMinLength(int minLength) {
		isMinLength = (minLength > 0);
		this.minLength = minLength;
	}
	
	public void setMaxLength(int maxLength) {
		isMaxLength = (maxLength > 0);
		this.maxLength = maxLength;
	}
	
	public void setPattern(Pattern pattern) {
		isPattern = (pattern != null);
		this.pattern = pattern;
	}
	
	public void setString(String string) {
		isString = (string != null && string.length() > 0);
		this.string = string;
	}
}
