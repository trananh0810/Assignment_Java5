package Entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "Blog", schema = "dbo", catalog = "dbJava5_Assignment")
public class BlogEntity {
    private Integer id;
    private String title;
    private String image;
    private String content;
    private Date createdDate;
    private Integer quantityView;
    private CategoryBlogEntity categoryBlog;
    private UsersEntity user;

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
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "createdDate")
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Basic
    @Column(name = "quantityView")
    public Integer getQuantityView() {
        return quantityView;
    }

    public void setQuantityView(Integer quantityView) {
        this.quantityView = quantityView;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BlogEntity that = (BlogEntity) o;

        if (id != that.id) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (image != null ? !image.equals(that.image) : that.image != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (createdDate != null ? !createdDate.equals(that.createdDate) : that.createdDate != null) return false;
        if (quantityView != null ? !quantityView.equals(that.quantityView) : that.quantityView != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        result = 31 * result + (quantityView != null ? quantityView.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "categoryId")
    public CategoryBlogEntity getCategoryBlog(){
        return this.categoryBlog;
    }

    public void setCategoryBlog(CategoryBlogEntity categoryBlog){
        this.categoryBlog = categoryBlog;
    }

    @ManyToOne
    @JoinColumn(name = "userId")
    public UsersEntity getUser(){
        return this.user;
    }

    public void setUser(UsersEntity user){
        this.user = user;
    }
}
