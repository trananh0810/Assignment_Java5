package Controller.web;

import Constant.Constant;
import DAO.DaoImpl.ProductDaoImpl;
import Entity.ProductEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Autowired
    ProductDaoImpl productDao;

    @GetMapping
    public String Default(@RequestParam String infoSearch, ModelMap modelMap){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("name", infoSearch);
        List<ProductEntity> listProductSearch = productDao.findByProperties(mapSearch, Constant.COMPARE_LIKE,
                                    null,null,null,null);
        modelMap.addAttribute(Constant.LIST_PRODUCT_SEARCH, listProductSearch);

        modelMap.addAttribute("infoSearch", infoSearch);

        return "web/search";
    }
}
