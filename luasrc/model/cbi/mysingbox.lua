
m = Map("mysingbox", translate("My SingBox"), translate("自制 Sing-box 客户端，支持订阅自动转换"))

s = m:section(TypedSection, "global", translate("基本设置"))
s.anonymous = true

-- 1. 启用开关
o = s:option(Flag, "enabled", translate("启用插件"))
o.rmempty = false

-- 2. 订阅地址输入
o = s:option(Value, "sub_url", translate("订阅地址 (Subscription URL)"))
o.description = translate("输入机场的订阅链接 (HTTPS)")

-- 3. 模板选择 (这里只是示例，你可以放多个模板文件在目录里让脚本读取)
o = s:option(ListValue, "template", translate("配置模板"))
o:value("default", translate("默认分流模板"))
o:value("game", translate("游戏优先模板"))
o.default = "default"

-- 4. 运行状态显示
local running = luci.sys.call("pgrep -f 'sing-box run -c /var/etc/mysingbox/config.json' >/dev/null") == 0
st = s:option(DummyValue, "status", translate("运行状态"))
if running then
    st.rawhtml = true
    st.value = "<font color='green'><b>运行中 (Running)</b></font>"
else
    st.rawhtml = true
    st.value = "<font color='red'><b>未运行 (Stopped)</b></font>"
end

return m
