<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>REALM - Reset Password</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <style>
      body,
      html {
        height: 100%;
        margin: 0;
        font-family: Arial, sans-serif;
        font-size: 18px;
        background-color: #f0f2f5;
      }

      input {
        font-size: 18px!important;
      }

      .container {
        display: flex;
        flex-direction: column;
        height: auto;
        min-height: 100%;
      }

      .right {
        width: 100%;
        background-color: #172655;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 20vh;
      }

      .left {
        width: 100%;
        background-color: #f0f2f5;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        height: 80vh;
      }

      .reset-box {
        width: 80%;
        background: white;
        padding: 20px;
        border-radius: 8px;
        text-align: center;
      }

      .reset-box h2 {
        margin: 0;
        margin-bottom: 20px;
        font-weight: normal;
      }

      .reset-box input[type="email"],
      .reset-box input[type="text"] {
        width: calc(100% - 26px);
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0px 2px 7px 0px #d4d4d4;
      }

      .reset-box button {
        width: calc(100% - 26px);
        padding: 10px;
        background-color: #172655;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
      }

      .reset-box a {
        color: #172655;
        text-decoration: none;
      }

      .error-msg {
        color: #d32f2f;
        font-size: 13px;
        text-align: left;
        margin-top: 3px;
        top: -10px;
        position: relative;
      }

      button[disabled],
      button:disabled {
        background-color: #b0b8c9 !important;
        cursor: not-allowed !important;
        opacity: 0.7;
        box-shadow: none !important;
      }

      .footer {
        margin-top: 20px;
        font-size: 12px;
        color: #666;
      }

      .logo-circle {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .logo-circle img {
        width: 50%;
      }

      .language-switcher {
        position: absolute;
        top: 15px;
        right: 20px;
      }

      .lang-btn {
        background: none;
        border: none;
        color: white;
        font-weight: bold;
        margin-left: 10px;
        cursor: pointer;
        font-size: 14px;
        opacity: 0.8;
      }

      .lang-btn.active {
        text-decoration: underline;
        opacity: 1;
      }

      @media (min-width: 768px) {
        .reset-box {
          width: 50%;
          background: white;
          padding: 35px;
          border-radius: 8px;
          text-align: center;
        }
      }
    </style>
        <link rel="icon" type="image/x-icon" href="${url.resourcesPath}/img/favicon.ico" />
  </head>

  <body>
    <div class="container">
      <div class="right">
        <div class="logo-circle">
          <img src="${url.resourcesPath}/img/logo_rielda.png" alt="RIELDA Logo" />
        </div>
      </div>

      <div class="left">
        <div class="reset-box">
          <h2 id="reset-title">Recupera la tua password</h2>

          <form
            id="kc-reset-password-form"
            class="form"
            onsubmit="return validateForm(event)"
            action="${url.loginAction}"
            method="post"
          >
            <div class="input-container">
              <label for="username" id="label-email">Email *</label>
              <input
                id="username"
                class="login-field"
                type="email"
                name="username"
                tabindex="1"
                required
              />
              <small id="email-error" class="error-msg"></small>
            </div>

            <div class="input-container">
              <button
                type="submit"
                id="reset-button"
                class="btn-accedi"
                tabindex="2"
                disabled
              >
                Invia istruzioni
              </button>
            </div>
          </form>

          <div class="footer">
            <a href="${url.loginUrl}" id="back-to-login">Torna al login</a>
          </div>
        </div>
      </div>
    </div>

    <script>
      const emailInput = document.getElementById("username");
      const resetButton = document.getElementById("reset-button");
      const emailError = document.getElementById("email-error");
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

      const translations = {
        it: {
          title: "Recupera la tua password",
          email: "Email *",
          invalidEmail: "Inserisci un indirizzo email valido",
          button: "Invia istruzioni",
          back: "Torna al login",
        },
        en: {
          title: "Recover your password",
          email: "Email *",
          invalidEmail: "Please enter a valid email address",
          button: "Send instructions",
          back: "Back to login",
        },
      };

      let currentLang = "it";

      function setLanguage(lang) {
        currentLang = lang;
        localStorage.setItem("realm-lang", lang);

        document.getElementById("btn-it").classList.toggle("active", lang === "it");
        document.getElementById("btn-en").classList.toggle("active", lang === "en");

        const t = translations[lang];
        document.getElementById("reset-title").textContent = t.title;
        document.getElementById("label-email").textContent = t.email;
        document.getElementById("reset-button").textContent = t.button;
        document.getElementById("back-to-login").textContent = t.back;
        emailError.textContent = "";
      }

      window.addEventListener("DOMContentLoaded", () => {
        const saved = localStorage.getItem("realm-lang");
        if (saved && translations[saved]) {
          setLanguage(saved);
        } else {
          setLanguage(navigator.language.startsWith("it") ? "it" : "en");
        }
      });

      emailInput.addEventListener("input", () => {
        const t = translations[currentLang];
        if (!emailRegex.test(emailInput.value.trim())) {
          emailError.textContent = t.invalidEmail;
          emailInput.classList.add("invalid");
          resetButton.disabled = true;
        } else {
          emailError.textContent = "";
          emailInput.classList.remove("invalid");
          resetButton.disabled = false;
        }
      });

      function validateForm(event) {
        if (resetButton.disabled) {
          event.preventDefault();
          return false;
        }
        return true;
      }
    </script>
  </body>
</html>
