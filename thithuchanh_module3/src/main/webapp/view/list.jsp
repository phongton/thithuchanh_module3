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
            <a class="navbar-brand" href="#">User</a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <br>
    <form class="d-flex" method="post" action="/product?action=search">
        <input style="width: 200px" class="form-control me-2" type="text" placeholder="Search By Name"
               name="productName" aria-label="Search">
        <input style="width: 200px" class="form-control me-2" type="text" placeholder="Search By Price" name="price"
               aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
    <div class="container mt-5">
        <c:if test="${not empty sessionScope.message}">
            <div style="color: blue;">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>
        <br>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
            Thêm sản phẩm
        </button>
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
                                <label for="productName" class="form-label">Tên sản phẩm</label>
                                <input type="text" class="form-control" id="productName" name="name" required>
                                <div class="invalid-feedback">Tên sản phẩm không được để trống.</div>
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Giá</label>
                                <input type="number" step="0.01" class="form-control" id="productPrice" name="price"
                                       min="500" required>
                                <div class="invalid-feedback">Giá không để trống và phải thỏa mãn lớn hơn 500 $.</div>
                            </div>
                            <div class="mb-3">
                                <label for="productQuantity" class="form-label">Số lượng</label>
                                <input type="number" class="form-control" id="productQuantity" name="quantity" required>
                                <div class="invalid-feedback">Số lượng không để trống và phải là số nguyên dương.</div>
                            </div>
                            <div class="mb-3">
                                <label for="productColor" class="form-label">Màu sắc</label>
                                <select class="form-select" id="productColor" name="color" required>
                                    <option value="">Chọn màu</option>
                                    <!-- Giá trị màu sẽ được lấy từ database -->
                                    <option value="Đỏ ">Đỏ</option>
                                    <option value="Xanh">Xanh</option>
                                    <option value="Đen">Đen</option>
                                    <option value="Trắng">Trắng</option>
                                    <option value="Vàng">Vàng</option>

                                </select>
                                <div class="invalid-feedback">Màu sắc phải có giá trị.</div>
                            </div>
                            <div class="mb-3">
                                <label for="productDescription" class="form-label">Mô tả</label>
                                <textarea class="form-control" id="productDescription" name="description"
                                          required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="productCategory" class="form-label">Danh mục</label>
                                <select class="form-select" id="productCategory" name="idCategory" required>
                                    <option value="">Chọn danh mục</option>

                                    <option value="1">Điện thoại di động</option>
                                    <option value="2">Máy tính bảng</option>
                                    <option value="3">Laptop</option>
                                    <option value="4">Đồ gia dụng</option>
                                </select>
                                <div class="invalid-feedback">Danh mục phải có giá trị.</div>
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
            <th>Số thứ tự</th>
            <th>Tên sản phẩm</th>
            <th>Giá </th>
            <th>Tồn kho</th>
            <th>Màu</th>
            <th>Loại</th>
            <th>Thao tác</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${product}" varStatus="status">
            <tr>
                <td>${status.count}</td>

                <td>${product.name}</td>
                <td>${product.price}$</td>
                <td>${product.quantity}</td>
                <td>${product.color}</td>
                <td>${product.category}</td>
                <td>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deleteModal${product.id}">  <span class="material-symbols-outlined">edit</span></button>
                <%--                                    Xoá sản phẩm--%>
                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${product.id}"><span class="material-symbols-outlined">delete</span></button>
                    <div class="modal fade" id="deleteModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">

                                    <h5 class="modal-title" id="exampleModalLabel">Xóa sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có muốn xóa sản phẩm có tên là ${product.name}?
                                    <p style="color: red">Hành động này không thể hoàn tác!!!!!</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <form action="/product?action=delete" method="post">
                                        <input type="hidden" name="id" value="${product.id}">
                                        <button type="submit" class="btn btn-primary">Xác nhận</button>

                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
