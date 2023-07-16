SRV=192.168.1.207

OPTIONS="username=$USER,password=$(pass boxes/morpheus/pam/$USER),uid=$(id -u),gid=$(id -g)"

ping -c1 -w1 $SRV && stat ~/remote >/dev/null && stat ~/pictures >/dev/null && {
  sudo mount.cifs -o $OPTIONS //$SRV/$USER ~/remote/
  sudo mount.cifs -o $OPTIONS //$SRV/pictures ~/pictures/
}
