package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.OrderDetailDAO;
import Entity.OrderDetailEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class OrderDetailDaoImpl extends AbstractDAO<Integer, OrderDetailEntity> implements OrderDetailDAO {
}
