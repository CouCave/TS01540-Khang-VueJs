package com.poly.oe.controller;

import com.poly.oe.dao.UserDAO;
import com.poly.oe.entity.User;
import com.poly.oe.utils.CookieUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = CookieUtils.get("username", req);
        req.setAttribute("username", username);
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String pw = req.getParameter("password");
        String remember = req.getParameter("remember");

        UserDAO dao = new UserDAO();
        User user = dao.findById(id);

        if (user != null && user.getPassword().equals(pw)) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            if (remember != null) {
                CookieUtils.add("username", id, 24, resp);
            } else {
                CookieUtils.add("username", id, 0, resp);
            }

            if (user.getAdmin()) {
                resp.sendRedirect(req.getContextPath() + "/admin/videos");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            req.setAttribute("message", "Invalid username or password!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}