<%-- 
    Document   : form_pemesanan
    Created on : May 16, 2025, 1:38:52 PM
    Author     : Marsha Nabila L
--%>

<%-- 
    Document   : form_pemesanan
    Created on : May 16, 2025, 1:38:52 PM
    Author     : Marsha Nabila L
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Pemesanan Tiket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom right, #ffdde1, #fcb6c2);
            font-family: 'Comic Neue', cursive;
            padding: 30px;
        }
        .form-container {
            background-color: #fff0f5;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 10px 20px rgba(255, 105, 180, 0.2);
            max-width: 600px;
            margin: auto;
            border: 3px solid #ff69b4;
        }
        h1 {
            text-align: center;
            color: #ff1493;
            margin-bottom: 30px;
        }
        .form-label {
            color: #c2185b;
        }
        .btn-primary {
            background-color: #ff69b4;
            border: none;
        }
        .btn-primary:hover {
            background-color: #ff1493;
        }
    </style>
</head>
<body>

<%
    List<String[]> films = new ArrayList<>();
    films.add(new String[]{"Film Petualang Sherina", "10:00,13:00,16:00"});
    films.add(new String[]{"Film Home Sweet Loan", "11:00,14:00,17:00"});
    films.add(new String[]{"Film Gampang Cuan", "12:00,15:00,18:00"});

    String filmTerpilih = request.getParameter("judul");
    String hargaStr = request.getParameter("harga");

    int harga = 0;
    try {
        if (hargaStr != null && !hargaStr.isEmpty()) {
            harga = Integer.parseInt(hargaStr);
        }
    } catch (NumberFormatException e) {
        harga = 0;
    }

    String[] jamTayangList = new String[0];
    if (filmTerpilih != null) {
        for (String[] film : films) {
            if (film[0].equalsIgnoreCase(filmTerpilih)) {
                jamTayangList = film[1].split(",");
                break;
            }
        }
    }
%>

<div class="container">
    <div class="form-container">
        <h1>🎀 Form Pemesanan Tiket 🎬</h1>

        <form action="struk.jsp" method="post" class="needs-validation" novalidate>
            <!-- Nama -->
            <div class="mb-3">
                <label for="nama" class="form-label">Nama Pemesan</label>
                <input type="text" class="form-control" id="nama" name="nama" placeholder="Contoh: Nabila Cantik" required>
            </div>

            <!-- Jumlah Tiket -->
            <div class="mb-3">
                <label for="jumlah" class="form-label">Jumlah Tiket</label>
                <input type="number" class="form-control" id="jumlah" name="jumlah" min="1" required placeholder="Masukkan jumlah tiket">
                <div class="invalid-feedback">Masukkan jumlah tiket minimal 1.</div>
            </div>

            <!-- Film -->
            <div class="mb-3">
                <label for="film" class="form-label">Film</label>
                <input type="text" class="form-control" id="film" name="filmDisplay" value="<%= filmTerpilih != null ? filmTerpilih : "" %>" readonly required>
                <input type="hidden" name="film" value="<%= filmTerpilih != null ? filmTerpilih : "" %>">
            </div>

            <!-- Jam Tayang -->
            <div class="mb-3">
                <label for="jam" class="form-label">Jam Tayang</label>
                <select class="form-select" id="jam" name="jam" required>
                    <option value="" selected disabled>-- Pilih Jam Tayang --</option>
                    <% for (String jam : jamTayangList) { %>
                        <option value="<%= jam.trim() %>"><%= jam.trim() %></option>
                    <% } %>
                    <% if (jamTayangList.length == 0) { %>
                        <option disabled>Tidak ada jam tayang tersedia</option>
                    <% } %>
                </select>
                <div class="invalid-feedback">Pilih jam tayang.</div>
            </div>

            <!-- Hari -->
            <div class="mb-3">
                <label for="hari" class="form-label">Hari Menonton</label>
                <select class="form-select" id="hari" name="hari" required>
                    <option value="" selected disabled>-- Pilih Hari --</option>
                    <option value="Senin">Senin</option>
                    <option value="Selasa">Selasa</option>
                    <option value="Rabu">Rabu</option>
                    <option value="Kamis">Kamis</option>
                    <option value="Jumat">Jumat</option>
                    <option value="Sabtu">Sabtu</option>
                    <option value="Minggu">Minggu</option>
                </select>
                <div class="invalid-feedback">Pilih hari menonton.</div>
            </div>

            <!-- Tanggal -->
            <div class="mb-3">
                <label for="tanggal" class="form-label">Tanggal Menonton</label>
                <input type="date" class="form-control" id="tanggal" name="tanggal" required>
                <div class="invalid-feedback">Pilih tanggal menonton.</div>
            </div>

            <!-- Kursi -->
            <div class="mb-3">
                <label for="kursi" class="form-label">Nomor Kursi</label>
                <select class="form-select" id="kursi" name="kursi" required>
                    <option value="" selected disabled>-- Pilih Nomor Kursi --</option>
                    <option value="A1">A1</option>
                    <option value="A2">A2</option>
                    <option value="A3">A3</option>
                    <option value="B1">B1</option>
                    <option value="B2">B2</option>
                    <option value="B3">B3</option>
                    <option value="C1">C1</option>
                    <option value="C2">C2</option>
                    <option value="C3">C3</option>
                </select>
                <div class="invalid-feedback">Pilih kursi yang diinginkan.</div>
            </div>

            <!-- Metode Pembayaran -->
            <div class="mb-4">
                <label for="metodePembayaran" class="form-label">Metode Pembayaran</label>
                <select class="form-select" id="metodePembayaran" name="metode" required>
                    <option value="" selected disabled>-- Pilih Metode Pembayaran --</option>
                    <option value="Transfer Bank">🏦 Transfer Bank</option>
                    <option value="E-Wallet">📱 E-Wallet</option>
                    <option value="Kartu Kredit">💳 Kartu Kredit</option>
                    <option value="QRIS">📷 QRIS</option>
                </select>
                <div class="invalid-feedback">Pilih metode pembayaran.</div>
            </div>

            <!-- Harga -->
            <input type="hidden" name="harga" value="<%= harga %>"/>

            <!-- Tombol -->
            <button type="submit" class="btn btn-primary w-100">Pesan Sekarang 💖</button>
        </form>
    </div>
</div>

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


                