#!/bin/bash

NOME_ROBO="MATEUS"
RESPOSTAG=("obrigado" "valeu" "igualmente" "é a sua obrigação" "não está bom" "para quem" "to com fome" "to com sono" "não" "seu lindo(a)")

echo "Eu sou um robo chamado $NOME_ROBO"
echo

echo "Seja educado e me comprimente"
read SAUDACAO

if [ "$SAUDACAO" = "bom dia" ]
then
  echo ${RESPOSTAG[RANDOM%${#RESPOSTAG[@]}]}
  echo

elif [ "$SAUDACAO" = "boa tarde" ]
then
  echo ${RESPOSTAG[RANDOM%${#RESPOSTAG[@]}]}
  echo

elif [ "$SAUDACAO" = "boa noite" ]
then
  echo ${RESPOSTAG[RANDOM%${#RESPOSTAG[@]}]}
  echo

elif [ "${SAUDACAO}" != "bom dia" ] & [ "${SAUDACAO}" != "boa tarde" ] & [ "${SAUDACAO}" != "boa noite" ]
then
  echo "eu não aceito isso"
  echo
fi

echo "Quer me dizer mais alguma coisa?"
read COISA

if [ "$COISA" = "quer namorar comigo" ]
then
  echo "Eu sou feliz sendo as duas metades da minha laranja"
  echo
else
  echo "prefiro não comentar"
  echo
fi

echo "Se você deseja fazer uma atualização digitite atualizacao!"
read ATUALIZACAO

if [ "$ATUALIZACAO" = "atualizacao" ]
then
  sudo apt update
  sudo apt upgrade
else
  echo "ok"
fi

echo "Se deseja instalar alguma aplicação escreva o nome da aplicação"
read INSTALACAO

sudo apt install "$INSTALACAO"

echo "Deseja verificar o seu IP?"
read IP

if [ "$IP" = "sim" ]
then
  ip a
else
  echo "ok"
fi
echo "Deseja saber em qual diretório você está?"
read DIRETORIO

if [ "$DIRETORIO" = "sim" ]
then
  pwd
else
  echo "OK"
fi

echo "Deseja verificar os arquivos do seu diretório?"
read VERIFICAR

if [ "$VERIFICAR" = "sim" ]
then
  ls
else
  echo "OK"
fi

echo "Até a proxima seu lindo(a)"
