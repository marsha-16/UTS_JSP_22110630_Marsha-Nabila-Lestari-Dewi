<%-- 
    Document   : struk
    Created on : May 16, 2025, 1:39:19 PM
    Author     : Marsha Nabila L
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%
    String nama = request.getParameter("nama");
    String film = request.getParameter("film");
    String tanggal = request.getParameter("tanggal");
    String jam = request.getParameter("jam");
    String kursi = request.getParameter("kursi");
    String metode = request.getParameter("metode");

    String hargaStr = request.getParameter("harga");
    String jumlahStr = request.getParameter("jumlah");

    int harga = 0;
    int jumlah = 0;
    int total = 0;

    if (hargaStr != null) {
        try { harga = Integer.parseInt(hargaStr); } catch (Exception e) { harga = 0; }
    }

    if (jumlahStr != null) {
        try { jumlah = Integer.parseInt(jumlahStr); } catch (Exception e) { jumlah = 0; }
    }

    total = harga * jumlah;

    // Format uang Indonesia
    NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
    String totalFormatted = formatter.format(total).replace(",00", "");
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Tiket Bioskop - Cetak</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: #ffe4f1;
            font-family: 'Comic Neue', cursive;
            padding: 40px 0;
            display: flex;
            justify-content: center;
            position: relative;
            min-height: 100vh;
            margin: 0;
        }
        .ticket-container {
            background: #fff0f5;
            border: 3px solid #ff69b4;
            border-radius: 30px;
            width: 500px;
            padding: 50px;
            box-shadow: 0 12px 30px rgba(255, 105, 180, 0.4);
            text-align: center;
            position: relative;
            font-size: 1.2rem;
}

        .ticket-header {
            font-weight: 900;
            color: #ff1493;
            font-size: 1.6rem;
            margin-bottom: 15px;
        }
        .ticket-subtitle {
            color: #c2185b;
            margin-bottom: 25px;
            font-size: 1.1rem;
            font-weight: 600;
        }
        .ticket-detail {
            text-align: left;
            margin-bottom: 20px;
            font-size: 1rem;
            color: #900048;
        }
        .detail-label {
            font-weight: 700;
            color: #d63384;
            display: inline-block;
            width: 120px;
        }
        #qrcode {
            margin: 0 auto 25px;
            width: 160px;
            height: 160px;
            border: 5px solid #ff69b4;
            border-radius: 15px;
            background: #fff0f5;
            box-shadow: 0 6px 12px rgba(255, 105, 180, 0.3);
        }
        .thank-you {
            font-weight: 600;
            color: #c2185b;
            margin-top: 10px;
            font-size: 0.95rem;
        }
        .btn-print {
            background-color: #ff69b4;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 10px 30px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 6px 12px rgba(255, 105, 180, 0.4);
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .btn-print:hover {
            background-color: #ff1493;
        }
        .btn-logout {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #ff1493;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 8px 18px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 6px 12px rgba(255, 20, 147, 0.6);
        }
        .btn-logout:hover {
            background-color: #d40f7a;
        }
        @media print {
            .btn-print, .btn-logout {
                display: none !important;
            }
        }
                .glow-btn {
            padding: 12px 30px;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            background: linear-gradient(45deg, #ff6ec4, #7873f5);
            color: white;
            cursor: pointer;
            box-shadow: 0 0 10px #ff6ec4;
            transition: 0.4s ease;
        }

        .glow-btn:hover {
            box-shadow: 0 0 20px #ff6ec4, 0 0 40px #7873f5;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="ticket-container">
        <div class="ticket-header">🎬 Tiket Bioskop 🎟️</div>
        <div class="ticket-subtitle">Bioskop Marsha</div>

        <div class="ticket-detail">
            <p><span class="detail-label">Nama:</span> <%= nama != null ? nama : "-" %></p>
            <p><span class="detail-label">Film:</span> <%= film != null ? film : "-" %></p>
            <p><span class="detail-label">Tanggal:</span> <%= tanggal != null ? tanggal : "-" %></p>
            <p><span class="detail-label">Jam Tayang:</span> <%= jam != null ? jam : "-" %></p>
            <p><span class="detail-label">Nomor Kursi:</span> <%= kursi != null ? kursi : "-" %></p>
            <p><span class="detail-label">Jumlah Tiket:</span> <%= jumlah %></p>
            <p><span class="detail-label">Total Harga:</span> <%= totalFormatted %></p>
        </div>

        <div id="qrcode"></div>
        <div class="thank-you">Terima kasih sudah memesan! Selamat menonton 🎥💖</div>

        <button onclick="window.print()" class="btn-print">🖨 Cetak Tiket</button>
        <form action="dologout.jsp" method="post">
            <button class="btn btn-logout" type="submit">Logout</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/qrcodejs/qrcode.min.js"></script>
    <script>
        const tiketData = `
Nama: <%= nama != null ? nama : "-" %>
Film: <%= film != null ? film : "-" %>
Tanggal: <%= tanggal != null ? tanggal : "-" %>
Jam: <%= jam != null ? jam : "-" %>
Kursi: <%= kursi != null ? kursi : "-" %>
Jumlah: <%= jumlah %>
Total: <%= totalFormatted %>
`.trim();

        new QRCode(document.getElementById("qrcode"), {
            text: tiketData,
            width: 160,
            height: 160,
            colorDark : "#ff1493",
            colorLight : "#fff0f5",
            correctLevel : QRCode.CorrectLevel.H
        });
    </script>
</body>
</html>
