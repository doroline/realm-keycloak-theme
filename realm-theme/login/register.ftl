<style>
    body, html {
        height: 100%;
        margin: 0;
        font-family: Arial, sans-serif;
    }
    .container {
        display: flex;
        height: 100%;
    }
    .left {
        width: 50%;
        background-color: #f0f2f5; /* Light grey background */
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .right {
        width: 50%;
        background-color: #172655; /* Blue background */
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .login-box {
        width: 50%;
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .login-box h2 {
        margin: 0;
        margin-bottom: 20px;
        font-weight: normal;
    }
    .form-row {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .form-row .form-group {
        flex: 0 0 48%;
        position: relative;
    }
    .toggle-password {
        position: relative;
        top: -71%;
        right: -212px;
        cursor: pointer;
        color: #172655;
        font-size: 11px;
    }
    label {
        display: block;
        text-align: left;
        padding-left: 10px;
    }
    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: calc(100% - 20px);
        margin: 5px 10px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

 .registrati:disabled {
    color:white!important;
    background-color: #a396c0!important;
    }
    .error-message {
         font-size: 12px;
        color: #ad1d1d;
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

                a {
                    color: #172655;
                }
            }   
</style>

<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "register-commons.ftl" as registerCommons>

<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        <#if messageHeader??>
            ${kcSanitize(msg("${messageHeader}"))?no_esc}
        <#else>
            ${msg("registerTitle")}
        </#if>
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName" class="pf-c-form__label pf-c-form__label-text">Nome *</label>
                    <input type="text" id="firstName" name="firstName" class="pf-c-form-control" aria-invalid="false" oninput="toggleSubmitButton()">
                </div>
                <div class="form-group">
                    <label for="lastName" class="pf-c-form__label pf-c-form__label-text">Cognome *</label>
                    <input type="text" id="lastName" name="lastName" class="pf-c-form-control" aria-invalid="false" oninput="toggleSubmitButton()">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="email" class="pf-c-form__label pf-c-form__label-text">Email *</label>
                    <input type="email" id="email" name="email" class="pf-c-form-control" aria-invalid="false" oninput="toggleSubmitButton()">
                    <span id="email-error" class="error-message"></span>
                </div>
                <div class="form-group">
                    <label for="phone" class="pf-c-form__label pf-c-form__label-text">Telefono</label>
                    <input type="text" id="phone" name="phone" class="pf-c-form-control" aria-invalid="false">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="password" class="pf-c-form__label pf-c-form__label-text">Password *</label>
                    <input type="password" id="password" name="password" class="pf-c-form-control" aria-invalid="false" oninput="toggleSubmitButton()">
                    <span class="toggle-password" onclick="togglePassword('password')">
                        <i class="fa fa-eye"></i> mostra
                    </span>
                </div>
                <div class="form-group">
                    <label for="password-confirm" class="pf-c-form__label pf-c-form__label-text">Conferma Password *</label>
                    <input type="password" id="password-confirm" name="password-confirm" class="pf-c-form-control" aria-invalid="false" oninput="toggleSubmitButton()">
                    <span class="toggle-password" onclick="togglePassword('password-confirm')">
                        <i class="fa fa-eye"></i> mostra
                    </span>
                    <span id="password-error" class="error-message"></span>
                </div>
            </div>
            <@registerCommons.termsAcceptance/>
              <div id="kc-form-options" class="${properties.kcFormOptionsClass!} container-accetto">
                                <div class="${properties.kcFormOptionsWrapperClass!}">
                                    <input type="checkbox" id="privacy" name="privacy" required onchange="toggleSubmitButton()">
                                    <span>Accetto <a href="https://www.rieldaserrature.com/it/home" target="_blank">Termini e condizioni</a></span>
                                </div>
            </div>
            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                <input id="register-button" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} registrati" type="submit" disabled value="Registrati"/>
            </div>
            <div id="kc-form-options" class="${properties.kcFormOptionsClass!} container-login">
                <div class="${properties.kcFormOptionsWrapperClass!}">
                    <span>Hai già un account? <a href="${url.loginUrl}">Accedi</a></span>
                </div>
            </div>
          
        </form>
      
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
        <script>
            function togglePassword(id) {
                const input = document.getElementById(id);
                const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
                input.setAttribute('type', type);
                const toggle = input.nextElementSibling;
                toggle.innerHTML = type === 'password' ? '<i class="fa fa-eye"></i> mostra' : '<i class="fa fa-eye-slash"></i> nascondi';
            }

            function toggleSubmitButton() {
                const fields = [
                    document.getElementById('firstName'),
                    document.getElementById('lastName'),
                    document.getElementById('email'),
                    document.getElementById('password'),
                    document.getElementById('password-confirm'),
                    document.getElementById('privacy')
                ];

                const allFilled = fields.slice(0, -1).every(field => field.value.trim() !== '');
                const privacyAccepted = fields[fields.length - 1].checked;

                const emailValid = validateEmail(document.getElementById('email').value);
                const passwordsMatch = document.getElementById('password').value === document.getElementById('password-confirm').value;

                const emailError = document.getElementById('email-error');
                const passwordError = document.getElementById('password-error');

                emailError.textContent = emailValid ? '' : 'Email non valida';
                passwordError.textContent = passwordsMatch ? '' : 'Le password non corrispondono';

                const submitButton = document.getElementById('register-button');
                submitButton.disabled = !(allFilled && privacyAccepted && emailValid && passwordsMatch);
            }

            function validateEmail(email) {
                const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return re.test(String(email).toLowerCase());
            }
        </script>
    </#if>
</@layout.registrationLayout>









