<%-- 
    Document   : orderHistory
    Created on : Oct 31, 2023, 1:12:34 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <jsp:include page="head.jsp">
            <jsp:param name="title" value="OrderHistory" />
        </jsp:include>
        <link rel="stylesheet" href="/public/assets/css/orderHistory.css">
    </head>

    <body>
        <section class="h-custom"
                 style="background: linear-gradient(to right, rgba(161, 196, 253, 1), rgba(194, 233, 251, 1))">
            <a href="#" class="back">
                <span>Back</span>
            </a>
            <div class="container">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-8 col-xl-6">
                        <div class="card card-stepper border-top border-bottom border-3"
                             style="border-color: rgb(70, 167, 211) !important;">
                            <div class="card-body p-5">

                                <p class="lead fw-bold mb-1" style="color: rgb(70, 167, 211);">Purchase Receipt</p>

                                <div class="row">
                                    <div class="col mb-3">
                                        <p class="small text-muted mb-1">Date</p>
                                        <p>10 April 2021</p>
                                    </div>
                                    <div class="col mb-3">
                                        <p class="small text-muted mb-1">Order No.</p>
                                        <p>xx</p>
                                    </div>
                                </div>

                                <div class=" px-3 py-4" style="background-color: #f2f2f2;">
                                    <div class="row content-detail">
                                        <div class="col-md-8 col-lg-9">
                                            <div class="content1">
                                                <p class="mr-3 mb-0">Basas Evergreen - Low Top</p>
                                                <p class="quantity mb-0">x1</p>
                                                <div class="content2">
                                                    <p class="mr-3">Size: 41</p>
                                                    <p>Color: Evergreen</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-lg-3">
                                            <p>590,000 VND</p>
                                        </div>
                                        <div class="col-md-8 col-lg-9">
                                            <div class="content1">
                                                <p class="mr-3 mb-0">Basas Evergreen - Low Top</p>
                                                <p class="quantity mb-0">x1</p>
                                                <div class="content2">
                                                    <p class="mr-3">Size: 41</p>
                                                    <p>Color: Evergreen</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-lg-3">
                                            <p>590,000 VND</p>
                                        </div>
                                        <div class="col-md-8 col-lg-9">
                                            <div class="content1">
                                                <p class="mr-3 mb-0">Basas Evergreen - Low Top</p>
                                                <p class="quantity mb-0">x1</p>
                                                <div class="content2">
                                                    <p class="mr-3">Size: 41</p>
                                                    <p>Color: Evergreen</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-lg-3">
                                            <p>590,000 VND</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between mt-4">
                                    <p>Subtotal</p>
                                    <p>590,000 VND</p>
                                </div>
                                <div class="d-flex justify-content-between ">
                                    <p class="small mb-0">Shipping</p>
                                    <p class="small mb-0">33,000 VND</p>
                                </div>

                                <hr />
                                <div class="row my-2">
                                    <div class="col-md-4 offset-md-8 col-lg-4 offset-lg-8">
                                        <p>TOTAL</p>
                                        <p class="lead Total fw-bold mb-0" style="color: rgb(70, 167, 211);">590,000 VND</p>
                                    </div>
                                </div>

                                <p class="lead fw-bold mb-3 pb-2" style="color: rgb(70, 167, 211)">Tracking Order</p>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <ul id="progressbar-1" class="mx-0 mt-0 mb-0 px-0 pt-0 pb-4">
                                            <li class="step01 active" id="step1"><span
                                                    style="margin-left: 22px; margin-top: 12px;">PLACED</span></li>
                                            <li class="step0 active text-center" id="step2"><span>SHIPPING</span></li>
                                            <li class="step0 text-muted text-end" id="step3"><span
                                                    style="margin-right: 22px;">DELIVERED</span></li>
                                        </ul>
                                    </div>
                                </div>

                                <p></p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>

</html>
