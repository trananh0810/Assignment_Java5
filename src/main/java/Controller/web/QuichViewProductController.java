package Controller.web;

import DAO.DaoImpl.ProductDaoImpl;
import Entity.ProductEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/quickViewProduct")
public class QuichViewProductController {
    @Autowired
    ProductDaoImpl productDao;

    @GetMapping
    public String Default(@RequestParam Integer id, ModelMap modelMap){
        ProductEntity productEntity = productDao.findById(id);
        modelMap.addAttribute("product", productEntity);

        return "web/quichViewProduct";
    }
}
