package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.OrderStatusDAO;
import Entity.OrderStatusEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class OrderStatusDaoImpl extends AbstractDAO<Integer, OrderStatusEntity> implements OrderStatusDAO {
}
