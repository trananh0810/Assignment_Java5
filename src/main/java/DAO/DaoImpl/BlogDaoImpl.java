package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.BlogDAO;
import Entity.BlogEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class BlogDaoImpl extends AbstractDAO<Integer, BlogEntity> implements BlogDAO {
}
