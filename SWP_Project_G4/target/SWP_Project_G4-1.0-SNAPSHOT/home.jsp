<%-- Document : home Created on : Oct 17, 2023, 9:30:26 PM Author : Ducnv --%>

    <%@page import="java.util.ArrayList" %>
        <%@page import="java.util.ArrayList" %>
            <%@page import="Models.Products" %>
                <%@page import="DAOs.ProductDAO" %>
                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        <%@page contentType="text/html" pageEncoding="UTF-8" %>
                            <!DOCTYPE html>
                            <html>

                            <head>
                                <jsp:include page="head.jsp">
                                    <jsp:param name="title" value="Home" />
                                </jsp:include>
                                <link rel="stylesheet" href="/public/assets/css/home.css" />
                                <link rel="stylesheet" href="/public/assets/css/toast.css" />
                                <!--        <link rel="stylesheet" href="<%out.print(request.getContextPath());%>/public/assets/css/toast.css">-->
                            </head>

                            <body>
                                <header>
                                    <div class="header">
                                        <a href="#">Order History</a>
                                        <a href="#">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                            <span>Cart</span>
                                        </a>
                                        <c:if test="${sessionScope.acc == null}">
                                            <a href="./login.jsp" class="user">
                                                <i class="fa-solid fa-user"></i>
                                                <span>Login</span>
                                            </a>
                                        </c:if>
                                        <c:if test="${sessionScope.acc != null}">
                                            <div class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    <i class="fa-solid fa-user"></i>
                                                    Hello
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right"
                                                    aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" href="#">bla bla</a>
                                                    <a class="dropdown-item" href="#">ble ble</a>
                                                    <div class="dropdown-divider"></div>
                                                    <button class="Btn">

                                                        <div class="sign"><svg viewBox="0 0 512 512">
                                                                <path
                                                                    d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z">
                                                                </path>
                                                            </svg></div>

                                                        <div class="text">Logout</div>
                                                    </button>
                                                    <a class="dropdown-item" href="/Logout">Log out</a>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </header>
                                <div class="jumbotron">
                                    <div class="container">
                                        <div class="row headerContent">
                                            <div class="col-12 col-md-2">
                                                <img class="logo" src="./public/assets/imgs/Logo.png" alt="" />
                                            </div>

                                            <div class="col-12 col-md-7 textHeader">
                                                <p>DISCOVER YOUR OWN STYLE</p>
                                            </div>

                                            <div class="col-12 col-md-3 form-group">
                                                <span class="search-icon border-0" id="search-addon">
                                                    <i class="fas fa-search"></i>
                                                </span>
                                                <form action="/Search" method="post">
                                                    <input oninput="searchByName(this)" name="txt" value="${txtS}"
                                                        type="text" class="form-control rounded" placeholder="Search" />
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <p id="message"></p>
                                <!--Body content-->
                                <div class="container-fluid prd1-cont">
                                    <div class="row">
                                        <div class="col-12 col-md-3 leftContent">
                                            <div class="Filter">
                                                <h3>PRODUCT LINE</h3>
                                                <form action="/Search" method="post">
                                                    <input oninput="searchByName(this)" name="txt" type="search"
                                                        class="form-control rounded" placeholder="Search" />
                                                </form>

                                            </div>
                                            <div class="Filter">
                                                <h3>PRICE</h3>
                                                <div class="filet-price">
                                                    <ul class="list-unstyled">
                                                        <li>
                                                            <label>
                                                                <input name="cbStatus" class="cb-item" type="checkbox"
                                                                    value="500-599k" />
                                                                500 - 599k
                                                            </label>
                                                        </li>
                                                        <li>
                                                            <label>
                                                                <input name="cbStatus" class="cb-item" type="checkbox"
                                                                    value=">600k" />
                                                                > 600k
                                                            </label>
                                                        </li>
                                                        <li>
                                                            <label>
                                                                <input name="cbStatus" class="cb-item" type="checkbox"
                                                                    value="400-499k" />
                                                                400 - 499k
                                                            </label>
                                                        </li>
                                                        <li>
                                                            <label>
                                                                <input name="cbStatus" class="cb-item" type="checkbox"
                                                                    value="300-399k" />
                                                                300 - 399k
                                                            </label>
                                                        </li>
                                                        <li>
                                                            <label>
                                                                <input name="cbStatus" class="cb-item" type="checkbox"
                                                                    value="200-299k" />
                                                                200 - 299k
                                                            </label>
                                                        </li>
                                                        <li>
                                                            <label>
                                                                <input name="cbStatus" class="cb-item" type="checkbox"
                                                                    value="<299" />
                                                                < 299k </label>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-9 rightContent">
                                            <div class="banner">
                                                <img src="./public/assets/imgs/Desktop_Homepage_Banner.png" alt="" />
                                            </div>
                                            <div class="row" id="content">
                                                <% ProductDAO dao=new ProductDAO(); ArrayList<Products> products =
                                                    dao.getAllProducts();
                                                    for (Products product : products) {
                                                    %>
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail">
                                                            <a href="#">
                                                                <div class="cont-item">
                                                                    <img src="<%out.print(product.getImage());%>"
                                                                        alt="" />
                                                                </div>
                                                                <div class="caption">
                                                                    <h3 class="name">
                                                                        <%out.print(product.getProductName());%>
                                                                    </h3>
                                                                    <h3 class="color">
                                                                        <%out.print(product.getDescription());%>
                                                                    </h3>
                                                                    <h3 class="price">
                                                                        <%out.print(product.getPrice());%> VND
                                                                    </h3>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="footer">
                                    <div class="contact row">
                                        <div class="introduction col-md-4">
                                            <div class="logo-name">
                                                <img src="https://ananas.vn/wp-content/themes/ananas/fe-assets/images/svg/Store.svg"
                                                    alt="" />
                                            </div>
                                        </div>
                                        <div class="head help col-md-2">
                                            PRODUCT
                                            <div>
                                                <p>Men's shoes</p>
                                                <p>Women's shoes</p>
                                                <p>Shoes Sale-off</p>
                                            </div>

                                            ANANAS SOCIAL
                                            <div class="social-media">
                                                <i class="fa-brands fa-instagram"></i>
                                                <i class="fa-brands fa-facebook"></i>
                                                <i class="fa-brands fa-youtube"></i>
                                            </div>
                                        </div>
                                        <div class="head help col-md-2">
                                            HELP
                                            <p>Help</p>
                                            <p>Discuss</p>
                                            <p>Contact us</p>
                                        </div>
                                        <div class="head pay col-md-2">
                                            PAYMENT METHODS
                                            <p>Paypal</p>
                                            <p>Visa</p>
                                            <div class="bocongthuong">
                                                <img src="http://online.gov.vn/Content/EndUser/LogoCCDVSaleNoti/logoSaleNoti.png"
                                                    alt="" />
                                            </div>
                                        </div>
                                        <div class="head info col-md-2">
                                            INFORMATION
                                            <p>About us</p>
                                            <p>Hotline</p>
                                            <p>0987 234 662</p>
                                        </div>
                                    </div>
                                    <div class="copyright">
                                        <p>Copyright by GR4 © 2023. All Rights Reserved.</p>
                                    </div>

                                    <script>
                                        // Đợi 5 giây trước khi xóa div
                                        setTimeout(function () {
                                            var messageDiv = document.getElementById('message');
                                            messageDiv.parentNode.removeChild(messageDiv);
                                        }, 5000);

                                        function searchByName(param) {
                                            var txtSearch = param.value;
                                            $.ajax({
                                                url: "/Search",
                                                type: "get",
                                                data: {
                                                    txt: txtSearch
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                }
                                            });
                                        }
                                    </script>
                                </div>
                                <%@include file="foot.jsp" %>
                                    <%@include file="popUpMessage.jsp" %>
                            </body>

                            </html>