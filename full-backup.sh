#!/bin/bash -       
#title          :full-backup.sh
#description    :Script for backup full
#author		 	:blackALT
#date           :2019-09-30
#version        :1.0   
:<<'usage'
				Define the paths for backup at backup_folder array; 
				Define the storage at storage_folder;
				Create a folder to save logs at /var/log/backups;
				./full-backup.sh
usage
#bash_version   :4.4.20(1)-release
#==============================================================================

# Var and Paths
log_start=`date +%d/%m/%Y-%H:%M:%S`
log_end=`date +%d/%m/%Y-%H:%M:%S`
log_path=/var/log/backups/full/`date +%Y-%m-%d`_log-backup-full.txt
storage_folder=/data/backups/full/backup-full
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

func_backup_full(){
	tam=${#backup_folder[@]}
	num=1

	while [ $num -le $tam ] 
		do
			for path in "${!backup_folder[@]}"; do
				folder="${backup_folder[$path]}"
				tar cvzPf $storage_folder-$folder-`date +%Y-%m-%d`.tar.gz $path >> $log_path
				num=`expr $num + 1`
			done
		done
}

# Log files
echo " " >> $log_path
echo " " >> $log_path
echo "|-----------------------------------------------" >> $log_path
echo " Backup full started on $log_start" >> $log_path

# Backup function
func_backup_full

# Log files
echo " Backup full finished in $log_end" >> $log_path
echo "|-----------------------------------------------" >> $log_path
echo " " >> $log_path
echo " " >> $log_path

