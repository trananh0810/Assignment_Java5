package Entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "Orders", schema = "dbo", catalog = "dbJava5_Assignment")
public class OrdersEntity {
    private int id;
    private Date createdDate;
    private String address;
    private String note;
    private OrderStatusEntity orderStatus;
    private UsersEntity user;
    private List<OrderDetailEntity> listOrderDetail;

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
    @Column(name = "createdDate")
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "note")
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrdersEntity that = (OrdersEntity) o;

        if (id != that.id) return false;
        if (createdDate != null ? !createdDate.equals(that.createdDate) : that.createdDate != null) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;
        if (note != null ? !note.equals(that.note) : that.note != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (note != null ? note.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "statusId")
    public OrderStatusEntity getOrderStatus(){
        return this.orderStatus;
    }

    public void setOrderStatus(OrderStatusEntity orderStatus){
        this.orderStatus = orderStatus;
    }

    @ManyToOne
    @JoinColumn(name = "userId")
    public UsersEntity getUser(){
        return this.user;
    }

    public void setUser(UsersEntity user){
        this.user = user;
    }

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
    public List<OrderDetailEntity> getListOrderDetail() {
        return listOrderDetail;
    }

    public void setListOrderDetail(List<OrderDetailEntity> listOrderDetail) {
        this.listOrderDetail = listOrderDetail;
    }
}
