package com.poly.oe.controller;

import com.poly.oe.dao.ShareDAO;
import com.poly.oe.entity.Share;
import com.poly.oe.entity.User;
import com.poly.oe.entity.Video;
import com.poly.oe.utils.EmailUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/share")
public class ShareServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        String videoId = req.getParameter("videoId");
        String emailTo = req.getParameter("email");
        
        if (user != null && videoId != null && emailTo != null) {
            try {
                // Save to DB
                ShareDAO dao = new ShareDAO();
                Share share = new Share();
                User u = new User(); u.setId(user.getId());
                Video v = new Video(); v.setId(videoId);
                share.setUser(u);
                share.setVideo(v);
                share.setEmails(emailTo);
                share.setShareDate(new Date());
                dao.create(share);

                // Send Email (Mocked or Real)
                String link = req.getRequestURL().toString().replace("share", "video/detail?id=" + videoId);
                String body = "Hi, check out this video: " + link;
                // EmailUtils.send(emailTo, "Video Shared by " + user.getFullname(), body);
                
                req.setAttribute("message", "Video shared successfully to " + emailTo);
            } catch (Exception e) {
                req.setAttribute("message", "Error sharing video: " + e.getMessage());
            }
        }
        
        req.getRequestDispatcher("/video/detail?id=" + videoId).forward(req, resp);
    }
}