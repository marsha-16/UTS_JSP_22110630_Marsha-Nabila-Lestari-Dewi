<%-- 
    Document   : index
    Created on : May 16, 2025, 1:37:59 PM
    Author     : Marsha Nabila L
--%>

<%-- 
    Document   : index.jsp
    Created on : May 16, 2025, 1:37:59 PM
    Author     : Marsha Nabila L
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>

<%
    String namauser = (String) session.getAttribute("namauser");
    if (namauser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Bioskop Marsha</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <!-- Google Font Comic -->
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #ffdde1 0%, #fbc2eb 100%);
            min-height: 100vh;
            color: #6a1b9a;
            font-family: 'Comic Neue', cursive, sans-serif;
        }
        h1 {
            text-align: center;
            margin-bottom: 40px;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.2);
            font-weight: 900;
            letter-spacing: 1px;
            color: #d81b60;
        }
        .film-card {
            background-color: #ffe6f0;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            padding: 15px;
            color: #880e4f;
        }
        .film-card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .film-card-header {
            background-color: #f48fb1;
            border-radius: 15px 15px 0 0;
            padding: 10px;
            font-size: 1.3rem;
            text-align: center;
            font-weight: bold;
            color: white;
        }
        .film-card-body {
            padding: 15px;
        }
        .film-info p {
            margin: 6px 0;
        }
        .btn-pink {
            background: linear-gradient(45deg, #ff80ab, #ff4081);
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 25px;
            width: 100%;
        }
        .btn-pink:hover {
            background: linear-gradient(45deg, #ff4081, #f50057);
            box-shadow: 0 6px 12px rgba(255, 105, 180, 0.4);
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="animate__animated animate__bounceIn">🎬 Daftar Film Sedang Tayang 🎀</h1>
        <div class="row">
            <%
                List<String[]> films = new ArrayList<>();
                films.add(new String[]{"Film Petualangan Sherina", "Petualangan", "120 menit", "50000", "10:00, 13:00, 16:00"});
                films.add(new String[]{"Film Home Sweet Loan", "Drama Cinta", "90 menit", "40000", "11:00, 14:00, 17:00"});
                films.add(new String[]{"Film Gampang Cuan", "Komedi Lucu", "100 menit", "45000", "12:00, 15:00, 18:00"});

                int delayIndex = 0;
                for (String[] film : films) {
                    String animationDelay = (delayIndex * 0.3) + "s";
                    delayIndex++;

                    String encodedTitle = URLEncoder.encode(film[0], "UTF-8");
                    String encodedPrice = URLEncoder.encode(film[3], "UTF-8");
            %>
            <div class="col-md-4 mb-4">
                <div class="film-card animate__animated animate__fadeInUp" style="animation-delay: <%= animationDelay %>;">
                    <div class="film-card-header">
                        <%= film[0] %>
                    </div>
                    <div class="film-card-body film-info">
                        <p><strong>🎭 Genre:</strong> <%= film[1] %></p>
                        <p><strong>⏱️ Durasi:</strong> <%= film[2] %></p>
                        <p><strong>💸 Harga:</strong> Rp <%= film[3] %></p>
                        <p><strong>🕒 Jam:</strong> <%= film[4] %></p>
                        <a href="form_pemesanan.jsp?judul=<%= encodedTitle %>&harga=<%= encodedPrice %>" class="btn btn-pink mt-3">🎟️ Pesan Sekarang</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
