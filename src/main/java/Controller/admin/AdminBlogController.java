package Controller.admin;

import Constant.Constant;
import DAO.DaoImpl.BlogDaoImpl;
import DAO.DaoImpl.CategoryBlogDaoImpl;
import DAO.DaoImpl.UserDaoImpl;
import Entity.BlogEntity;
import Entity.CategoryBlogEntity;
import Entity.UsersEntity;
import Utils.UploadFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/blog")
public class AdminBlogController {
    @Autowired
    BlogDaoImpl blogDao;

    @Autowired
    CategoryBlogDaoImpl categoryBlogDao;

    @Autowired
    UserDaoImpl userDao;

    @GetMapping
    public String Default(ModelMap modelMap){
        List<BlogEntity> listBlog = blogDao.findAll();
        modelMap.addAttribute(Constant.LIST_BLOG, listBlog);

        return "admin/blog";
    }

    @GetMapping("/{id}")
    public String showAdminBlogDetail(@PathVariable Integer id, ModelMap modelMap){
        List<CategoryBlogEntity> listCateBlog = categoryBlogDao.findAll();
        modelMap.addAttribute("listCateBlog", listCateBlog);

        BlogEntity blog = null;

        if (id != -1){
            blog = blogDao.findById(id);
        }

        modelMap.addAttribute("blog", blog);

        return "admin/blogDetail";
    }

    @PostMapping("/addEdit")
    public String addEdit(MultipartHttpServletRequest request, @ModelAttribute BlogEntity blog,
                          @RequestParam Integer idCate, @RequestParam(value = "userId", required = false) Integer userId,
                          HttpSession session){
        List<String> listFileName = null;
        try {
            listFileName = UploadFileUtil.upload(request, "/resources/fileupload/img/");
        } catch (IOException e) {
            e.printStackTrace();
        }

        CategoryBlogEntity cateBlog = categoryBlogDao.findById(idCate);
        blog.setCategoryBlog(cateBlog);

        if (blog.getId() == null){
            if (listFileName != null){
                blog.setImage(listFileName.get(0));
            }
            blog.setCreatedDate(new Date(System.currentTimeMillis()));
            blog.setQuantityView(0);

            UsersEntity user = (UsersEntity) session.getAttribute(Constant.USER_LOGIN);

            blog.setUser(user);

            blogDao.insert(blog);
        } else {
            if (listFileName != null){
                blog.setImage(listFileName.get(0));
            }

            UsersEntity user = userDao.findById(userId);
            blog.setUser(user);

            blogDao.update(blog);
        }
        return "redirect:/admin/blog";
    }
}
