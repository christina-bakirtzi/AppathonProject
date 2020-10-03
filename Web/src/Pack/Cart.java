package Pack;

//Model file for database table cart. Get & set for each attribute.
public class Cart {
	int product_id;
	int quantity;
	double total_price;;

	    public Cart(){
	    }
	    
	    public Cart(int product_id, int quantity, double total_price) {
			this.product_id = product_id;
			this.quantity = quantity;
			this.total_price = total_price;
		}
		
	    
		
		public int getProduct_id() {
			return product_id;
		}
		
		public void setProduct_id(int product_id) {
			this.product_id = product_id;
		}

		public int getQuantity() {
			return quantity;
		}
		
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}	
		
		public double getTotal_price(){
			return total_price;
		}
		public void setTotal_price(double total_price) {
			this.total_price = total_price;
		}
	    
	    
	    
	}


