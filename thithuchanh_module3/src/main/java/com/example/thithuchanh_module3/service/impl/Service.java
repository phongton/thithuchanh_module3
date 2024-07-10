package com.example.thithuchanh_module3.service.impl;

import com.example.thithuchanh_module3.model.Product;
import com.example.thithuchanh_module3.repository.Repository;
import com.example.thithuchanh_module3.service.IService;

import java.util.List;

public class Service implements IService {
    Repository repository = new Repository();
    @Override
    public List<Product> findAllProduct() {
        return repository.findAllProduct();
    }

    @Override
    public boolean createProduct(Product product) {
        return repository.createProduct(product);
    }

    @Override
    public List<Product> findTopList(int top) {
        return repository.findTopList(top);
    }
}
