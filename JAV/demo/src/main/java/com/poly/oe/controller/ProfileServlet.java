package com.poly.oe.controller;

import com.poly.oe.dao.UserDAO;
import com.poly.oe.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/account/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login?message=Please login to view profile!");
            return;
        }
        req.getRequestDispatcher("/views/edit-profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User user = (User) req.getSession().getAttribute("user");
        
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login?message=Session expired!");
            return;
        }

        // Note: Username (ID) cannot be changed as it is the primary key
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String currentPass = req.getParameter("currentPassword");
        String newPass = req.getParameter("newPassword");
        String confirmPass = req.getParameter("confirmPassword");
        
        UserDAO dao = new UserDAO();
        String message = "";

        try {
            // Update basic info
            user.setFullname(fullname);
            user.setEmail(email);

            // Update password if requested
            if (newPass != null && !newPass.isEmpty()) {
                if (!user.getPassword().equals(currentPass)) {
                    message = "Current password incorrect!";
                } else if (!newPass.equals(confirmPass)) {
                    message = "New password confirmation does not match!";
                } else {
                    user.setPassword(newPass);
                    message = "Profile updated successfully!";
                }
            } else {
                message = "Profile updated successfully!";
            }

            if (message.equals("Profile updated successfully!")) {
                dao.update(user);
                req.getSession().setAttribute("user", user); // Update session
            }
            
        } catch (Exception e) {
            message = "Error updating profile: " + e.getMessage();
            e.printStackTrace();
        }

        req.setAttribute("message", message);
        req.getRequestDispatcher("/views/edit-profile.jsp").forward(req, resp);
    }
}