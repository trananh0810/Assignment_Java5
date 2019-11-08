package DAO;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface GenericDAO<ID extends Serializable, T> {
    List<T> findAll();

    T update(T entity);

    ID insert(T entity);

    int delete(List<ID> listId);

    T findById(ID id);

    List<T> findByProperties(Map<String, Object> properties, String compare, String sortExpression, String sortDirection, Integer offSet, Integer limit);
}