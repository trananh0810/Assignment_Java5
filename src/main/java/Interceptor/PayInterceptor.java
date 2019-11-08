package Interceptor;

import Constant.Constant;
import Entity.CartItem;
import Entity.UsersEntity;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class PayInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UsersEntity userLogin = (UsersEntity) request.getSession().getAttribute(Constant.USER_LOGIN);
        List<CartItem> listCart = (List<CartItem>) request.getSession().getAttribute(Constant.CARTS);

        if (userLogin == null || listCart == null){
            response.sendRedirect(request.getContextPath() + "/");
            return false;
        }
        return super.preHandle(request, response, handler);
    }
}
