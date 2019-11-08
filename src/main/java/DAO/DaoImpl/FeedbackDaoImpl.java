package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.FeedbackDAO;
import Entity.FeedbackEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class FeedbackDaoImpl extends AbstractDAO<Integer, FeedbackEntity> implements FeedbackDAO {
}
