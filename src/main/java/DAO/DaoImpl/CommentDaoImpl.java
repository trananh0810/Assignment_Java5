package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.CommentDAO;
import Entity.CommentEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CommentDaoImpl extends AbstractDAO<Integer, CommentEntity> implements CommentDAO {
}
