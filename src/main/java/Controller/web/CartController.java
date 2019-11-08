package Controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cart")
public class CartController {
    @GetMapping
    public String Default(){
        return "web/cart";
    }

}
