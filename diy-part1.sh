#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#git clone https://github.com/aliass532/luci-app-eqos package/eqos

##src-git packages https://git.lede-project.org/feed/packages.git
#src-git luci https://git.lede-project.org/project/luci.git
##src-git routing https://git.lede-project.org/feed/routing.git
##src-git telephony https://git.lede-project.org/feed/telephony.git
#src-git video https://github.com/openwrt/video.git
#src-git targets https://github.com/openwrt/targets.git
#src-git management https://github.com/openwrt-management/packages.git
#src-git oldpackages http://git.openwrt.org/packages.git
#src-link custom /usr/src/openwrt/custom-feed
#src-git luci https://github.com/wifimedia/luci-17.git;gateway
#src-git wifimedia https://github.com/wifimedia/lede_wifimedia.git;wr841v13
#src-git wifimedia https://github.com/wifimedia/lede_wifimedia.git;wr840v4
#src-git wifimedia https://github.com/wifimedia/lede_wifimedia.git;wr940v5
git clone wifimedia https://github.com/wifimedia/
git clone luci https://github.com/wifimedia/

#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
