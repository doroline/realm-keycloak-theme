<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}"
      <#if realm.internationalizationEnabled> lang="${locale.currentLanguageTag}" dir="${(locale.rtl)?then('rtl','ltr')}"</#if>>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="robots" content="noindex, nofollow">

  <#if properties.meta?has_content>
    <#list properties.meta?split(' ') as meta>
      <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
    </#list>
  </#if>

  <title>${msg("loginTitle",(realm.displayName!''))}</title>
  <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />

  <#-- Carica CSS/JS Keycloak se li hai in theme.properties -->
  <#if properties.stylesCommon?has_content>
    <#list properties.stylesCommon?split(' ') as style>
      <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
    </#list>
  </#if>
  <#if properties.styles?has_content>
    <#list properties.styles?split(' ') as style>
      <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
    </#list>
  </#if>
  <#if properties.scripts?has_content>
    <#list properties.scripts?split(' ') as script>
      <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
    </#list>
  </#if>

  <script type="importmap">
    {
      "imports": {
        "rfc4648": "${url.resourcesCommonPath}/node_modules/rfc4648/lib/rfc4648.js"
      }
    }
  </script>

  <script src="${url.resourcesPath}/js/menu-button-links.js" type="module"></script>

  <#if scripts??>
    <#list scripts as script>
      <script src="${script}" type="text/javascript"></script>
    </#list>
  </#if>

  <script type="module">
    import { checkCookiesAndSetTimer } from "${url.resourcesPath}/js/authChecker.js";
    checkCookiesAndSetTimer("${url.ssoLoginInOtherTabsUrl?no_esc}");
  </script>

  <style>
    /* --- Reset minimale per non far “vincere” PatternFly sul tuo layout --- */
    html, body {
      height: 100%;
      margin: 0;
      font-family: Arial, sans-serif;
      background: #f0f2f5;
    }

    /* Spegne l’header Keycloak legacy se presente */
    #kc-header { display: none !important; }

    .realm-container {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      background: white!important;
    }

    .realm-header {
      height: 20vh;
      min-height: 120px;
      background-color: #172655;
      display: flex;
      align-items: center;
      justify-content: center;
    }

     .logo-circle {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .logo-circle img {
            width: 50%;
        }

    .realm-content {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 24px 12px;
    }

    .realm-card {
      width: 90%;
      max-width: 720px;
      background: #fff;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 0 10px rgba(0,0,0,0.08);
    }

    /* Messaggi Keycloak */
    .kc-alert {
      margin-bottom: 16px;
      padding: 12px 14px;
      border-radius: 8px;
      font-size: 14px;
    }
    .kc-alert.kc-error { background: #fdecea; color: #b42318; }
    .kc-alert.kc-success { background: #ecfdf3; color: #027a48; }
    .kc-alert.kc-info { background: #eff8ff; color: #175cd3; }
    .kc-alert.kc-warning { background: #fffaeb; color: #b54708; }

    /* Locale dropdown: lo lasciamo, ma lo rendiamo “neutro” */
    .realm-locale {
      display: flex;
      justify-content: flex-end;
      margin-bottom: 10px;
    }

    .realm-footer-links {
      margin-top: 26px;
      font-size: 12px;
      color: #172655;
      text-align: center;
    }
    .realm-footer-links a {
      color: #172655;
      text-decoration: none;
    }
  </style>
      <link rel="icon" type="image/x-icon" href="${url.resourcesPath}/img/favicon.ico" />
</head>

<body class="${properties.kcBodyClass!}">
  <div class="realm-container">

    <div class="realm-header">
       <div class="logo-circle">
                <img src="${url.resourcesPath}/img/logo_rielda.png" alt="RIELDA Logo">
            </div>
    </div>

    <div class="realm-content">
      <div class="realm-card">

        <#-- Locale (se abilitato) -->
        <#if realm.internationalizationEnabled && locale.supported?size gt 1>
          <div class="realm-locale" id="kc-locale">
            <div id="kc-locale-wrapper">
              <div id="kc-locale-dropdown" class="menu-button-links">
                <button tabindex="1"
                        id="kc-current-locale-link"
                        aria-label="${msg("languages")}"
                        aria-haspopup="true"
                        aria-expanded="false"
                        aria-controls="language-switch1">${locale.current}</button>

                <ul role="menu"
                    tabindex="-1"
                    aria-labelledby="kc-current-locale-link"
                    id="language-switch1">
                  <#assign i = 1>
                  <#list locale.supported as l>
                    <li role="none">
                      <a role="menuitem"
                         id="language-${i}"
                         href="${l.url}">${l.label}</a>
                    </li>
                    <#assign i++>
                  </#list>
                </ul>
              </div>
            </div>
          </div>
        </#if>

        <#-- Messaggio Keycloak -->
     <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                  <div class="pf-c-alert__icon">
                      <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                      <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                      <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                      <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  </div>
                      <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
              </div>
          </#if>

        <#-- Qui dentro ogni pagina (login, reset, register...) mette il suo form -->
        <#nested "form">

        <#-- Social providers / Info se usati -->
        <#nested "socialProviders">
        <#if displayInfo>
          <div id="kc-info">
            <#nested "info">
          </div>
        </#if>

      </div>

      <div class="realm-footer-links">
        <a href="https://www.rieldaserrature.com/it/contatti" target="_blank">Contatti</a> |
        <a href="https://www.rieldaserrature.com/it/azienda" target="_blank">About Us</a>
      </div>
    </div>

  </div>
</body>
</html>
</#macro>
