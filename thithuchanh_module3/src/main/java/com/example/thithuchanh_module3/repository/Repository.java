package com.example.thithuchanh_module3.repository;

import com.example.thithuchanh_module3.connection.BaseRepository;
import com.example.thithuchanh_module3.model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Repository {
    private static final String FIND_TOP_LIST= "{CALL GetTopSellingProducts(?)}";

    public List<Product> findAllProduct() {
    List<Product> products = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("select * from products");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int discount = resultSet.getInt("discount");
                int stock = resultSet.getInt("stock");
                products.add(new Product(id,name,price,discount,stock));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;

    }

    public boolean createProduct(Product product) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement("insert into products(name,price,discount,stock) values(?,?,?,?) ");
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getDiscount());
            preparedStatement.setInt(4, product.getStock());
            int check = preparedStatement.executeUpdate();
            if (check > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Product> findTopList(int top) {
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement preparedStatement= BaseRepository.getConnection().prepareStatement(FIND_TOP_LIST);
            preparedStatement.setInt(1, top);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int discount = resultSet.getInt("discount");
                int stock = resultSet.getInt("stock");
                products.add(new Product(name,price,discount,stock));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }
}
