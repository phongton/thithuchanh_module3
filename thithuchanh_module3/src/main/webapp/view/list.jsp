<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tonthathoangphong
  Date: 09/07/2024
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<%-- navbar--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="navbar-brand" href="#"><h3>Danh sách sản phẩm </h3></a>

        </div>
    </div>
</nav>
<div class="container">
    <br>

    <div class="container mt-5">
        <c:if test="${not empty sessionScope.message}">
            <div style="color: blue;">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>
        <br>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
            Thêm sản phẩm
        </button>
        <form action="/product?action=searchTop" method="post">
        <div class="mb-3">
            <label for="toplist" class="form-label">Danh sách top</label>
            <select style="width: 200px" class="form-select" id="topList" name="top" >

                <option value="3">3</option>
                <option value="5">5</option>
                <option value="10">10</option>
            </select>
           <label>Sản phẩm được đặt hàng nhiều nhất <button type="submit">Xem</button></label>
        </div>
        </form>
        </select></p>
        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addProductModalLabel">Thêm mới sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addProductForm" action="/product?action=create" method="post">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Name</label>
                                <input type="text" class="form-control" id="productName" name="name" required>
                                <div class="invalid-feedback">Tên sản phẩm không được để trống.</div>
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Price</label>
                                <input type="number" step="0.01" class="form-control" id="productPrice" name="price"
                                       min="100" required>
                                <div class="invalid-feedback">Giá không để trống và phải thỏa mãn lớn hơn 100 $.</div>
                            </div>
                            <div class="mb-3">
                                <label for="productColor" class="form-label">Discount</label>
                                <select class="form-select" id="productColor" name="discount" required>

                                    <option value="5">5%</option>
                                    <option value="10">10%</option>
                                    <option value="15">15%</option>
                                    <option value="20">20%</option>


                                </select>
                                <div class="invalid-feedback">Discount phải có giá tri.</div>
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Stock</label>
                                <input type="number" step="0.01" class="form-control" id="stock" name="stock"
                                       min="10" required>
                                <div class="invalid-feedback">Giá không để trống và phải thỏa mãn lớn hơn 10.</div>
                            </div>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Price </th>
            <th>Discount</th>
            <th>Stock</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${product}" varStatus="status">
            <tr>
                <td>${status.count}</td>

                <td>${product.name}</td>
                <td>${product.price}$</td>
                <td>${product.discount}</td>
                <td>${product.stock}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
