package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.OrderDAO;
import Entity.OrdersEntity;
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
public class OrderDaoImpl extends AbstractDAO<Integer, OrdersEntity> implements OrderDAO{
    @Autowired
    SessionFactory sessionFactory;

    @Transactional
    public int getQuantityOrderOnDay() {
        Session session = sessionFactory.getCurrentSession();

        String sql = "SELECT * FROM dbo.Orders WHERE createdDate = GETDATE()";

        List<OrdersEntity> listOrder = session.createSQLQuery(sql).list();

        return listOrder.size();
    }
}
