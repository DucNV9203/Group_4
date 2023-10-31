<%-- 
    Document   : head
    Created on : Oct 28, 2023, 1:38:43 AM
    Author     : Ducnv
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="head.jsp">
            <jsp:param name="title" value="Sign Up"/>
        </jsp:include>
        <link rel="stylesheet" href="/public/assets/css/signup.css"> 
<!--        <link rel="stylesheet" href="<%out.print(request.getContextPath());%>/public/assets/css/signup.css">-->
    </head>

    <body>
        <div id="main">
            <div class="box">              
                <form action="SignUp" method="post" id="signUpForm" class="needs-validation">
<!--                    <input type="text" required="required" name="avatar" value="${user.avatar}" style="display: none">-->
                    <h2>Sign up</h2>
                    <div class="inputBox">
                        <label class="form-label">Username</label>
                        <input class="form-control" id="username" type="text" placeholder="Enter your username"
                               required="required" name="username">
                        <i></i>
                    </div>
                    <div class="inputBox">
                        <label class="form-label">Email</label>
                        <input class="form-control" id="email" type="text" placeholder="Enter your email"
                               required="required" name="email">
                        <i></i>
                    </div>
                    <div class="inputBox-name">
                        <div class="inputBox">
                            <label class="form-label">First Name</label>
                            <input class="form-control" type="text" placeholder="First name" required="required"
                                   name="firstName">
                            <i></i>
                        </div>
                        <div class="inputBox">
                            <label class="form-label">Last Name</label>
                            <input class="form-control" type="text" placeholder="Last name" required="required"
                                   name="lastName">
                            <i></i>
                        </div>
                    </div>

                    <div class="inputBox date">
                        <label class="form-label">Birthday</label>
                        <input class="form-control" type="date" value="2023-10-09" required="required" name="birthday">
                        <i></i>
                    </div>

                    <div class="inputBox">
                        <label class="form-label">Password</label>
                        <input class="form-control" type="password" placeholder="Enter your password"
                               required="required" name="password">
                        <i></i>
                    </div>

                    <input type="submit" value="Register" name="btnRegister">


                    <div class="loginHere">
                        <span>Have an account already?</span>
                        <a href="/Login"> Please login here</a>
                    </div>
                </form> 
                    <div id="signupError">
                        <p id="message"></p>
                    </div>
                
            </div>
            <script>
                // Đợi 5 giây trước khi xóa div
                setTimeout(function () {
                    var messageDiv = document.getElementById('message');
                    messageDiv.parentNode.removeChild(messageDiv);
                }, 5000);
                
                //#########################################################
                //Validate user's input
                let error = document.getElementById("signupError");
                let form = document.getElementById("signUpForm");

                form.addEventListener("submit", function (event) {
                    let msg = "";
                    let error_msg = document.getElementById("message");
                    let username = document.getElementById("username").value;
                    let email = document.getElementById("email").value;
                    let password = document.getElementById("password").value;
                    let valid = true;
                    if (username === "" || username === null) {
                        msg += "Username is empty" + "<br>";
                        // error.classList.add("error_show");
                        valid = false;
                    } else if (username.length > 32) {
                        msg += "Username is too long" + "<br>";
                        // error.classList.add("error_show");
                        valid = false;
                    }
                    const emailInput = document.getElementById('email');
                    const emailValue = emailInput.value;

                    const emailRegex = /^(?=.{11,64}@)[A-Za-z0-9]+((@gmail.com))+$/;
                    if (email === "" || email === null) {
                        msg += "Email is empty" + "<br>";
                        // error.classList.add("error_show");
                        valid = false;
                    } else
                    if (!emailRegex.test(emailValue)) {
                        // Invalid email address
                        msg += "Invalid email address" + "<br>";
                        valid = false;
                    }

                    if (password.length < 8) {
                        msg += "Password must be more than 8 characters" + "<br>";
                        valid = false;
                    }
                    if (valid == false) {
                        error.classList.add("error_show");
                        error_msg.innerHTML = msg.substring(0, msg.length);
                        event.preventDefault();
                    }
                });
                //#########################################################
            </script>
        </div>

        <%@include file="foot.jsp" %>
        <%@include file="popUpMessage.jsp" %>
    </body>

</html>