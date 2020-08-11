# Usual_scripts

## Daily help with ShellScript
##

```sh
# !/bin/bash
# description: Scripts for backup and automate some tasks
# author: blackALT
# date: 2019
# version: 1.0
```
### Run backup scripts

- Define paths for backup at backup_folder array; 

```sh
declare -A backup_folder=(
['/exact/path/to/folder']='folder'
['/exact/path/to/folder2']='folder2'
)
```
- Define the storage backup at storage_folder;
```console
blackALT@ruby:~$ mkdir /path/to/storage_folder
```

- Create a folder to save logs;

```console
blackALT@ruby:~$ mkdir /var/log/backups
```
- Run script

```console
blackALT@ruby:~$ sh backup.sh
```
