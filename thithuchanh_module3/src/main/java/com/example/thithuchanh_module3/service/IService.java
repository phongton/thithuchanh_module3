package com.example.thithuchanh_module3.service;

import com.example.thithuchanh_module3.model.Product;

import java.util.List;

public interface IService {
    List<Product> findAllProduct();

    boolean createProduct(Product product);
    List<Product> findTopList(int top);
}
