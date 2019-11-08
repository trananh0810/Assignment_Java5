package Interceptor;

import Constant.Constant;
import Entity.UsersEntity;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InterceptorAdmin extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UsersEntity userLogin = (UsersEntity) request.getSession().getAttribute(Constant.USER_LOGIN);

        if (userLogin == null || userLogin.getRoleByRoleId().getId() != 1){
            response.sendRedirect(request.getContextPath() + "/");
            return false;
        }

        return true;
    }
}
