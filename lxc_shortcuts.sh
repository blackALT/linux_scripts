#!/bin/bash -       
#title          :lxc_shortcuts.sh
#description    :Shortcuts LXC apps
#author		 	:blackALT
#date           :2019-09-28
#version        :1.0   
#bash_version   :4.4.20(1)-release
#==============================================================================

user=`whoami`
main()
{
	clear
	echo "Atalhos LXC Desktop"
	echo "1 - Inserir a partir de lista" 
	echo "2 - Inserir manualmente"
	read op;
	case $op in
		1)
		conteiner_apps_bylist
	;;
		2)
		manual_conteiner_app
	;;
		*)
		echo "Opção inválida!"
esac
}

conteiner_apps_bylist(){

for i in `cat lxc`; do
	for u in `cat apps`; do
		cat <<EOF> /home/$user/.local/share/applications/menulibre"-"$u"-"$i.desktop 
		[Desktop Entry]
		Actions=
		Categories=menulibre-$i
		Comment=
		Exec=sudo /usr/local/bin-os/lxc-run $i $i $u
		Icon=gnome-panel-launcher
		Name=$i $u
		Terminal=false
		Type=Application
		Version=1.1
EOF
	echo "Atalho criado: Exec=sudo /usr/local/bin-os/lxc-run $i $i $u"
	done
done
}

manual_conteiner_app(){

while [ -z $lxc ]; do
	echo "Conteiner LXC: "
	read lxc;
done
while [ -z $app ]; do
	echo "Aplicação/programa: "
	read app;
done

if [ "$app" == "thunderbird" ]; then
	cat <<EOF> /home/$user/.local/share/applications/menulibre"-"$app"-"$lxc.desktop 
		[Desktop Entry]
		Actions=
		Categories=menulibre-$lxc
		Comment=$app $lxc
		Exec=sudo /usr/local/bin-os/lxc-run $lxc $lxc 'gpg-agent --daemon thunderbird'
		Icon=gnome-panel-launcher
		Name=$lxc $app
		Terminal=false
		Type=Application
		Version=1.1

EOF
	echo "Exec=sudo /usr/local/bin-os/lxc-run $lxc $lxc 'gpg-agent --daemon thunderbird'"
else
	cat <<EOF> /home/$user/.local/share/applications/menulibre"-"$app"-"$lxc.desktop
		[Desktop Entry]
		Actions=
		Categories=menulibre-$lxc
		Comment=$app $lxc
		Exec=sudo /usr/local/bin-os/lxc-run $lxc $lxc $app
		Icon=gnome-panel-launcher
		Name=$lxc $app
		Terminal=false
		Type=Application
		Version=1.1
EOF
	echo "Atalho criado: Exec=sudo /usr/local/bin-os/lxc-run $lxc $lxc $app"
fi
}
main
