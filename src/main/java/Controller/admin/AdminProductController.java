package Controller.admin;

import Constant.Constant;
import DAO.DaoImpl.CategoryProductDaoImpl;
import DAO.DaoImpl.ProductDaoImpl;
import Entity.CategoryProductEntity;
import Entity.ProductEntity;
import Utils.UploadFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
    @Autowired
    ProductDaoImpl productDao;

    @Autowired
    CategoryProductDaoImpl categoryProductDao;

    @GetMapping
    public String Default(ModelMap modelMap){
        List<ProductEntity> listProduct = productDao.findAll();
        modelMap.addAttribute(Constant.LIST_PRODUCT, listProduct);

        return "admin/product";
    }

    @GetMapping("/{id}")
    public String showProductDetail(@PathVariable Integer id, ModelMap modelMap){
        List<CategoryProductEntity> listCateProduct = categoryProductDao.findAll();
        modelMap.addAttribute(Constant.LIST_CATE_PRODUCT, listCateProduct);

        ProductEntity product = productDao.findById(id);

        if (id != -1){
            product = productDao.findById(id);
        }
        modelMap.addAttribute(Constant.PRODUCT, product);

        return "admin/productDetail";
    }

    @PostMapping("/addEdit")
    public String addEdit(MultipartHttpServletRequest request, @ModelAttribute ProductEntity product,
                          @RequestParam Integer idCate){
        List<String> listImageName = null;
        try {
            listImageName = UploadFileUtil.upload(request, "/resources/fileupload/img/");
        } catch (IOException e) {
            e.printStackTrace();
        }

        CategoryProductEntity cateProduct = new CategoryProductEntity(); cateProduct.setId(idCate);

        product.setCategoryProductByCategoryId(cateProduct);

        if (product.getId() == null){
            product.setQuantityView(0);
            product.setCreatedDate(new Date(System.currentTimeMillis()));
            product.setImage(listImageName.get(0));
            productDao.insert(product);
        } else {
            if (listImageName != null){
                product.setImage(listImageName.get(0));
            }
            productDao.update(product);
        }

        return "redirect:/admin/product";
    }
}
