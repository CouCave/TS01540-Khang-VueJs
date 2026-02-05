package com.poly.oe.controller;

import com.poly.oe.entity.User;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebFilter({"/admin/*", "/like/*", "/share/*", "/account/*"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        User user = (User) req.getSession().getAttribute("user");
        String error = "";

        if (user == null) {
            error = "Please login!";
        } else if (!Boolean.TRUE.equals(user.getAdmin()) && uri.contains("/admin/")) {
            error = "Access denied!";
        }

        if (!error.isEmpty()) {
            req.getSession().setAttribute("securityMessage", error);
            resp.sendRedirect(req.getContextPath() + "/login?message=" + URLEncoder.encode(error, StandardCharsets.UTF_8));
        } else {
            chain.doFilter(request, response);
        }
    }
}