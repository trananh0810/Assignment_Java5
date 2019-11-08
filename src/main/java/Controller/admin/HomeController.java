package Controller.admin;

import DAO.DaoImpl.OrderDaoImpl;
import DAO.DaoImpl.ProductDaoImpl;
import DAO.DaoImpl.UserDaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class HomeController {
    @Autowired
    OrderDaoImpl orderDao;

    @Autowired
    UserDaoImpl userDao;

    @Autowired
    ProductDaoImpl productDao;

    @GetMapping
    public String Default(ModelMap modelMap){
        int quantityOrderOnDay = orderDao.getQuantityOrderOnDay();
        modelMap.addAttribute("quantityOrderOnDay", quantityOrderOnDay);

        int quantityNewCustomerOnDay = userDao.getQuantityNewCustomerOnDay();
        modelMap.addAttribute("quantityNewCustomerOnDay",quantityNewCustomerOnDay);

        int quantityEmployee = userDao.getQuantityEmployee();
        modelMap.addAttribute("quantityEmployee",quantityEmployee);

        int quantityProduct = productDao.findAll().size();
        modelMap.addAttribute("quantityProduct",quantityProduct);

        return "admin/home";
    }
}
