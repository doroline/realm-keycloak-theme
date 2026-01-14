<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>REALM Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body, html {
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
            height: 100%;
             flex-direction: column;
    height: auto;
    min-height: 100%;
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
        .right {
            width: 100%;
            background-color: #172655;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 20vh;
        }
        .login-box {
            width: 80%;
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }
        .login-box h2 {
            margin: 0;
            margin-bottom: 20px;
            font-weight: normal;
        }
        .login-box input[type="email"],
        .login-box input[type="password"],
        .login-box input[type="text"] {
            width: calc(100% - 26px);
            padding: 10px;
            margin: 10px 0;
            border: 0px solid #ddd;
            border-radius: 5px;
            box-shadow: 0px 2px 7px 0px #d4d4d4;
        }
        .login-field {
            width: calc(100% - 26px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .login-box button {
            width: calc(100% - 26px);
            padding: 10px;
            background-color: #172655;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }
        .login-box a {
            color: #172655;
            text-decoration: none;
        }
        .logo-circle {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .logo-circle img {
            width: 50%;
        }
        .input-container {
            position: relative;
            width: 100%;
            margin: 10px 0;
            display: flex;
            flex-direction: column;
        }
        .input-container input {
            width: calc(100% - 26px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
        }
        .input-container .visibility {
            position: absolute;
            top: 25%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #172655;
            font-size: 12px;
        }
        .input-container .visibility i {
            margin-left: 5px;
        }
        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #666;
        }
        .link-registry {
            color: #666;
        }
        .forgot-password {
            margin-top: 10px;
        }
        label {
            display: block;
            text-align: left;
            top: 6px;
            position: relative;
        }
        .link-footer {
            color: #bcbcbc !important;
            cursor: pointer;
        }
        .contatti {
            position: absolute;
            bottom: 51px;
            font-size: 12px;
            color: #172655;
        }
        .contatti a {
            color: #172655;
        }
        .error-msg {
            color: #d32f2f;
            font-size: 13px;
            text-align: left;
            margin-top: 3px;
            top: -10px;
            position: relative;
        }

        .kc-alert {
            width: calc(100% - 26px);
            margin: 10px auto 20px;
            padding: 10px 12px;
            border-radius: 5px;
            font-size: 14px;
            text-align: left;
        }

        .kc-alert.success {
            background-color: #e6f4ea;
            color: #1e4620;
            border: 1px solid #b7e1c1;
        }

        .kc-alert.info {
            background-color: #e8f0fe;
            color: #1a3e8a;
            border: 1px solid #c6dafc;
        }

        .kc-alert.warning {
            background-color: #fff4e5;
            color: #663c00;
            border: 1px solid #ffd59e;
        }

        .kc-alert.error {
            background-color: #fdecea;
            color: #611a15;
            border: 1px solid #f5c6cb;
        }

        .login-field.invalid {
            border: 1px solid #d32f2f !important;
            box-shadow: 0 0 5px rgba(211, 47, 47, 0.3);
        }

        button[disabled],
            button:disabled {
            background-color: #b0b8c9 !important;  /* grigio-blu disattivato */
            cursor: not-allowed !important;
            opacity: 0.7;
            box-shadow: none !important;
            }

            button[disabled]:hover {
            background-color: #b0b8c9 !important;
}


        /* ------------------------------- */
/* DESKTOP VERSION (>768px)        */
/* ------------------------------- */

@media (min-width: 768px) {
            .login-box {
            width: 50%;
            background: white;
            padding: 35px;
            border-radius: 8px;
            text-align: center;
        }
}
    </style>
</head>
<body>
    <div class="container">
        <div class="right">
            <div class="logo-circle">
                <img src="${url.resourcesPath}/img/logo_rielda.png" alt="RIELDA Logo">
            </div>
        </div>
        <div class="left">
                <div class="login-box">
                    <h2>Benvenuto su <strong>REALM</strong></h2>
                    <#if message?has_content>
                        <div class="kc-alert ${message.type}">
                            ${kcSanitize(message.summary)?no_esc}
                        </div>
                    </#if>
                        <form
                        id="kc-form-login"
                        class="form"
                        onsubmit="return validateForm(event)"
                        action="${url.loginAction}"
                        method="post"
                        >
                        <div class="input-container">
                            <label for="username">Email *</label>
                            <input id="username" class="login-field" type="text" name="username" tabindex="1" required />
                            <small id="email-error" class="error-msg"></small>
                        </div>

                        <div class="input-container">
                            <label for="password">Password *</label>
                            <input
                            id="password"
                            class="login-field"
                            type="password"
                            name="password"
                            tabindex="2"
                            required
                            />
                            <span class="visibility" onclick="togglePassword('password')">
                            <i class="fa fa-eye"></i> mostra
                            </span>
                            <small id="password-error" class="error-msg"></small>
                        </div>

                        <div class="input-container">
                            <button
                            type="submit"
                            id="login-button"
                            class="btn-accedi"
                            tabindex="3"
                            disabled
                            >
                            Accedi
                            </button>
                        </div>

                        <#if realm.resetPasswordAllowed>
                            <div class="forgot-password">
                            <a href="${url.loginResetCredentialsUrl}">${msg("Password dimenticata?")}</a>
                            </div>
                        </#if>
                        </form>

                    <div class="footer">
                        <p>
                            <a href="https://www.rieldaserrature.com/it/home" target="_blank" class="link-footer">Condizioni generali d'uso</a> | 
                            <a href="https://www.rieldaserrature.com/it/cookie" target="_blank" class="link-footer">Policy Antispam</a><br>
                            <a href="https://www.rieldaserrature.com/it/cookie" target="_blank" class="link-footer">Informativa Privacy</a> | 
                            <a href="https://www.rieldaserrature.com/it/cookie" target="_blank" class="link-footer">Utilizzo dei cookies</a><br>
                        </p>
                    </div>
                    
                </div>
                <div class="contatti">
                                <a href="https://www.rieldaserrature.com/it/contatti" target="_blank">Contatti</a> | 
                                <a href="https://www.rieldaserrature.com/it/azienda" target="_blank">About Us</a>
                            </div>
                </div>
    
    </div>
<script>
  const emailInput = document.getElementById('username');
  const passwordInput = document.getElementById('password');
  const loginButton = document.getElementById('login-button');
  const emailError = document.getElementById('email-error');
  const passwordError = document.getElementById('password-error');

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  function validateInputs() {
    if (window.location.href.includes("/realms/master")) {
  loginButton.disabled = false;
  return;
}
    let valid = true;

    // Email validation
    if (!emailRegex.test(emailInput.value.trim())) {
      emailError.textContent = 'Inserisci un indirizzo email valido';
      emailInput.classList.add('invalid');
      valid = false;
    } else {
      emailError.textContent = '';
      emailInput.classList.remove('invalid');
    }

    // Password validation
    if (passwordInput.value.trim().length < 3) {
      passwordError.textContent = 'La password deve contenere almeno 5 caratteri';
      passwordInput.classList.add('invalid');
      valid = false;
    } else {
      passwordError.textContent = '';
      passwordInput.classList.remove('invalid');
    }

    loginButton.disabled = !valid;
  }

  emailInput.addEventListener('input', validateInputs);
  passwordInput.addEventListener('input', validateInputs);

  function togglePassword(id) {
    const input = document.getElementById(id);
    const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
    input.setAttribute('type', type);
    const toggle = input.nextElementSibling;
    toggle.innerHTML =
      type === 'password'
        ? '<i class="fa fa-eye"></i> mostra'
        : '<i class="fa fa-eye-slash"></i> nascondi';
  }

  function validateForm(event) {
    validateInputs();
    if (loginButton.disabled) {
      event.preventDefault();
      return false;
    }
    return true;
  }

// Disattiva validazione email se siamo nel realm master
window.addEventListener("DOMContentLoaded", () => {
  if (window.location.href.includes("/realms/master")) {
    const emailInput = document.getElementById("username");
    const loginButton = document.getElementById("login-button");
    const emailError = document.getElementById("email-error");

    if (emailInput && loginButton) {
      emailInput.setAttribute("type", "text");
      emailInput.value = "admin";
      emailInput.classList.remove("invalid");
      emailError.textContent = "";
      loginButton.disabled = false;
    }
  }
});

</script>

</body>
</html>
