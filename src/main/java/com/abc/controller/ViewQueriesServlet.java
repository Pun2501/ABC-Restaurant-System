package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.model.Query;
import com.abc.service.QueryService;

@WebServlet("/viewQueries")
public class ViewQueriesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QueryService queryService = new QueryService();

        try {
            List<Query> queries = queryService.getAllQueries();
            if (queries != null && !queries.isEmpty()) {
                request.setAttribute("queries", queries);
                request.getRequestDispatcher("viewQueries.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "No queries found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving queries.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

