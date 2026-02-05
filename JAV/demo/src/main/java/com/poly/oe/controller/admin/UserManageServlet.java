package com.poly.oe.controller.admin;

import com.poly.oe.dao.UserDAO;
import com.poly.oe.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import java.io.IOException;
import java.util.List;

@WebServlet({"/admin/users", "/admin/user/edit", "/admin/user/update", "/admin/user/delete"})
public class UserManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        UserDAO dao = new UserDAO();

        if (uri.contains("edit")) {
            String id = req.getParameter("id");
            User user = dao.findById(id);
            req.setAttribute("user", user);
            req.getRequestDispatcher("/views/admin/user-edit.jsp").forward(req, resp);
        } else if (uri.contains("delete")) {
            String id = req.getParameter("id");
            try {
                dao.delete(id);
                req.setAttribute("message", "User deleted successfully!");
            } catch (Exception e) {
                req.setAttribute("message", "Error deleting user.");
            }
            resp.sendRedirect(req.getContextPath() + "/admin/users");
        } else {
            List<User> list = dao.findAll();
            req.setAttribute("users", list);
            req.getRequestDispatcher("/views/admin/user-list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        UserDAO dao = new UserDAO();
        try {
            String id = req.getParameter("id");
            User user = dao.findById(id);
            if (user != null) {
                // Update fields
                user.setFullname(req.getParameter("fullname"));
                user.setEmail(req.getParameter("email"));
                user.setAdmin(req.getParameter("admin") != null);
                
                dao.update(user);
                req.setAttribute("message", "User updated successfully!");
            }
        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
        }
        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }
}