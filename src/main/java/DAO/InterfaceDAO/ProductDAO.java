package DAO.InterfaceDAO;

import DAO.GenericDAO;
import Entity.ProductEntity;

import java.util.List;

public interface ProductDAO extends GenericDAO<Integer, ProductEntity>{
    List<ProductEntity> getTop4BanChayNhat();
}
