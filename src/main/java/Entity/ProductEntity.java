package Entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "Product", schema = "dbo", catalog = "dbJava5_Assignment")
public class ProductEntity {
    private Integer id;
    private String name;
    private String image;
    private int price;
    private String detail;
    private Integer quantityView;
    private Date createdDate;
    private CategoryProductEntity categoryProductByCategoryId;
    private List<CommentEntity> listComment;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "image")
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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
    @Column(name = "detail")
    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Basic
    @Column(name = "quantityView")
    public Integer getQuantityView() {
        return quantityView;
    }

    public void setQuantityView(Integer quantityView) {
        this.quantityView = quantityView;
    }

    @Basic
    @Column(name = "createdDate")
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductEntity that = (ProductEntity) o;

        if (id != that.id) return false;
        if (price != that.price) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (image != null ? !image.equals(that.image) : that.image != null) return false;
        if (detail != null ? !detail.equals(that.detail) : that.detail != null) return false;
        if (quantityView != null ? !quantityView.equals(that.quantityView) : that.quantityView != null) return false;
        if (createdDate != null ? !createdDate.equals(that.createdDate) : that.createdDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + price;
        result = 31 * result + (detail != null ? detail.hashCode() : 0);
        result = 31 * result + (quantityView != null ? quantityView.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "categoryId", referencedColumnName = "id", nullable = false)
    public CategoryProductEntity getCategoryProductByCategoryId() {
        return categoryProductByCategoryId;
    }

    public void setCategoryProductByCategoryId(CategoryProductEntity categoryProductByCategoryId) {
        this.categoryProductByCategoryId = categoryProductByCategoryId;
    }

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    public List<CommentEntity> getListComment(){
        return listComment;
    }

    public void setListComment(List<CommentEntity> listComment){
        this.listComment = listComment;
    }
}
