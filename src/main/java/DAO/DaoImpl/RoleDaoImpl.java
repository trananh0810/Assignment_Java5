package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.RoleDAO;
import Entity.RoleEntity;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RoleDaoImpl extends AbstractDAO<Integer, RoleEntity> implements RoleDAO{
}
