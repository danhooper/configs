## Myth Frontend Restart
`ln -s $(pwd)/mythfrontend.desktop ~/.config/autostart/`
`ln -s $(pwd)/mythrestart.sh ~/`

## Media Center Remote

- https://forum.mythtv.org/viewtopic.php?f=29&t=3729&start=30
- 

`sudo  mkdir -p /etc/rc_keymaps`
`sudo ln -s $(pwd)/rc6_mce.toml /etc/rc_keymaps/`
`ln -s $(pwd)/keyboards.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml`
`sudo cp ir-keytable-setup.service /etc/systemd/system/`
`sudo systemctl enable ir-keytable-setup`

Reboot

## Software
`sudo apt install ir-keytable`
