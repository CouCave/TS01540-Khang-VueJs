package com.poly.oe.controller;

import com.poly.oe.dao.VideoDAO;
import com.poly.oe.entity.Video;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/home", "/index"})
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        VideoDAO dao = new VideoDAO();
        String keyword = req.getParameter("keyword");
        
        if (keyword != null && !keyword.trim().isEmpty()) {
            // Search mode
            List<Video> list = dao.searchByTitle(keyword);
            req.setAttribute("videos", list);
            req.setAttribute("keyword", keyword); // Keep keyword in search box
            // No pagination for search results for simplicity, or implement search pagination
        } else {
            // Normal pagination mode
            int page = 1;
            int size = 6;
            
            if (req.getParameter("page") != null) {
                try {
                    page = Integer.parseInt(req.getParameter("page"));
                } catch (NumberFormatException e) {
                    page = 1;
                }
            }
            
            List<Video> list = dao.findPage(page, size);
            long count = dao.count();
            int totalPage = (int) Math.ceil((double) count / size);
            
            req.setAttribute("videos", list);
            req.setAttribute("currentPage", page);
            req.setAttribute("totalPage", totalPage);
        }
        
        req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
    }
}