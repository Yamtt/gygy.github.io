#!/usr/bin/haserl
<%
	# This program is copyright © 2008-2013 Eric Bishop and is distributed under the terms of the GNU GPL
	# version 2.0 with a special clarification/exception that permits adapting the program to
	# configure proprietary "back end" software provided that all modifications to the web interface
	# itself remain covered by the GPL.
	# See http://gargoyle-router.com/faq.html#qfoss for more information
	eval $( gargoyle_session_validator -c "$COOKIE_hash" -e "$COOKIE_exp" -a "$HTTP_USER_AGENT" -i "$REMOTE_ADDR" -r "login.sh" -t $(uci get gargoyle.global.session_timeout) -b "$COOKIE_browser_time"  )
	gargoyle_header_footer -h -s "system" -p "help" -c "internal.css" -j ""
%>

<fieldset>
        <legend class="sectionheader">密码及账户</legend>
        <p>本固件涉及的密码及账户，如下：</p>
        <div class="code">
                <p>1. 石像鬼和luci的root初始密码<a target="_blank" href="http://192.168.1.1/">password</a> </p>
                <p>2. 在线教程 <a target="_blank" href="http://gygy.github.io/">在线教程</a></p>
        </div>


</fieldset>

<fieldset>
        <legend class="sectionheader">第一次使用</legend>
        <p>一.刷机器</p>
        <div class="code">
                <p>1. 首先使用网线连接路由器的LAN口 和 PC的网口</p>
                <p>2. 路由器断电，用牙签或其他工具，捅路由器的reset口。</p>
                <p>3. 开启设备电源开关，观察电源灯（此时保持按住Restore Factory Settings按钮不要松手），直到电源灯由橙色闪烁状态变到绿色闪烁状态（说明设备已经进入到了TFTP修复模式）</p>
                <p>4. 在win下面使用DOS命令，即： tftp -i 192.168.1.1 put openwrt-ar71xx-nand-wndr3700v4-ubi-factory.img</p>
                <p>5. 在linux下面，同样也是使用tftp命令。</p>
                <p>6. 文件传送完毕后，等待80秒左右，设备会自动重启（请耐心等待，切勿将路由器手动断电）。至此，TFTP修复完成。</p>
                <p>7. 设备重启后，可手动断电，再重启。否则可能没有5G。这不是BUG，其他openwrt也是一样的</p>
                <p>8. 如果恢复过程中断或失败，重复上述步骤再做尝试。</p>
        </div>


        <p>二.第一次进入路由器</p>
        <div class="code">
                <p>1. 进入石像鬼的GUI界面，<a target="_blank" href="http://192.168.1.1">http://192.168.1.1</a></p>
                <p>2. 输入登陆帐号 <a style="color:blue" root</a>  密码 <a style="color:blue" password</a> </p>
                <p>3. 到 system 菜单中，点击 language 菜单，激活 中文。</p>
                <p>4. 在 连接 菜单中， 设置路由器的WAN口。 使其可以上网。测试及确认上网没有问题</p>
                <p>5. 进入LUCI的界面，设置翻墙<a target="_blank" href="http://192.168.1.1:8081">http://192.168.1.1:8081</a></p>
                <p>6. 设置ss之前，先拨号，看看上网是否正常。最好重启确认下。一旦没有问题，
                      可以直接 到luci面板--》ShadowSocks，仅仅修改里面的 服务器地址 服务器端口 本地端口 密码 加密方式。其他任何设置不要乱动。
                <p>7. 访问 LUCI界面 系统--快捷命令，在 快捷命令 处，挑选一种翻墙方式，点击 运行。运行成功后，会自动重启 </p>
                <p>8. 如果有异常，可以在石像鬼界面中，确认chinadns，shadowsocks，dnsmasq三个服务是否有运行</p>
                <p>从R36起，设置有两种翻墙方法。方法一和方法二，可以任意切换</p>
        </div>
        
         <p>三.特别注意事项</p>
        <div class="code">
                <p>1. 如果不考虑使用翻墙，请在 石像鬼的界面 停止 chinadns 及 shadowsocks、pdnsd 三个服务。 建议<a style="color:blue" 在石像鬼的GUI完成</a></p>
                <p>2. 如果不考虑使用去广告功能，请在 石像鬼的界面 停止 adbyby服务。 建议<a style="color:blue" 在石像鬼的GUI完成</a></p>
                <p>3. 如果访问amule，请在 石像鬼的界面 重新启动 amule服务。 再访问http://192.168.1.1:4711/</p>

        </div>

</fieldset>




<fieldset>
        <legend class="sectionheader">迅雷的使用方法及步骤</legend>
        <p>固件已集成迅雷接口，有两种方法，可以安装迅雷，方法一是 到 系统--快捷命令 点击“安装迅雷”进行自动安装。方法二是手工方法：可以按下列手工的方法，进行使用：</p>
        <div class="code">
                <p>1. 在固件下载目录中，下载xunlei.tar.gz文件 </p>
                <p>2. 将xunlei.tar.gz文件解压到 外置硬盘中。 或者将文件 放到 /usr/share 中。</p>
                <p>3. 访问luci 找到 迅雷 设置，设置迅雷的路径 为以上路径。</p>
                <p>4. 观察迅雷 luci界面，在启动信息处，是否能够取得激活码。</p>
                <p>5. 第4步如果没有效果，可以尝试，在第2步的迅雷路径中，执行  ./portal  可以取得迅雷的激活码。</p>
                <p>6. 访问 远程迅雷，进行绑定</p>
                <p>7. 不管是哪种方法，出现问题，都可以到 web远程迅雷 处 解除或删除设备。或删除配置文件 （cd /usr/share/xunlei && rm -rf cfg/）</p>

        </div>
</fieldset>

<fieldset>
        <legend class="sectionheader">增强无线信号方法</legend>
        <p>OP对无线信号速率支持不是太给力，默认一般是54M，可以按下列的方法，进行增强：</p>
        <div class="code">
                <p>1. 点击 系统 ----快捷命令 </p>
                <p>2. 运行 “增强无线设置”  </p>
        </div>
</fieldset>

<fieldset>
        <legend class="sectionheader">多拨设置方法</legend>
        <p>以按下列的方法，进行多拨一般设置：</p>
        <div class="code">
                <p>1. 点击 系统 ----快捷命令 </p>
                <p>2. 运行 “多拨设置”  </p>
        </div>
</fieldset>

<fieldset>
        <legend class="sectionheader">开启IPTV方法</legend>
        <p>以按下列的方法，进行开启IPTV：</p>
        <div class="code">
                <p>1. 点击 系统 ----快捷命令 </p>
                <p>2. 运行 “IPTV设置(lan4)”  </p>
                <p>3. 需要注意的是，一定要用 lan4口 接到 电视IPTV设备上面  </p>
        </div>
</fieldset>

<fieldset>
        <legend class="sectionheader">开启13信道方法</legend>
        <p>以按下列的方法，进行开启13信道：</p>
        <div class="code">
                <p>1. 点击 系统 ----快捷命令 </p>
                <p>2. 运行 “无线信道13(联网)”  </p>
                <p>3. 需要注意的是，一定要用联网  </p>
        </div>
</fieldset>

<fieldset>
        <legend class="sectionheader">百度云的使用方法</legend>
        <p>以按下列的方法，进行使用百度云：</p>
        <div class="code">
                <p>1. 点击 服务 ----百度云 </p>
                <p>2. 运行 绑定百度帐号  </p>
                <p>3. 根据提示，用界面出来的激活码，到百度上面进行激活(提示有链接的)  </p>
                <p>4. 大部分参数都可以保持默认。 只需要新增 同步的目录  </p>
                <p>5. 此外，日志文件，可以设置到外部的硬盘上面。  </p>
                <p>6. 设置完成后，可以到服务中启动服务 </p>
        </div>
</fieldset>

<fieldset>
        <legend class="sectionheader">FTP服务器设置步骤</legend>
        <p>固件已集成多虚拟用户FTP服务器，可以按下列的方法，进行使用：</p>
        <div class="code">
                <p>1. 进入 LUCI界面 </p>
                <p>2. 点击 服务--> FTP 服务器 ---> 常规设置  </p>
                <p>3. 点击 FTP 服务器--->虚拟用户 ，按提示新增一个虚拟用户</p>
                <p>4. 注意不同的虚拟用户，可以设置不同的目录。比如/mnt/sda2 </p>

        </div>
</fieldset>


<fieldset>
        <legend class="sectionheader">关于无法进入石像鬼GUI的解决方法</legend>
        <p>无法进入石像鬼GUI的解决方法，一般是用缓存引起的。可以清理浏览器的缓存再试试。如果不行，可以考虑如下方法：</p>
        <div class="code">
                <p>1. 首先进入 <a target="_blank" href="http://192.168.1.1/logout.sh">http://192.168.1.1/logout.sh</a> </p>
                <p>2. 然后进入 <a target="_blank" href="http://192.168.1.1/login.sh">http://192.168.1.1/login.sh</a></p>
                <p>3. 最后进入 <a target="_blank" href="http://192.168.1.1">http://192.168.1.1</a></p>

        </div>
</fieldset>

<fieldset>
        <legend class="sectionheader">怎么恢复出厂设置</legend>
        <p>下面是恢复出厂设置的方法</p>
        <div class="code">
                <p>1. 点击 系统 ----快捷命令 </p>
                <p>2. 恢复固件出厂设置 </p>

        </div>
</fieldset>

<fieldset>
        <legend class="sectionheader">网络不能滿速的处理方法</legend>
        <p>对于大宽带的用户，如果发现网络不能滿速，可按下面的方法进行排除：</p>
        <div class="code">
                <p>1. 关闭adbyby 服务 </p>
                <p>2. 关闭qos  </p>
                <p>3. 关闭upnp服务</p>
                <p>4. 无线速度的检查 </p>

        </div>
</fieldset>


<%
	gargoyle_header_footer -f -s "system" -p "help"
%>
