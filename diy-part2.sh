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
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate
# 设置密码为空
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings
# Install theme
git clone https://github.com/leshanydy2022/luci-theme-bootstrap-mod.git package/lean/luci-theme-bootstrap-mod
# Install app
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/lean/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
git clone https://github.com/leshanydy2022/luci-app-smartdns.git package/lean/luci-app-smartdns
git clone https://github.com/leshanydy2022/luci-app-adguardhome.git package/lean/luci-app-adguardhome
# Modify default theme（FROM luci-theme-bootstrap CHANGE TO luci-theme-bootstrap-mod）
sed -i 's/luci-theme-bootstrap/luci-theme-bootstrap-mod/g' ./feeds/luci/collections/luci/Makefile
# 为adguardhome插件更换最新的版本
rm -rf feeds/packages/net/adguardhome
git clone https://github.com/leshanydy2022/adguardhome.git feeds/packages/net/adguardhome
# 为smartDNS插件更换最新的版本
rm -rf feeds/packages/net/smartdns
#git clone https://github.com/pymumu/openwrt-smartdns.git feeds/packages/net/smartdns
git clone https://github.com/leshanydy2022/smartdns.git feeds/packages/net/smartdns
