package DAO;

import Constant.Constant;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AbstractDAO<ID extends Serializable, T> implements GenericDAO<ID, T> {
    @Autowired
    SessionFactory sessionFactory;

    private Class<T> persistenceClass;

    public AbstractDAO() {
        this.persistenceClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }

    private String getPersistenceClassName() {
        return this.persistenceClass.getSimpleName();
    }

    @Transactional
    public List findAll() {
        List<T> list = new ArrayList<T>();
        Session session = sessionFactory.getCurrentSession();

        try {
            String sql = "from " + this.getPersistenceClassName();

            list = session.createQuery(sql).list();
        } catch (HibernateException e) {
            throw e;
        }
        return list;
    }

    @Transactional
    public T update(T entity) {
        T result = null;
        Session session = sessionFactory.getCurrentSession();

        try {
            result = (T) session.merge(entity);
        } catch (HibernateException e) {
            throw e;
        }
        return result;
    }

    @Transactional
    public ID insert(T entity) {
        Session session = sessionFactory.getCurrentSession();

        ID id = null;

        try {
            id = (ID) session.save(entity);
        } catch (HibernateException e) {
            throw e;
        }

        return id;
    }

    @Transactional
    public T findById(ID id) {
        T entity = null;
        Session session = sessionFactory.getCurrentSession();

        try {
            entity = session.get(persistenceClass, id);
        } catch (HibernateException e) {
            throw e;
        }
        return entity;
    }

    @Transactional
    public List<T> findByProperties(Map<String, Object> properties, String compare, String sortExpression, String sortDirection, Integer offSet, Integer limit) {
        List<T> list = new ArrayList<T>();
        Session session = sessionFactory.getCurrentSession();

        String[] params = null;
        Object[] values = null;
        if (properties != null && properties.size() > 0) {
            params = new String[properties.size()];
            values = new Object[properties.size()];
            int index = 0;
            for (Map.Entry<String, Object> item : properties.entrySet()) {
                params[index] = item.getKey();
                values[index] = item.getValue();
                index++;
            }
        }

        try {
            StringBuilder sql = new StringBuilder("from ");
            sql.append(getPersistenceClassName()).append(" where 1=1 ");

            if (properties != null && properties.size() > 0) {
                for (int i = 0; i < params.length; i++) {
                    if (compare != null && compare.equals(Constant.COMPARE_EQUAL)) {
                        sql.append(" and ").append(params[i]).append("= :" + params[i]);
                    } else if (compare != null && compare.equals(Constant.COMPARE_LIKE)) {
                        if (i == 0) {
                            sql.append(" and ").append(params[i]).append(" LIKE '%' || :" + params[i] + " || '%'");
                        } else {
                            sql.append(" or ").append(params[i]).append(" LIKE '%' || :" + params[i] + " || '%'");
                        }
                    }
                }
            }
            if (sortExpression != null && sortDirection != null) {
                sql.append(" order by ").append(sortExpression).append((sortDirection.equals(Constant.SORT_DESC) ? " desc" : " asc"));
            }

            Query query = session.createQuery(sql.toString());

            if (properties != null && properties.size() > 0) {
                for (int i = 0; i < params.length; i++) {
                    query.setParameter(params[i], values[i]);
                }
            }
            if (offSet != null && offSet >= 0) {
                query.setFirstResult(offSet);
            }
            if (limit != null && limit > 0) {
                query.setMaxResults(limit);
            }

            list = query.list();
        } catch (HibernateException e) {
            throw e;
        }
        return list;
    }

    @Transactional
    public int delete(List<ID> listId) {
        int countDelete = 0;
        Session session = sessionFactory.getCurrentSession();

        try {
            for (ID item : listId) {
                T t = session.get(persistenceClass, item);
                session.delete(t);
                countDelete++;
            }
        } catch (HibernateException e) {
            throw e;
        }
        return countDelete;
    }
}
