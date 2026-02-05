package com.poly.oe.controller.admin;

import com.poly.oe.dao.VideoDAO;
import com.poly.oe.entity.Video;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/videos", "/admin/video/edit", "/admin/video/update", "/admin/video/delete", "/admin/video/create"})
public class VideoManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        VideoDAO dao = new VideoDAO();

        if (uri.contains("edit")) {
            String id = req.getParameter("id");
            // Only try to find the video if an ID is provided (Edit mode)
            // If ID is null, it's Create mode, so we just forward to the JSP
            if (id != null && !id.isEmpty()) {
                Video video = dao.findById(id);
                req.setAttribute("video", video);
            }
            req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);
        } else if (uri.contains("delete")) {
            String id = req.getParameter("id");
            try {
                dao.delete(id);
                req.setAttribute("message", "Video deleted successfully!");
            } catch (Exception e) {
                req.setAttribute("message", "Error deleting video (Might be used in foreign keys).");
            }
            resp.sendRedirect(req.getContextPath() + "/admin/videos");
        } else {
            // List / Index
            List<Video> list = dao.findAll();
            req.setAttribute("videos", list);
            req.getRequestDispatcher("/views/admin/video-list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); // Fix font error
        String uri = req.getRequestURI();
        VideoDAO dao = new VideoDAO();
        Video video = new Video();
        
        try {
            BeanUtils.populate(video, req.getParameterMap());
            
            // Checkbox handling for Boolean (BeanUtils sometimes misses this if unchecked)
            String active = req.getParameter("active");
            video.setActive(active != null);

            if (uri.contains("update")) {
                // Preserve existing views count
                Video existingVideo = dao.findById(video.getId());
                if (existingVideo != null) {
                    video.setViews(existingVideo.getViews());
                }
                dao.update(video);
                req.setAttribute("message", "Video updated successfully!");
            } else if (uri.contains("create")) {
                if(dao.findById(video.getId()) != null){
                     req.setAttribute("message", "Video ID already exists!");
                     req.setAttribute("video", video);
                     req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);
                     return;
                }
                video.setViews(0); // Initialize views for new video
                dao.create(video);
                req.setAttribute("message", "Video created successfully!");
            }
        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/videos");
    }
}