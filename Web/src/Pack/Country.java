package Pack;

public class Country {
	String country;
	double fee;

	    public Country(){
	    }
	    
	    public Country(String country,double fee) {
			this.country = country;
			this.fee = fee;
		}
		
	    
		
		public String getCountry() {
			return country;
		}
		
		public void setCountry(String country) {
			this.country = country;
		}

		public double getFee(){
			return fee;
		}
		public void setFee(double fee) {
			this.fee = fee;
		}
	    
	    
	    
	}