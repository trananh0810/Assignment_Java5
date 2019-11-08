package Controller.admin;

import DAO.DaoImpl.RoleDaoImpl;
import DAO.DaoImpl.UserDaoImpl;
import Entity.RoleEntity;
import Entity.UsersEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
    @Autowired
    UserDaoImpl userDao;

    @Autowired
    RoleDaoImpl roleDao;

    @GetMapping
    public String Default(ModelMap modelMap){
        List<UsersEntity> listUser = userDao.findAll();
        modelMap.addAttribute("listUser", listUser);

        return "admin/user";
    }

    @GetMapping("/detail/{id}")
    public String showFormUser(@PathVariable(value = "id", required = false) Integer id, ModelMap modelMap){
        List<RoleEntity> listRole = roleDao.findAll();
        modelMap.addAttribute("listRole", listRole);


        UsersEntity user = null;

        if (id != -1){
            user = userDao.findById(id);
        }
        modelMap.addAttribute("user", user);

        return "admin/userDetail";
    }
}
