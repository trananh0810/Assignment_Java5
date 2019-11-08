package Controller.web;

import Constant.Constant;
import DAO.DaoImpl.BlogDaoImpl;
import Entity.BlogEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/blog")
public class BlogController {
    @Autowired
    BlogDaoImpl blogDao;

    @GetMapping
    public String Default(ModelMap modelMap){
        List<BlogEntity> listBlog = blogDao.findAll();
        modelMap.addAttribute(Constant.LIST_BLOG, listBlog);

        List<BlogEntity> listTop3BlogXemNhieu = blogDao.findByProperties(null,null,
                "quantityView", Constant.SORT_DESC, 0, 3);
        modelMap.addAttribute(Constant.TOP3_BLOG_XEM_NHIEU, listTop3BlogXemNhieu);

        return "web/blog";
    }

    @GetMapping("/{id}")
    public String showBlogDetail(@PathVariable Integer id, ModelMap modelMap){
        BlogEntity blog = blogDao.findById(id);
        modelMap.addAttribute(Constant.BLOG, blog);

        blog.setQuantityView(blog.getQuantityView()+1);
        blogDao.update(blog);

        return "web/blogDetail";
    }
}
