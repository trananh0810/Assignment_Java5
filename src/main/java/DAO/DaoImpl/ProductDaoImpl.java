package DAO.DaoImpl;

import DAO.AbstractDAO;
import DAO.InterfaceDAO.ProductDAO;
import Entity.ProductEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ProductDaoImpl extends AbstractDAO<Integer, ProductEntity> implements ProductDAO {
    @Autowired
    SessionFactory sessionFactory;

    @Transactional
    public List<ProductEntity> getTop4BanChayNhat() {
        Session session = sessionFactory.getCurrentSession();

        List<Object[]> listObj = session.createSQLQuery("{call sp_getTop4BcNhat}").list();

        List<ProductEntity> listEntity = convertObjToProductEntity(listObj);

        return listEntity;
    }

    private List<ProductEntity> convertObjToProductEntity(List<Object[]> listObj){
        List<ProductEntity> listEntity = new ArrayList<ProductEntity>();

        for (Object[] item : listObj){
            ProductEntity entity = new ProductEntity();

            entity.setId((Integer) item[0]);
            entity.setName((String) item[1]);
            entity.setImage((String) item[2]);
            entity.setPrice((Integer) item[3]);

            listEntity.add(entity);
        }

        return listEntity;
    }
}
