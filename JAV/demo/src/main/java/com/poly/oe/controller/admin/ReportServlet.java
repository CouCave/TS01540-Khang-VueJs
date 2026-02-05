package com.poly.oe.controller.admin;

import com.poly.oe.dao.ReportDAO;
import com.poly.oe.dao.VideoDAO;
import com.poly.oe.entity.Video;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/reports")
public class ReportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tab = req.getParameter("tab");
        if (tab == null) tab = "favorites";
        
        ReportDAO rDao = new ReportDAO();
        VideoDAO vDao = new VideoDAO();

        if (tab.equals("favorites")) {
            List<Object[]> list = rDao.reportFavorites();
            req.setAttribute("favList", list);
        } else if (tab.equals("favorite-users")) {
            List<Video> vList = vDao.findAll();
            req.setAttribute("vidList", vList);
            
            String videoId = req.getParameter("videoId");
            if (videoId != null && !videoId.isEmpty()) {
                List<Object[]> users = rDao.reportFavoriteUsersByVideo(videoId);
                req.setAttribute("favUsers", users);
                req.setAttribute("selectedVid", videoId);
            }
        } else if (tab.equals("shared-friends")) {
            List<Video> vList = vDao.findAll();
            req.setAttribute("vidList", vList);
            
            String videoId = req.getParameter("videoId");
            if (videoId != null && !videoId.isEmpty()) {
                List<Object[]> shares = rDao.reportSharesByVideo(videoId);
                req.setAttribute("shareList", shares);
                req.setAttribute("selectedVid", videoId);
            }
        }
        
        req.setAttribute("tab", tab);
        req.getRequestDispatcher("/views/admin/reports.jsp").forward(req, resp);
    }
}