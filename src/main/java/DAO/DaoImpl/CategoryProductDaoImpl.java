package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.CategoryProductDAO;
import Entity.CategoryProductEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CategoryProductDaoImpl extends AbstractDAO<Integer, CategoryProductEntity> implements CategoryProductDAO {
}
