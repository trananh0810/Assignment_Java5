package Entity;

import javax.persistence.*;

@Entity
@Table(name = "OrderDetail", schema = "dbo", catalog = "dbJava5_Assignment")
public class OrderDetailEntity {
    private int id;
    private int price;
    private int quantity;
    private OrdersEntity order;
    private ProductEntity product;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "price")
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Basic
    @Column(name = "quantity")
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderDetailEntity that = (OrderDetailEntity) o;

        if (id != that.id) return false;
        if (price != that.price) return false;
        if (quantity != that.quantity) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + price;
        result = 31 * result + quantity;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "orderId")
    public OrdersEntity getOrder(){
        return this.order;
    }

    public void setOrder(OrdersEntity order){
        this.order = order;
    }

    @ManyToOne
    @JoinColumn(name = "productId")
    public ProductEntity getProduct(){
        return this.product;
    }

    public void setProduct(ProductEntity product){
        this.product = product;
    }
}
