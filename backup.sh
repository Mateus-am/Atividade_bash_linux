#!/bin/bash

LOG_local="/var/log/backup.log"

function check_dir_log {
  if [ ! -s "/backup_dirs.conf" ]
  then
      echo "Crie uma lista com os diretórios que sofrerão o backup usando backup_dirs.conf"
      exit 1
  fi
} # Pede para o usuario especificar o aonde ele quer efetuar o backup

function check_backup_loc {
  if [ ! -s "/backup_loc.conf" ]
  then
    echo "especifique o local de backup no documento /backup_loc.conf"
    exit 1
  fi
} #Pede para o usario especificar aonde ele quer salvar o backup

function check_rotina {
  if [ ! -s "/etc/cron.weekly/backup" ]
  then
    sudo cp backup.sh /etc/cron.weekly/backup
    echo "A rotina do backup foi estabelecida para ser executada semanalmente"
  fi
} # cria uma rotina de backup

function faz_o_backup {
  CAMINHO_BKP=$(cat /backup_loc.conf)
  echo "começando o backup :)" > $LOG_local
  while read -r DIR_PATH
  do
    dir_name=$(basename "$DIR_PATH")
    filename=$CAMINHO_BKP$dir_name.tar.gz
    sudo tar -zvcf "$filename" "$DIR_PATH" 2>> $LOG_local
    sudo chown mateus:mateus "$filename"
    echo "backup do $dir_name completo" >> $LOG_local

  done < /backup_dirs.conf
  echo "backup concluido em:" >> $LOG_local
  date >> $LOG_local
} #efetua o backup propriamente dito

function email {

  # shellcheck disable=SC2264
  email -s $LOG_local teste@gmail.com #coloque o email para qual deseja mandar o arquivo
}

function check_numbers {
  ls -1 "/backup_loc.conf" | sort -r | tail -n +7 | xargs rm > /dev/null 2>&1
}



check_dir_log
check_backup_loc
check_rotina
check_numbers
faz_o_backup
email
