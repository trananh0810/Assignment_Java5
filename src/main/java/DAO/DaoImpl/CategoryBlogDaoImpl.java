package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.CategoryBlogDAO;
import Entity.CategoryBlogEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CategoryBlogDaoImpl extends AbstractDAO<Integer, CategoryBlogEntity> implements CategoryBlogDAO {
}
