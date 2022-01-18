#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# Config Generate
make defconfig
#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
uci batch <<-EOF
	del system.ntp
	set system.ntp=timeserver
        add_list system.ntp.server='0.asia.pool.ntp.org'
        add_list system.ntp.server='1.time.windows.com'
	set system.ntp.enabled=1
	set system.ntp.enable_server=1
	commit system
	
EOF

uci batch <<-EOF
	set firewall.@zone[1].input="ACCEPT"
	commit firewall
	EOF

	/etc/init.d/sysntpd start >/dev/null
	uci set luci.diag.dns="google.com.vn"
	uci set luci.diag.ping="google.com.vn"
	uci set luci.diag.route="google.com.vn"
	uci set network.wan.type="bridge"
	uci set dhcp.lan.start=100
	uci set dhcp.lan.limit=200
	uci set dhcp.lan.leasetime=1h
	uci commit dhcp

# Modify default IP
sed -i 's/192.168.1.1/172.16.1.1/g' package/base-files/files/bin/config_generate

sed -i '/DISTRIB_REVISION/d' /etc/openwrt_release
echo "DISTRIB_REVISION='OS'" >> /etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' /etc/openwrt_release
echo "DISTRIB_DESCRIPTION='Router'" >> /etc/openwrt_release

#sed -i "s/add_list system.ntp.server='time.windows.com'" package/base-files/files/bin/config_generate        
#sed -i "s/hostname='WiFi'/" package/base-files/files/bin/config_generate
#sed -i "s/timezone='UTC'/timezone='CST-7'/" package/base-files/files/bin/config_generate
#sed -i "/timezone='CST-7'/a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ set system.@system[-1].zonename='Asia/Ho Chi Minh'" package/base-files/files/bin/config_generate

# Modify default THEME
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile
# Modify default PASSWORD
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./$1$BtNu28UV$VAZEz4CDe1k7Dvar7Ftji0/g' ./package/lean/default-settings/files/zzz-default-settings
