package Controller.web;

import Constant.Constant;
import Entity.CartItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/pay")
public class PayController {
    @GetMapping
    public String Default(HttpSession session, ModelMap modelMap){
        List<CartItem> listCart = (List<CartItem>) session.getAttribute(Constant.CARTS);

        Integer sumPrice = 0;

        for (CartItem item : listCart){
            Integer sumPriceOneProduct = item.getQuantity()*item.getProduct().getPrice();

            sumPrice += sumPriceOneProduct;
        }

        modelMap.addAttribute("sumPrice", sumPrice);

        return "web/pay";
    }
}
