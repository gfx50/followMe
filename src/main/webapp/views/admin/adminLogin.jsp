<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/head.jsp" %>
<body>
    <%@ include file="../common/navbar.jsp" %>
    <br>
    <br>
    <br>
    <div class="container">

        <h1 align="center">관리자 로그인</h1>
        <br><br>
    </div>

    <main class="form-signin w-100 m-auto">
        <form action="/fm/alogin">
           
            <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

            <div class="form-floating">
                <input type="email" name="email" class="form-control" id="floatingInputEmail"
                    placeholder="name@example.com">
                <label for="floatingInputEmail">Email address</label>
            </div>
            <div class="form-floating">
                <input type="password" name="pwd" class="form-control" id="floatingInputPassword"
                    placeholder="Password">
                <label for="floatingInputPassword">Password</label>
            </div>

            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
            <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
        </form>
    </main>

    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 20px;
        }

        .form-signin {
            max-width: 400px;
            padding: 15px;
            margin: 0 auto;
        }

        .form-floating {
            margin-bottom: 15px;
        }

        .form-control {
            height: 45px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .text-muted {
            text-align: center;
        }
    </style>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>