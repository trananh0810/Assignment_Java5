package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.UserDAO;
import Entity.UsersEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UserDaoImpl extends AbstractDAO<Integer, UsersEntity> implements UserDAO {
    @Autowired
    SessionFactory sessionFactory;

    @Transactional
    public int getQuantityNewCustomerOnDay() {
        Session session = sessionFactory.getCurrentSession();

        String sql = "SELECT * FROM dbo.Users WHERE createdDate = GETDATE() AND roleId = 2";

        List<UsersEntity> list = session.createSQLQuery(sql).list();

        return list.size();
    }

    @Transactional
    public int getQuantityEmployee() {
        Session session = sessionFactory.getCurrentSession();

        String sql = "SELECT * FROM dbo.Users WHERE roleId = 1";

        List<UsersEntity> list = session.createSQLQuery(sql).list();

        return list.size();
    }
}
