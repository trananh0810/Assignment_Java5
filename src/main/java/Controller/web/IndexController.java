package Controller.web;

import Constant.Constant;
import DAO.DaoImpl.BlogDaoImpl;
import DAO.DaoImpl.ProductDaoImpl;
import DAO.DaoImpl.RoleDaoImpl;
import Entity.BlogEntity;
import Entity.ProductEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    ProductDaoImpl productDao;

    @Autowired
    BlogDaoImpl blogDao;

    @GetMapping
    public String Default(ModelMap modelMap){
        List<ProductEntity> listTop3NB = productDao.findByProperties(null,null,
                            "quantityView", Constant.SORT_DESC,0,3);
        modelMap.addAttribute(Constant.TOP3_PRODUCT_NOI_BAT, listTop3NB);

        List<ProductEntity> listTop4BcNhat = productDao.getTop4BanChayNhat();
        modelMap.addAttribute(Constant.TOP4_PRODUCT_BC_NHAT, listTop4BcNhat);

        List<BlogEntity> listTop3BlogXemNhieu = blogDao.findByProperties(null,null,
                            "quantityView", Constant.SORT_DESC, 0, 3);
        modelMap.addAttribute(Constant.TOP3_BLOG_XEM_NHIEU, listTop3BlogXemNhieu);

        List<ProductEntity> listTop4MonAnMoi = productDao.findByProperties(null,null,
                "createdDate", Constant.SORT_DESC, 0, 4);
        modelMap.addAttribute(Constant.TOP4_MON_AN_MOI, listTop4MonAnMoi);

        return "web/index";
    }
}
