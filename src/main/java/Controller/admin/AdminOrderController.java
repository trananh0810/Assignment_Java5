package Controller.admin;

import Constant.Constant;
import DAO.DaoImpl.OrderDaoImpl;
import Entity.OrderStatusEntity;
import Entity.OrdersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {
    @Autowired
    OrderDaoImpl orderDao;

    @GetMapping("/cancelled")
    public String showOrderCancelled(ModelMap modelMap){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("statusId", 4);

        List<OrdersEntity> listOrder = orderDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null,null,null,null);

        modelMap.addAttribute("listOrder", listOrder);

        return "admin/order-cancelled";
    }

    @GetMapping("/confirmed")
    public String showOrderConfirmed(ModelMap modelMap){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("statusId", 2);

        List<OrdersEntity> listOrder = orderDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null,null,null,null);

        modelMap.addAttribute("listOrder", listOrder);

        return "admin/order-confirmed";
    }

    @GetMapping("/success")
    public String showOrderSuccess(ModelMap modelMap){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("statusId", 3);

        List<OrdersEntity> listOrder = orderDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                null,null,null,null);

        modelMap.addAttribute("listOrder", listOrder);

        return "admin/order-success";
    }

    @GetMapping("/wait-confirm")
    public String showOrderWaitConfirm(ModelMap modelMap){
        Map<String, Object> mapSearch = new HashMap<String, Object>();
        mapSearch.put("statusId", 1);

        List<OrdersEntity> listOrder = orderDao.findByProperties(mapSearch, Constant.COMPARE_EQUAL,
                            null,null,null,null);

        modelMap.addAttribute("listOrder", listOrder);

        return "admin/order-wait-confirm";
    }

    @GetMapping("/cancelOrder/{id}")
    public String cancelOrder(@PathVariable Integer id){
        OrdersEntity order = orderDao.findById(id);

        OrderStatusEntity orderStatusEntity = new OrderStatusEntity(); orderStatusEntity.setId(4);
        order.setOrderStatus(orderStatusEntity);

        orderDao.update(order);

        return "redirect:/wait-confirm";
    }

    @GetMapping("/confirmOrder/{id}")
    public String confirmOrder(@PathVariable Integer id){
        OrdersEntity order = orderDao.findById(id);

        OrderStatusEntity orderStatusEntity = new OrderStatusEntity(); orderStatusEntity.setId(2);
        order.setOrderStatus(orderStatusEntity);

        orderDao.update(order);

        return "redirect:/admin/order/wait-confirm";
    }
}
