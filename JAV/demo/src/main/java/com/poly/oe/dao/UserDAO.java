package com.poly.oe.dao;

import com.poly.oe.entity.User;
import com.poly.oe.utils.JpaUtils;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public class UserDAO extends AbstractDAO<User> {
    public UserDAO() {
        super(User.class);
    }

    public User findByEmail(String email) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            TypedQuery<User> query = em.createQuery(jpql, User.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
}