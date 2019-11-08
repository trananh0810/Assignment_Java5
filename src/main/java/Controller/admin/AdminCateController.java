package Controller.admin;

import DAO.DaoImpl.CategoryBlogDaoImpl;
import DAO.DaoImpl.CategoryProductDaoImpl;
import Entity.CategoryBlogEntity;
import Entity.CategoryProductEntity;
import Entity.ProductEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/cate")
public class AdminCateController {
    @Autowired
    CategoryProductDaoImpl categoryProductDao;

    @Autowired
    CategoryBlogDaoImpl categoryBlogDao;

    @GetMapping("/blog")
    public String showCateBlog(ModelMap modelMap){
        List<CategoryBlogEntity> listCateBlog = categoryBlogDao.findAll();
        modelMap.addAttribute("listCateBlog", listCateBlog);

        return "admin/cateBlog";
    }

    @GetMapping("/blog/detail/{id}")
    public String getModalCateBlog(@PathVariable Integer id, ModelMap modelMap){
        CategoryBlogEntity cateBlog = null;

        if (id != -1){
            cateBlog = categoryBlogDao.findById(id);
        }

        modelMap.addAttribute("cateBlog", cateBlog);

        return "admin/cateBlogDetail";
    }

    @GetMapping("/product")
    public String showCateProduct(ModelMap modelMap){
        List<CategoryBlogEntity> listCateProduct = categoryProductDao.findAll();
        modelMap.addAttribute("listCateProduct", listCateProduct);

        return "admin/cateProduct";
    }


    @GetMapping("/product/detail/{id}")
    public String getModalCateProduct(@PathVariable Integer id, ModelMap modelMap){
        CategoryProductEntity cateProduct = null;

        if (id != -1){
            cateProduct = categoryProductDao.findById(id);
        }

        modelMap.addAttribute("cateProduct", cateProduct);

        return "admin/cateProductDetail";
    }
}
