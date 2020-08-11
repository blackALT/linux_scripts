#!/bin/bash
user=`whoami`

declare -A local_=(
['/home/$user/Pictures']='Imagens'
)

move_images(){
	tam=${#local_[@]}
	num=1

	while [ $num -le $tam ] 
		do
			for path in "${!local_[@]}"; do
				cd $path ;
				if [ "`ls | wc -l`" == 0 ] ; then
					echo " " 
				else
				        mv *.* /path/to/move
				fi
			num=`expr $num + 1`
			done
		done
}

move_images