package com.abc.service;

import java.sql.SQLException;
import java.util.List;

import com.abc.dao.QueryDAO;
import com.abc.model.Query;

public class QueryService {
    private QueryDAO queryDAO;

    public QueryService() {
        queryDAO = new QueryDAO();
    }

    public List<Query> getAllQueries() throws SQLException {
        return queryDAO.getAllQueries();
    }
}
