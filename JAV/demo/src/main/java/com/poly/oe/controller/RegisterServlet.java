package com.poly.oe.controller;

import com.poly.oe.dao.UserDAO;
import com.poly.oe.entity.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            User user = new User();
            BeanUtils.populate(user, req.getParameterMap());
            user.setAdmin(false); // Default role

            UserDAO dao = new UserDAO();
            if (dao.findById(user.getId()) != null) {
                req.setAttribute("message", "Username already exists!");
                req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
                return;
            }

            dao.create(user);
            req.setAttribute("message", "Registration successful! Please login.");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "Error: " + e.getMessage());
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        }
    }
}