<%-- 
    Document   : error
    Created on : May 16, 2025, 1:54:59 PM
    Author     : Marsha Nabila L
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Halaman Error</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(135deg, #ff6fb5, #ff90b3);
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            color: #fff;
            overflow: hidden;
        }
        .container {
            background: #fff0f5;
            border-radius: 25px;
            padding: 40px 35px;
            max-width: 480px;
            width: 100%;
            box-shadow: 0 15px 40px rgba(255, 105, 180, 0.4);
            text-align: center;
            position: relative;
            animation: fadeInUp 1s ease forwards;
            color: #900048;
        }
        h1 {
            font-weight: 700;
            font-size: 2.6rem;
            margin-bottom: 15px;
            color: #d81b60;
        }
        .alert {
            background-color: #ffc1d1;
            color: #a10050;
            font-weight: 600;
            border-radius: 12px;
            padding: 15px 20px;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(255, 20, 147, 0.3);
        }
        .btn-error {
            background: #d81b60;
            border: none;
            color: #fff;
            font-weight: 600;
            padding: 12px 28px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 1.1rem;
            box-shadow: 0 6px 15px rgba(216, 27, 96, 0.5);
            transition: background 0.3s ease;
            margin-right: 15px;
        }
        .btn-error:hover {
            background: #b21651;
        }
        .btn-primary {
            background: #ff69b4;
            border: none;
            color: white;
            font-weight: 700;
            padding: 12px 30px;
            border-radius: 20px;
            font-size: 1.1rem;
            box-shadow: 0 6px 15px rgba(255, 105, 180, 0.6);
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #ff1493;
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(40px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

    <script>
        function showError() {
            alert("Username atau Password salah! Silahkan coba lagi.");
        }
    </script>
</head>
<body>
    <div class="container">
        <h1><i class="fas fa-exclamation-triangle"></i> Terjadi Kesalahan!</h1>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <div class="alert" role="alert">
                <%= errorMessage %>
            </div>
        <%
                session.removeAttribute("loginError");
            }
        %>
        <form action="login.jsp" method="post" class="d-flex justify-content-center">
            <button type="button" class="btn-error" onclick="showError()">
                <i class="fas fa-info-circle"></i> Tampilkan Pesan Kesalahan
            </button>
            <button type="submit" class="btn-primary">
                <i class="fas fa-redo-alt"></i> Ulangi Kembali
            </button>
        </form>
    </div>

    <!-- Bootstrap & dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
