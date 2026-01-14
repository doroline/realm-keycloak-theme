<#macro emailLayout>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body style="font-family: Poppins, Arial, sans-serif;">

<!-- Header -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td align="center" style="padding: 30px 0 50px;">
            <img src="https://rielda.apprendo.tech/sso/resources/hi768/login/realm-theme/img/logo_rielda.png" alt="Rielda logo" style="width: 200px;">
        </td>
    </tr>
    <tr>
        <td align="center" style="background-color: #f4f4f4; padding: 27px 0 27px;">
            <img src="https://sviluppo.aimawave.it/assets/media/email/busta-lettere-aima-email.gif" alt="Realm lettera" style="width: 75px;">
            <div style="font-size: 1.8rem; font-weight: 500; margin-top: 20px;">
                Richiesta cambio password
            </div>
        </td>
    </tr>
</table>

<!-- Content Section -->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding: 80px 20px 80px; margin-bottom: 50px;">
    <tr>
        <td style="font-size:1rem">
        Ciao <b style="text-decoration: none; color: #000">${user.username}</b>,<br /><br /><br />
            <#nested />
            <div style="margin-top: 60px; font-style: italic; font-size: 0.85rem;">
                Ti preghiamo di non rispondere a questa mail.
            </div>
        </td>
    </tr>
</table>

<!-- Footer -->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: #f4f4f4; height: 250px;">
    <tr>
        <td align="center" style="padding: 20px 0;">
            <img src="https://rielda.apprendo.tech/sso/resources/hi768/login/realm-theme/img/logo_rielda.png" alt="Rielda lettera" style="width: 30px;">
            <div style="color: #3a64ff; margin-top: 20px;">
                Hai ricevuto questa email perchè risulti essere un utente 
                <a href="https://aimawave.it" style="color: #3a64ff;" target="_blank">Realm</a>.
            </div>
            <div style="margin-top: 10px;">
                <a href="https://aimawave.it/condizioni-generali/" target="_blank" style="color: #000;">Termini e condizioni </a> |
                <a href="https://aimawave.it/privacy-policy/" target="_blank" style="color: #000;">Privacy Policy </a> |
                <a href="https://aimawave.it/" target="_blank" style="color: #000;">Sito Web</a>
            </div>
            <div style="color: #3a64ff; margin-top: 20px;">
                ©2026, REALM
            </div>
        </td>
    </tr>
</table>

</body>
</html>
</#macro>
