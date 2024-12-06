#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
# sed -i 's/192.168.1.1/192.168.50.1/g' package/base-files/files/bin/config_generate

# 新版LUCI的ip修改地址
sed -i 's/192.168.1.1/192.168.50.1/g' package/base-files/luci2/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g'  openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
#rm openwrt/package/lean/luci-theme-argon -rf

#4 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt''  openwrt/package/lean/default-settings/files/zzz-default-settings

#5 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /lejitao build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g"  openwrt/package/lean/default-settings/files/zzz-default-settings

#增加helloworld
sed -i "/helloworld/d" "feeds.conf.default"
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
