# Descrição
Projeto desenvolvido em conjunto com turma de ADS da USF do 4 período.

# Autores
Professor José Matias Lemes Filho e Turma ADS2021-2 Semestre.

# Pré-requisitos e como rodar a aplicação/testes

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
- Flutter [flutter doctor -v]
- IDE [Android Studio, XCode e VS Code] e algum emulado ou celular 
- GitHub [git --version]
- Figma
- Trello

# How to debug using wifi (Android)

Put PC or Mac and device at the same hotspot
Connect using cable
Run: adb tcpip 5656
Disconnect the cable
Run: adb connect [device_ip_address]:5656
To check connection, run: adb devices
Sources:
For Android <=10: https://developer.android.com/studio/command-line/adb?hl=pt-br#wireless
For Android 11: https://developer.android.com/studio/c