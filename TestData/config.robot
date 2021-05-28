
*** Variables ***
${executable_path}    C:\\usr\\local\\bin\\chromedriver.exe
${browser}  chrome
${env}  dev
&{url}  dev=https://admin.dev.sparescnx.com/   admin-mp=https://admin-mp.dev.sparescnx.com/
&{username}  user1=remote+admin@scnx.com    user2=sparesdeveloper@scnx.com
${password}  spares@externalresource    #sparesdeveloper


${GLOBAL_RETRY_AMOUNT}    3x
${GLOBAL_RETRY_INTERVAL}    3s