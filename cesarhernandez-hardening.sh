# Autor: Cesar Hernandez Obispo
#
if (hostnamectl | grep "Operating System: CentOS" > /dev/null)
then
    hostnamectl | grep "Operating System: CentOS"

    if (yum list installed | grep clamav > /dev/null);
    then
        echo "#####################################"
        echo "#   Desinstalando antivirus Clamav  #"
        echo "#####################################"
        killall clamav 2>/dev/null
        sudo rpm -e clamav
    fi
    echo "###################################"
    echo "#   Instalando antivirus Clamav   #"
    echo "###################################"
    wget https://github.com/CesarHernandezObispo/ExamenSSO-CesarHdz/raw/main/clamav-0.104.1.linux.x86_64.rpm
    rpm -Uvh clamav-0.104.1.linux.x86_64.rpm

    if !(yum list installed | grep epel);
    then
        echo "####################################"
        echo "#   Instalando repositorios EPEL   #"
        echo "####################################"
        yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    fi
    echo "####################################"
    echo "#   Instalando actualizaciones     #"
    echo "####################################"
    yum update -y
fi


if (hostnamectl | grep "Operating System: Ubuntu" > /dev/null);
then
    hostnamectl | grep "Operating System: Ubuntu"
    if (apt list --installed clamav -a | sed -e "1d" | grep "clamav");
    then
        echo "#####################################"
        echo "#   Desinstalando antivirus Clamav  #"
        echo "#####################################"
        killall clamav 2>/dev/null
        dpkg -r clamav
    fi
    echo "###################################"
    echo "#   Instalando antivirus Clamav   #"
    echo "###################################"
    wget https://github.com/CesarHernandezObispo/ExamenSSO-CesarHdz/raw/main/clamav-0.104.1.linux.x86_64.deb
    dpkg -i clamav-0.104.1.linux.x86_64.deb
    echo "#####################################"
    echo "#   Actualizando paquetes           #"
    echo "#####################################"
    apt-get update && apt-get -y upgrade
fi