package com.poly.oe.dao;

import com.poly.oe.entity.Video;
import com.poly.oe.utils.JpaUtils;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class ReportDAO {
    
    // Report 1: Favorites per Video
    // Returns List<Object[]>: [VideoTitle, FavoriteCount, LatestDate, OldestDate]
    public List<Object[]> reportFavorites() {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT f.video.title, COUNT(f), MAX(f.likeDate), MIN(f.likeDate) " +
                          "FROM Favorite f GROUP BY f.video.title";
            TypedQuery<Object[]> query = em.createQuery(jpql, Object[].class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    // Report 2: Users who liked a specific video
    // Returns List<Object[]>: [Username, Fullname, Email, LikeDate]
    public List<Object[]> reportFavoriteUsersByVideo(String videoId) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT f.user.id, f.user.fullname, f.user.email, f.likeDate " +
                          "FROM Favorite f WHERE f.video.id = :vid";
            TypedQuery<Object[]> query = em.createQuery(jpql, Object[].class);
            query.setParameter("vid", videoId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    // Report 3: Shared Friends for a specific video
    // Returns List<Object[]>: [SenderName, SenderEmail, ReceiverEmail, ShareDate]
    public List<Object[]> reportSharesByVideo(String videoId) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT s.user.fullname, s.user.email, s.emails, s.shareDate " +
                          "FROM Share s WHERE s.video.id = :vid";
            TypedQuery<Object[]> query = em.createQuery(jpql, Object[].class);
            query.setParameter("vid", videoId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}