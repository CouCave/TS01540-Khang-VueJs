package com.poly.oe.controller;

import com.poly.oe.dao.FavoriteDAO;
import com.poly.oe.dao.VideoDAO;
import com.poly.oe.entity.User;
import com.poly.oe.entity.Video;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/video/detail")
public class VideoDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        VideoDAO dao = new VideoDAO();
        Video video = dao.findById(id);

        if (video != null) {
            // Increment views
            video.setViews(video.getViews() + 1);
            dao.update(video);
            
            req.setAttribute("video", video);
            
            // Get list of all videos
            List<Video> videos = dao.findAll();
            req.setAttribute("videos", videos);
            
            // Find previous and next video IDs
            String prevId = null;
            String nextId = null;
            for (int i = 0; i < videos.size(); i++) {
                if (videos.get(i).getId().equals(id)) {
                    if (i > 0) {
                        prevId = videos.get(i - 1).getId();
                    }
                    if (i < videos.size() - 1) {
                        nextId = videos.get(i + 1).getId();
                    }
                    break;
                }
            }
            req.setAttribute("prevId", prevId);
            req.setAttribute("nextId", nextId);

            // Check if user liked this video
            User user = (User) req.getSession().getAttribute("user");
            if (user != null) {
                FavoriteDAO favDao = new FavoriteDAO();
                boolean liked = favDao.findByUserAndVideo(user.getId(), video.getId()) != null;
                req.setAttribute("liked", liked);
            }

            req.getRequestDispatcher("/views/detail.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }
}