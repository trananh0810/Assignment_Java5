package DAO.InterfaceDAO;

import DAO.GenericDAO;
import Entity.OrdersEntity;


public interface OrderDAO extends GenericDAO<Integer, OrdersEntity>{
    int getQuantityOrderOnDay();
}
