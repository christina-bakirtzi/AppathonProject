package Pack;
//Model file for database table order. Get & set for all attributes.
public class Order {
	private int order_id;
	private String username;
	private double total_price;

	public Order(int order_id, String username, double total_price) {
		this.order_id = order_id;
		this.total_price = total_price;
		this.username = username;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public double getTotal_price() {
		return total_price;
	}

	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}

}