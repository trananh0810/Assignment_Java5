package Controller.web;

import Constant.Constant;
import DAO.DaoImpl.CommentDaoImpl;
import Entity.CommentEntity;
import Entity.ProductEntity;
import Entity.UsersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Date;

@RestController
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentDaoImpl commentDao;

    @PostMapping
    public String sendComment(@ModelAttribute CommentEntity comment, HttpSession session,
                              @RequestParam Integer idProduct){
        Date createdDate = new Date(System.currentTimeMillis());
        UsersEntity userLogin = (UsersEntity) session.getAttribute(Constant.USER_LOGIN);
        ProductEntity productEntity = new ProductEntity();productEntity.setId(idProduct);

        comment.setProduct(productEntity);
        comment.setUser(userLogin);
        comment.setCreatedDate(createdDate);

        Integer idReturn = commentDao.insert(comment);

        return "";
    }
}
