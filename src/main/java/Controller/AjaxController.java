package Controller;

import Constant.Constant;
import DAO.DaoImpl.*;
import Entity.*;
import Utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
    @Autowired
    UserDaoImpl userDao;

    @Autowired
    ProductDaoImpl productDao;

    @Autowired
    FeedbackDaoImpl feedbackDao;

    @Autowired
    OrderDaoImpl orderDao;

    @Autowired
    OrderDetailDaoImpl orderDetailDao;

    @Autowired
    CategoryProductDaoImpl categoryProductDao;

    @Autowired
    CategoryBlogDaoImpl categoryBlogDao;

    @Autowired
    BlogDaoImpl blogDao;

    @Autowired
    CommentDaoImpl commentDao;

    @PostMapping("/xuLyDangNhap")
    public String xuLyDangNhap(@RequestParam String email, @RequestParam String password, HttpSession session){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("email", email);
        List<UsersEntity> listUser = userDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null,null,null,null);

        if (listUser.size() > 0){
            UsersEntity usersEntity = listUser.get(0);

            if (usersEntity.getPassword().equals(Md5Util.getMd5(password))){
                session.setAttribute(Constant.USER_LOGIN, usersEntity);
                return "success";
            } else {
                return "password_wrong";
            }
        } else {
            return "email_not_exist";
        }
    }

    @PostMapping("/xuLyDangXuat")
    public String xuLyDangXuat(HttpSession session){
        session.removeAttribute(Constant.USER_LOGIN);

        return "success";
    }

    @PostMapping("/xuLyDangKy")
    public String xuLyDangKy(@ModelAttribute UsersEntity user){
        if (checkPhoneExist(user.getPhone())){
            return Constant.PHONE_EXIST;
        }

        if (checkEmailExist(user.getEmail())){
            return Constant.EMAIL_EXIST;
        }

        Date now = new Date(System.currentTimeMillis());
        RoleEntity role = new RoleEntity(); role.setId(2);

        user.setCreatedDate(now);
        user.setRoleByRoleId(role);
        user.setPassword(Md5Util.getMd5(user.getPassword()));

        Integer idReturn = userDao.insert(user);

        return "success";
    }

    @PostMapping("/themGioHang")
    public String addCart(@RequestParam Integer idProduct, HttpSession session){
        ProductEntity product = productDao.findById(idProduct);

        List<CartItem> listCart = (List<CartItem>) session.getAttribute(Constant.CARTS);

        boolean flagCartItemExist = false;

        if (listCart == null){
            listCart = new ArrayList<CartItem>();
        }

        if (listCart.size() > 0){
            for (CartItem item : listCart){
                if (item.getProduct().equals(product)){
                    item.setQuantity(item.getQuantity() + 1);
                    flagCartItemExist = true;
                }
            }
        }

        if (flagCartItemExist == false){
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setQuantity(1);

            listCart.add(cartItem);
        }

        session.setAttribute(Constant.CARTS, listCart);

        return listCart.size()+"";
    }

    @PostMapping("/sendFeedback")
    public String sendFeedback(@ModelAttribute FeedbackEntity feedback){
        Date createdDate = new Date(System.currentTimeMillis());
        feedback.setCreatedDate(createdDate);

        Integer idReturn = feedbackDao.insert(feedback);

        return Constant.SUCCESS;
    }

    @PostMapping("/updateQuantityProductInCart")
    public String updateQuantityProductInCart(@RequestParam Integer id, @RequestParam Integer quantity
            , HttpSession session){
        ProductEntity product = productDao.findById(id);

        List<CartItem> listCart = (List<CartItem>) session.getAttribute(Constant.CARTS);

        for (int i = 0; i < listCart.size(); i++) {
            CartItem item = listCart.get(i);

            if (item.getProduct().equals(product)){
                item.setQuantity(quantity);
                break;
            }
        }

        return "";
    }

    @PostMapping("/deleteProductInCart")
    public String deleteProductInCart(@RequestParam Integer id, HttpSession session){
        ProductEntity product = productDao.findById(id);

        List<CartItem> listCart = (List<CartItem>) session.getAttribute(Constant.CARTS);

        for (int i = 0; i < listCart.size(); i++) {
            CartItem item = listCart.get(i);

            if (item.getProduct().equals(product)){
                listCart.remove(i);
                break;
            }
        }

        return "";
    }

    @PostMapping("/order")
    public String createOrder(@RequestParam String address, @RequestParam String note, HttpSession session){
        Date now = new Date(System.currentTimeMillis());
        UsersEntity usersEntity = (UsersEntity) session.getAttribute(Constant.USER_LOGIN);
        List<CartItem> listCart = (List<CartItem>) session.getAttribute(Constant.CARTS);
        OrderStatusEntity orderStatus = new OrderStatusEntity();orderStatus.setId(1);

        OrdersEntity orders = new OrdersEntity();
        orders.setCreatedDate(now);
        orders.setAddress(address);
        orders.setNote(note);
        orders.setUser(usersEntity);
        orders.setOrderStatus(orderStatus);

        Integer idOrderReturn = orderDao.insert(orders);

        OrdersEntity orderReturn = new OrdersEntity(); orderReturn.setId(idOrderReturn);

        for (CartItem item : listCart){
            OrderDetailEntity orderDetail = new OrderDetailEntity();
            orderDetail.setPrice(item.getProduct().getPrice());
            orderDetail.setQuantity(item.getQuantity());
            orderDetail.setOrder(orderReturn);
            orderDetail.setProduct(item.getProduct());

            orderDetailDao.insert(orderDetail);
        }

        session.removeAttribute(Constant.CARTS);

        return "";
    }

    @PostMapping("/admin/addEitUser")
    public String addEitUser(@ModelAttribute UsersEntity user, @RequestParam Integer idRole){
        RoleEntity role = new RoleEntity(); role.setId(idRole);

        user.setRoleByRoleId(role);

        if (user.getId() == null){
            if (checkPhoneExist(user.getPhone())){
                return Constant.PHONE_EXIST;
            }

            if (checkEmailExist(user.getEmail())){
                return Constant.EMAIL_EXIST;
            }

            Date createdDate = new Date(System.currentTimeMillis());
            user.setCreatedDate(createdDate);

            user.setPassword(Md5Util.getMd5(user.getPassword()));

            userDao.insert(user);
        } else {
            userDao.update(user);
        }

        return Constant.SUCCESS;
    }

    @PostMapping("/admin/deleteUser")
    public String deleteUser(@RequestParam Integer id){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("userId", id);

        List<OrdersEntity> listOrder = orderDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null,null,null,null);

        if (listOrder.size() > 0){
            return "cannot_delete_cause_order";
        }

        List<CommentEntity> listComment = commentDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null,null,null,null);

        if (listComment.size() > 0){
            return "cannot_delete_cause_comment";
        }

        List<Integer> listIdDel = new ArrayList<Integer>();
        listIdDel.add(id);

        userDao.delete(listIdDel);

        return Constant.SUCCESS;
    }

    @PostMapping("/admin/cate/product/addEdit")
    public String addEditCateProduct(@ModelAttribute CategoryProductEntity cateProduct){
        if (cateProduct.getId() == null){
            if (checkCateProductExist(cateProduct.getName())){
                return "cate_exist";
            }

            categoryProductDao.insert(cateProduct);
        } else {
            categoryProductDao.update(cateProduct);
        }

        return Constant.SUCCESS;
    }

    @PostMapping("/admin/cate/product/delete")
    public String deleteCateProduct(@RequestParam Integer id){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("categoryId", id);

        List<ProductEntity> listProduct = productDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null,null,null,null);

        if (listProduct.size() > 0){
            return "cannot_delete";
        }

        List<Integer> listIdDel = new ArrayList<Integer>();
        listIdDel.add(id);

        categoryProductDao.delete(listIdDel);

        return Constant.SUCCESS;
    }

    @PostMapping("/admin/cate/blog/addEdit")
    public String addEditCateBlog(@ModelAttribute CategoryBlogEntity cateBlog){
        if (cateBlog.getId() == null){
            if (checkCateBlogExist(cateBlog.getName())){
                return "cate_exist";
            }

            categoryBlogDao.insert(cateBlog);
        } else {
            categoryBlogDao.update(cateBlog);
        }

        return Constant.SUCCESS;
    }

    @PostMapping("/admin/cate/blog/delete")
    public String deleteCateBlog(@RequestParam Integer id){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("categoryId", id);

        List<BlogEntity> listBlog = blogDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                                                null,null,null,null);

        if (listBlog.size() > 0){
            return "cannot_delete";
        }

        List<Integer> listIdDel = new ArrayList<Integer>();
        listIdDel.add(id);

        categoryBlogDao.delete(listIdDel);

        return Constant.SUCCESS;
    }

    @PostMapping("/admin/product/delete")
    public String deleteProduct(@RequestParam Integer id){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("productId", id);

        List<CommentEntity> listComment = commentDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null,null,null,null);

        if (listComment.size() > 0){
            return "cannot_delete";
        }

        mapSearch = new HashMap<String, Object>();
        mapSearch.put("productId", id);

        List<OrderDetailEntity> listOrderDetail = orderDetailDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null,null,null,null);

        if (listOrderDetail.size() > 0){
            return "cannot_delete";
        }

        List<Integer> listIdDel = new ArrayList<Integer>();
        listIdDel.add(id);

        productDao.delete(listIdDel);

        return Constant.SUCCESS;
    }

    @PostMapping("/admin/blog/delete")
    public String deleteBlog(@RequestParam Integer id){
        List<Integer> listIdDel = new ArrayList<Integer>();
        listIdDel.add(id);

        blogDao.delete(listIdDel);

        return Constant.SUCCESS;
    }

    //<editor-fold desc="CHECK PHONE EXIST">
    private boolean checkPhoneExist(String phone){
        Map<String, Object> mapSearchPhone = new HashMap<String, Object>();
        mapSearchPhone.put("phone", phone);

        List<UsersEntity> listUser = userDao.findByProperties(mapSearchPhone, Constant.COMPARE_EQUAL,
                                                null,null,null,null);

        if (listUser.size() > 0){
            return true;
        }

        return false;
    }
    //</editor-fold>

    //<editor-fold desc="CHECK EMAIL EXIST">
    private boolean checkEmailExist(String email){
        Map<String, Object> mapSearchEmail = new HashMap<String, Object>();
        mapSearchEmail.put("email", email);

        List<UsersEntity> listUser = userDao.findByProperties(mapSearchEmail, Constant.COMPARE_EQUAL,
                null,null,null,null);

        if (listUser.size() > 0){
            return true;
        }

        return false;
    }
    //</editor-fold>

    //<editor-fold desc="CHECK CATE PRODUCT EXIST">
    private boolean checkCateProductExist(String name){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("name", name);

        List<CategoryProductEntity> list = categoryProductDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                            null, null, null, null);

        if (list.size() > 0){
            return true;
        }

        return false;
    }
    //</editor-fold>

    //<editor-fold desc="CHECK CATE BLOG EXIST">
    private boolean checkCateBlogExist(String name){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("name", name);

        List<CategoryBlogEntity> list = categoryBlogDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null, null, null, null);

        if (list.size() > 0){
            return true;
        }

        return false;
    }
    //</editor-fold>
}
