package com.poly.oe.dao;

import com.poly.oe.entity.Video;
import com.poly.oe.utils.JpaUtils;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class VideoDAO extends AbstractDAO<Video> {
    public VideoDAO() {
        super(Video.class);
    }

    public List<Video> findTop6() {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT v FROM Video v WHERE v.active = true ORDER BY v.views DESC";
            TypedQuery<Video> query = em.createQuery(jpql, Video.class);
            query.setMaxResults(6);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Video> findAllActive() {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT v FROM Video v WHERE v.active = true";
            TypedQuery<Video> query = em.createQuery(jpql, Video.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Video> findPage(int page, int size) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT v FROM Video v WHERE v.active = true";
            TypedQuery<Video> query = em.createQuery(jpql, Video.class);
            query.setFirstResult((page - 1) * size);
            query.setMaxResults(size);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public long count() {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT count(v) FROM Video v WHERE v.active = true";
            TypedQuery<Long> query = em.createQuery(jpql, Long.class);
            return query.getSingleResult();
        } finally {
            em.close();
        }
    }

    public List<Video> searchByTitle(String keyword) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT v FROM Video v WHERE v.active = true AND v.title LIKE :keyword";
            TypedQuery<Video> query = em.createQuery(jpql, Video.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}