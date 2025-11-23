
module("luci.controller.mysingbox", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/mysingbox") then
		return
	end
	
	-- 在 "服务" 菜单下创建一个名为 "My SingBox" 的入口
	entry({"admin", "services", "mysingbox"}, cbi("mysingbox"), _("My SingBox"), 100).dependent = true
end
