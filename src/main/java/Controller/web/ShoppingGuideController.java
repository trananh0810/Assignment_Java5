package Controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shopping-guide")
public class ShoppingGuideController {
    @GetMapping
    public String Default(){
        return "web/shoppingGuide";
    }
}
