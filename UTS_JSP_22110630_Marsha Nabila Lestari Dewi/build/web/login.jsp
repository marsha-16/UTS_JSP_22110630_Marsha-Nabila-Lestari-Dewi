<%-- 
    Document   : login
    Created on : May 16, 2025, 1:53:31 PM
    Author     : Marsha Nabila L
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login - Bioskop Marsha</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom Style -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap');

        body {
            background: linear-gradient(135deg, #ffd1dc, #ff6f91);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Comic Neue', cursive, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }
        .login-card {
            background: #fff0f5;
            padding: 2.5rem 3rem;
            border-radius: 25px;
            box-shadow: 0 15px 25px rgba(255, 105, 180, 0.3);
            width: 100%;
            max-width: 400px;
            border: 3px solid #ff69b4;
            text-align: center;
            position: relative;
        }
        .login-card::before {
            content: "🎀";
            font-size: 3rem;
            position: absolute;
            top: -30px;
            left: 50%;
            transform: translateX(-50%);
            color: #ff1493;
        }
        h2 {
            margin-bottom: 2rem;
            font-weight: 700;
            color: #d81b60;
            letter-spacing: 1.5px;
        }
        .form-label {
            font-weight: 600;
            color: #c2185b;
        }
        .form-control {
            border: 2px solid #ff69b4;
            border-radius: 12px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            border-color: #ff1493;
            box-shadow: 0 0 8px rgba(255, 20, 147, 0.5);
            outline: none;
        }
        .btn-primary {
            background: #ff69b4;
            border: none;
            font-weight: 700;
            width: 100%;
            padding: 0.8rem;
            font-size: 1.1rem;
            border-radius: 12px;
            transition: background 0.4s ease, box-shadow 0.4s ease;
            box-shadow: 0 6px 12px rgba(255, 105, 180, 0.4);
        }
        .btn-primary:hover {
            background: #ff1493;
            box-shadow: 0 8px 16px rgba(255, 20, 147, 0.6);
        }
        .invalid-feedback {
            font-size: 0.9rem;
            color: #d81b60;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <h2>Masuk ke Bioskop Marsha</h2>
        <form action="dologin.jsp" method="post" class="needs-validation" novalidate>
            <div class="mb-4 text-start">
                <label for="username" class="form-label">Nama Pengguna</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Masukkan nama pengguna" required autocomplete="username" />
                <div class="invalid-feedback">Nama pengguna wajib diisi.</div>
            </div>
            <div class="mb-4 text-start">
                <label for="password" class="form-label">Kata Sandi</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Masukkan kata sandi" required autocomplete="current-password" />
                <div class="invalid-feedback">Kata sandi wajib diisi.</div>
            </div>
            <button type="submit" class="btn btn-primary">Masuk 💖</button>
        </form>
    </div>

    <!-- Bootstrap JS + Validasi -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        (() => {
            'use strict';
            const forms = document.querySelectorAll('.needs-validation');
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>

