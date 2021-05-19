
*** Variables ***
${executable_path}    C:\\usr\\local\\bin\\chromedriver.exe
${browser}  chrome
${env}  dev
&{url}  dev=https://admin-mp.dev.sparescnx.com/   staging=1
&{username}  user1=sparesdeveloper@scnx.com  user2=binh@mission.plus
${password}  sparesdeveloper


${GLOBAL_RETRY_AMOUNT}    3x
${GLOBAL_RETRY_INTERVAL}    3s