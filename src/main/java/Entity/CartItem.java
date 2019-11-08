package Entity;

import java.io.Serializable;

public class CartItem implements Serializable {
    ProductEntity product;
    Integer quantity;

    public CartItem() {
    }

    public CartItem(ProductEntity product, Integer quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
