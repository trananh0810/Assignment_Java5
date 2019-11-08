package Controller.web;

import Constant.Constant;
import DAO.DaoImpl.CategoryProductDaoImpl;
import DAO.DaoImpl.ProductDaoImpl;
import Entity.CategoryProductEntity;
import Entity.CommentEntity;
import Entity.ProductEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    ProductDaoImpl productDao;
    @Autowired
    CategoryProductDaoImpl categoryProductDao;

    @GetMapping({"/cate/{idCateProduct}",""})
    public String showProductByCate(@PathVariable(value = "idCateProduct", required = false) Integer idCateProduct, ModelMap modelMap){
        List<CategoryProductEntity> listeCateProduct = categoryProductDao.findAll();
        modelMap.addAttribute(Constant.LIST_CATE_PRODUCT, listeCateProduct);

        modelMap.addAttribute("idCateProduct", idCateProduct);

        String cateName = null;
        try {
            cateName = categoryProductDao.findById(idCateProduct).getName().toUpperCase();
        } catch (Exception e){}
        modelMap.addAttribute(Constant.CATE_NAME, cateName);

        List<ProductEntity> listProduct = new ArrayList<ProductEntity>();

        if (idCateProduct == null){
            idCateProduct = 0;
        }

        if (idCateProduct == 0){
            listProduct = productDao.findAll();
        } else {
            Map<String, Object> mapSearch = new HashMap<String, Object>();
            mapSearch.put("categoryId", idCateProduct);

            listProduct = productDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                                        null,null,null,null);
        }

        modelMap.addAttribute(Constant.LIST_PRODUCT, listProduct);

        return "web/product";
    }

    @GetMapping("/{idProduct}")
    public String showProductDetail(@PathVariable Integer idProduct, ModelMap modelMap){
        ProductEntity product = productDao.findById(idProduct);
        modelMap.addAttribute(Constant.PRODUCT, product);

        product.setQuantityView(product.getQuantityView()+1);
        productDao.update(product);

        double sumRating = 0;
        double avgRating = 0;
        for (CommentEntity item : product.getListComment()){
            sumRating+=item.getRatingValue();
        }

        if (sumRating != 0){
            avgRating = sumRating/product.getListComment().size();
        }
        NumberFormat numberFormat = NumberFormat.getNumberInstance();
        numberFormat.setMaximumFractionDigits(1);
        modelMap.addAttribute(Constant.AVG_RATING_PRODUCT,numberFormat.format(avgRating));

        return "web/productDetail";
    }
}
