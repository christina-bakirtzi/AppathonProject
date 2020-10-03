package Pack;


//Model file for database table Item. Get & set for each attribute.
//Holds the items of the saved orders, linked to the order with order_id.
public class Item {

	private int product_id;
	private int order_id;
	private int quantity;
	private double total_price;

	public Item() {
	}

	public Item(int product_id, int order_id, int quantity,double total_price) {
		this.order_id = order_id;
		this.product_id = product_id;
		this.quantity = quantity;
		this.total_price = total_price;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getProduct_id() {
		return product_id;
	}
	
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	
	public double getTotal_price(){
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
    

}