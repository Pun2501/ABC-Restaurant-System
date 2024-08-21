package com.abc.controller;

import com.abc.service.FoodService;
import com.abc.model.Food;
import com.abc.dao.DBConnection;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/foodController")
public class FoodController extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!ServletFileUpload.isMultipartContent(request)) {
            String action = request.getParameter("action");
            if (action.equals("delete")) {
                int foodId = Integer.parseInt(request.getParameter("foodId"));
                deleteFood(foodId, response);
            } else {
                response.sendRedirect("adminDashboard.jsp?error=Invalid form submission");
            }
        } else {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> formItems = upload.parseRequest(request);
                if (formItems != null && formItems.size() > 0) {
                    String action = null;
                    String foodName = null;
                    String description = null;
                    double price = 0.0;
                    String imageFileName = null;
                    String category = null;
                    int foodId = 0;

                    for (FileItem item : formItems) {
                        if (item.isFormField()) {
                            String fieldName = item.getFieldName();
                            String fieldValue = item.getString();

                            if (fieldName.equals("action")) {
                                action = fieldValue;
                            } else if (fieldName.equals("foodName")) {
                                foodName = fieldValue;
                            } else if (fieldName.equals("description")) {
                                description = fieldValue;
                            } else if (fieldName.equals("price")) {
                                price = Double.parseDouble(fieldValue);
                            } else if (fieldName.equals("category")) {
                                category = fieldValue;
                            } else if (fieldName.equals("foodId")) {
                                foodId = Integer.parseInt(fieldValue);
                            }
                        } else {
                            if (item.getSize() > 0) {
                                String fileName = new File(item.getName()).getName();
                                String filePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY + File.separator + fileName;
                                File storeFile = new File(filePath);
                                item.write(storeFile);
                                imageFileName = fileName;
                            }
                        }
                    }

                    switch (action) {
                        case "add":
                            addFood(foodName, description, price, imageFileName, category, response);
                            break;
                        case "update":
                            updateFood(foodId, foodName, description, price, imageFileName, category, response);
                            break;
                        default:
                            response.sendRedirect("adminDashboard.jsp?error=Invalid action");
                            break;
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendRedirect("adminDashboard.jsp?error=Error processing request");
            }
        }
    }

    private void addFood(String foodName, String description, double price, String imageFileName, String category, HttpServletResponse response)
            throws IOException {
        FoodService foodService = new FoodService();
        Food food = new Food(0, foodName, description, price, imageFileName, category);
        boolean result = foodService.addFood(food);

        if (result) {
            response.sendRedirect("adminDashboard.jsp?success=Food item added successfully");
        } else {
            response.sendRedirect("adminDashboard.jsp?error=Error adding food item");
        }
    }

    private void updateFood(int foodId, String foodName, String description, double price, String imageFileName, String category, HttpServletResponse response)
            throws IOException {
        FoodService foodService = new FoodService();
        Food food = new Food(foodId, foodName, description, price, imageFileName, category);
        boolean result = foodService.updateFood(food);

        if (result) {
            response.sendRedirect("adminDashboard.jsp?success=Food item updated successfully");
        } else {
            response.sendRedirect("adminDashboard.jsp?error=Error updating food item");
        }
    }

    private void deleteFood(int foodId, HttpServletResponse response) throws IOException {
        FoodService foodService = new FoodService();
        boolean result = foodService.deleteFood(foodId);

        if (result) {
            response.sendRedirect("adminDashboard.jsp?success=Food item deleted successfully");
        } else {
            response.sendRedirect("adminDashboard.jsp?error=Error deleting food item");
        }
    }
}
