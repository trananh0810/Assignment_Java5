package DAO.InterfaceDAO;

import DAO.GenericDAO;
import Entity.UsersEntity;

public interface UserDAO extends GenericDAO<Integer, UsersEntity> {
    int getQuantityNewCustomerOnDay();

    int getQuantityEmployee();
}
