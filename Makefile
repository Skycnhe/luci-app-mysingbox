include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-mysingbox
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

# 依赖: luci基础, sing-box核心, curl下载, jq处理JSON, base64解码
define Package/luci-app-mysingbox
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=My SingBox Client (Custom)
  PKGARCH:=all
  DEPENDS:=+luci-base +sing-box +curl +jq +coreutils-base64
endef

define Package/luci-app-mysingbox/description
  A custom Sing-box client with auto-template configuration.
endef

define Build/Compile
endef

define Package/luci-app-mysingbox/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/share/mysingbox

	$(CP) ./luasrc/controller/* $(1)/usr/lib/lua/luci/controller/
	$(CP) ./luasrc/model/cbi/* $(1)/usr/lib/lua/luci/model/cbi/
	$(CP) ./root/* $(1)/
endef

$(eval $(call BuildPackage,luci-app-mysingbox))
