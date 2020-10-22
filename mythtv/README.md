## Myth Frontend Restart
`ln -s $(pwd)/mythfrontend.desktop ~/.config/autostart/`
`ln -s $(pwd)/mythrestart.sh ~/`

## Media Center Remote
`sudo  mkdir -p /etc/rc_keymaps`
`sudo ln -s $(pwd)/rc6_mce /etc/rc_keymaps/`
`ln -s $(pwd)/keyboards.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml`

## Software
`sudo apt install ir-keytable`
