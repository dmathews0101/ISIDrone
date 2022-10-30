package entities;

public class Address {
	
	int id;
	String no;
	String appt;
	String street;
	String zip;
	String city;
	String state;
	String country;
	
	// Constructeur
	public Address() {
		super();
	}

	public Address(int id, String no, String appt, String street, String zip,
			String city, String state, String country) {
		super();
		this.id = id;
		this.no = no;
		this.appt = appt;
		this.street = street;
		this.zip = zip;
		this.city = city;
		this.state = state;
		this.country = country;
	}



	// Getters | Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNo() {
		return no;
	}
	
	public void setNo(String no) {
		this.no = no;
	}

	public String getAppt() {
		return appt;
	}

	public void setAppt(String appt) {
		this.appt = appt;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	
}
