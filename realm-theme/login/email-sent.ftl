<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <title>Email inviata</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f2f5;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .box {
      background: white;
      padding: 30px;
      border-radius: 8px;
      max-width: 500px;
      text-align: center;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .box h2 {
      margin-bottom: 15px;
    }
    .box p {
      color: #555;
    }
    .box a {
      display: inline-block;
      margin-top: 20px;
      color: #172655;
      text-decoration: none;
      font-weight: bold;
    }
  </style>
</head>

<body>
  <div class="box">
    <h2>Email inviata</h2>

    <p>
      Se esiste un account associato all’indirizzo
      <strong>${userEmail!""}</strong>,
      ti abbiamo inviato una email con le istruzioni per reimpostare la password.
    </p>

    <p>
      Controlla la tua casella di posta (anche la cartella spam).
    </p>

    <a href="${url.loginUrl}">
      Torna al login
    </a>
  </div>
</body>
</html>
