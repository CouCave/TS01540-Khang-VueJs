package com.poly.oe.controller;

import com.poly.oe.dao.FavoriteDAO;
import com.poly.oe.entity.Favorite;
import com.poly.oe.entity.User;
import com.poly.oe.entity.Video;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/like")
public class LikeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String videoId = req.getParameter("id");
        FavoriteDAO dao = new FavoriteDAO();

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login?message=Please login to use this feature!");
            return;
        }

        if (videoId == null) {
            // View Favorite List
            List<Favorite> favorites = dao.findByUser(user.getId());
            List<Video> videos = new ArrayList<>();
            for (Favorite fav : favorites) {
                videos.add(fav.getVideo());
            }
            
            // Pagination for favorites (simple in-memory pagination for now)
            int page = 1;
            int size = 6;
            if (req.getParameter("page") != null) {
                try {
                    page = Integer.parseInt(req.getParameter("page"));
                } catch (NumberFormatException e) {
                    page = 1;
                }
            }
            
            int totalItems = videos.size();
            int totalPage = (int) Math.ceil((double) totalItems / size);
            
            int start = (page - 1) * size;
            int end = Math.min(start + size, totalItems);
            
            List<Video> pageVideos = new ArrayList<>();
            if (start < totalItems) {
                pageVideos = videos.subList(start, end);
            }

            req.setAttribute("videos", pageVideos);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPage", totalPage);

            req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
        } else {
            // Toggle Like/Unlike
            Favorite favorite = dao.findByUserAndVideo(user.getId(), videoId);
            
            if (favorite == null) {
                // Like
                favorite = new Favorite();
                User u = new User(); u.setId(user.getId());
                Video v = new Video(); v.setId(videoId);
                favorite.setUser(u);
                favorite.setVideo(v);
                favorite.setLikeDate(new Date());
                dao.create(favorite);
            } else {
                // Unlike
                dao.delete(favorite.getId());
            }
            
            // Redirect back to the page they came from
            String referer = req.getHeader("Referer");
            resp.sendRedirect(referer != null ? referer : req.getContextPath() + "/home");
        }
    }
}