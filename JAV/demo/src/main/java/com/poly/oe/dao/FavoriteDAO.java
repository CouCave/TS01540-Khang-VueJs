package com.poly.oe.dao;

import com.poly.oe.entity.Favorite;
import com.poly.oe.utils.JpaUtils;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class FavoriteDAO extends AbstractDAO<Favorite> {
    public FavoriteDAO() {
        super(Favorite.class);
    }

    public Favorite findByUserAndVideo(String userId, String videoId) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :uid AND f.video.id = :vid";
            TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
            query.setParameter("uid", userId);
            query.setParameter("vid", videoId);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }

    public List<Favorite> findByUser(String userId) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :uid";
            TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
            query.setParameter("uid", userId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}