package com.example.thithuchanh_module3.controller;

import com.example.thithuchanh_module3.model.Product;
import com.example.thithuchanh_module3.service.IService;
import com.example.thithuchanh_module3.service.impl.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",value = "/product")
public class ProductServlet extends HttpServlet {
    private IService service = new Service();
    private Product product;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {

            default:
                List<Product> products1 = service.findAllProduct();
                req.setAttribute("product", products1);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if(action == null) {
            action="";
        }
        switch (action){
            case "create":
                String name = req.getParameter("name");
             Double price = Double.parseDouble(req.getParameter("price"));
             Integer discount = Integer.parseInt(req.getParameter("discount"));
             Integer stock = Integer.parseInt(req.getParameter("stock"));
             product=new Product(name,price,discount,stock);
             boolean isCreate=service.createProduct(product);
            if (isCreate){
                resp.sendRedirect("/product");
                req.getSession().setAttribute("message", "Thêm mới thành công");
            }
            break;
            case "searchTop":
                int top=Integer.parseInt(req.getParameter("top"));
                List<Product> products1 = service.findTopList(top);
                req.setAttribute("product", products1);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;


        }
    }
}
