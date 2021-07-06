
*** Variables ***
${executable_path}    C:\\usr\\local\\bin\\chromedriver.exe
${browser}  chrome
&{url}  dev=https://admin.dev.sparescnx.com/   mp=https://admin-mp.dev.sparescnx.com/
&{username}  devUser=remote+admin@scnx.com    mpUser=sparesdeveloper@scnx.com
&{password}  devpd= spares@externalresource    mppd=sparesdeveloper
@{validDomain}  es-sea.com        eaglestar.com.my      sparescnx.com

${GLOBAL_RETRY_AMOUNT}    3x
${GLOBAL_RETRY_INTERVAL}    3s