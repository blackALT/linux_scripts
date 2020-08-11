#!/bin/bash -       
#title          :differential-backup.sh
#description    :Script for backup differential
#author		 	:blackALT
#date           :2019-09-30
#version        :1.0   
:<<'usage'
				Define the paths for backup at backup_folder array; 
				Define the storage at storage_folder;
				Create a folder to save logs at /var/log/backups;
				./differential-backup.sh
usage
#bash_version   :4.4.20(1)-release
#==============================================================================

# Var and Paths
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#PATH=/sbin:/usr/sbin:/bin:/usr/bin
log_start=`date +%d/%m/%Y-%H:%M:%S`
log_path=/var/log/backups/dif/`date +%Y-%m-%d`_log-backup-dif.txt
storage_folder=/data/backups/dif/backup-dif
user=`whoami`

# Folders Array

declare -A backup_folder=(
# Home folders
['/home/$user/Documents/']='Documents'
['/home/$user/OtherPath/']='OtherPath'

# LXC containers
['/var/lib/lxc/lxc1/']='lxc1'
['/var/lib/lxc/lxc2/']='lxc2'
)

func_backup_diff(){
	tam=${#backup_folder[@]}
	num=1

	while [ $num -le $tam ] 
		do
			for path in "${!backup_folder[@]}"; do
				folder="${backup_folder[$path]}"
				rsync -Cravzp $path $storage_folder-$folder-`date +%Y-%m-%d` >> $log_path
				num=`expr $num + 1`
			done
		done
}

# Log files
echo " " >> $log_path
echo " " >> $log_path
echo "|-----------------------------------------------" >> $log_path
echo " Backup diff started on $log_start" >> $log_path

# Backup Loop
func_backup_diff

# Log files
log_end=`date +%d/%m/%Y-%H:%M:%S`
echo " Backup diff finished in $log_end" >> $log_path
echo "|-----------------------------------------------" >> $log_path
echo " " >> $log_path
echo " " >> $log_path