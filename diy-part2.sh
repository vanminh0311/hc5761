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
# uci batch <<-EOF
#	set firewall.@zone[1].input="ACCEPT"
#	commit firewall
#	EOF

# Modify default IP
sed -i 's/192.168.1.1/172.16.1.1/g' package/base-files/files/bin/config_generate

#sed -i '/DISTRIB_REVISION/d' /etc/openwrt_release
#echo "DISTRIB_REVISION='OS'" >> /etc/openwrt_release
#sed -i '/DISTRIB_DESCRIPTION/d' /etc/openwrt_release
#echo "DISTRIB_DESCRIPTION='Router'" >> /etc/openwrt_release

#sed -i "s/add_list system.ntp.server='time.windows.com'" package/base-files/files/bin/config_generate        
#sed -i "s/hostname='WiFi'/" package/base-files/files/bin/config_generate
sed -i "/# REVISION:=/REVISION:=$date/" include/version.mk
sed -i "/DISTRIB_DESCRIPTION/c\DISTRIB_DESCRIPTION=\"%D %C Router'\"" package/base-files/files/etc/openwrt_release
#sed -i "s/timezone='UTC'/timezone='CST-7'/" package/base-files/files/bin/config_generate
sed -i "/timezone='CST-7'/a \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ set system.@system[-1].zonename='Asia/Ho Chi Minh'" package/base-files/files/bin/config_generate
