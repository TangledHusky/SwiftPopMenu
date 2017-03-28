<p># SwiftPopMenu 效果图： ![image](https://github.com/TangledHusky/SwiftPopMenu/blob/master/swiftPopMenu.gif)</p>
<pre name="code" class="html"></pre>
<p>&nbsp;导入项目：</p>
<p>- pods导入：<code>pod 'SwiftPopMenu'</code></p>
<p>- 文件导入：下载Demo，导入SwiftPopMenu.swift文件即可</p>
<p>- 代码现已支持 Swift3 语法</p>
<p>&nbsp;使用介绍：</p>
<pre>import SwiftPopMenu</pre>
<p>&nbsp;</p>
<p>
	&nbsp;1、初始化位置
</p>
<pre name="code" class="objc">        //frame 为整个popview相对整个屏幕的位置  箭头距离右边位置，默认15
        //popMenu =  SwiftPopMenu(frame: CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112))

        //frame 为整个popview相对整个屏幕的位置 arrowMargin ：指定箭头距离右边距离
        popMenu = SwiftPopMenu(frame:  CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112), arrowMargin: 12)

</pre>
<p><br />
&nbsp;&nbsp;</p>
<pre name="code" class="html"></pre>
<pre name="code" class="html"> &nbsp; //／*  ----------  可变参数 - 注意：设置属性要写在设置 popData数据源 前面！！------------- *／
    
    //小箭头距离右边距离
    var arrowViewMargin : CGFloat = 15
    //圆角弧度
    var cornorRadius:CGFloat = 5
    
    //pop文字颜色
    var popTextColor:UIColor = UIColor(red: 107 / 255.0, green: 107 / 255.0, blue: 107 / 255.0, alpha: 1.0)
    //pop背景色
    var popMenuBgColor:UIColor = UIColor.white</pre>
<pre name="code" class="objc"> &nbsp;  //设置数据源 icon：图片名称 &nbsp;title：内容
 &nbsp;  popMenu.popData = [(icon:"saoyisao",title:"扫一扫"),
                       (icon:"SignRule",title:"签到规则")]      

</pre>
<p>&nbsp;2、显示与移除</p>
<p>&nbsp;</p>
<p class="p1"><span class="s1">&nbsp;popMenu</span><span class="s2">.</span><span class="s1">show</span><span class="s2">()</span></p>
<p>&nbsp;popMenu.dismiss() &nbsp;</p>
<p> <br />
	
</p>
<p>
&nbsp; &nbsp;</p>
<p>
	&nbsp;3、点击事件 &nbsp;，block回调处理
</p>
<p>
&nbsp;</p>
<pre name="code" class="html"> //点击菜单
        popMenu.didSelectMenuBlock = { [weak self](index:Int)-&gt;Void in
            self?.popMenu.dismiss()
            print("block select \(index)")
            
        }</pre>
<p>&nbsp;</p>
<p>
	<br />
	
</p>
<p>
	示例代码：
</p>
<p style="text-align: left;"> var popMenu:SwiftPopMenu!

 	popMenu = SwiftPopMenu(frame:  CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112), arrowMargin: 12)
        popMenu.popData = [(icon:"saoyisao",title:"扫一扫"),
                           (icon:"SignRule",title:"签到规则")]
        //点击菜单
        popMenu.didSelectMenuBlock = { [weak self](index:Int)-&gt;Void in
            self?.popMenu.dismiss()
            print("block select \(index)")
            
        }
        popMenu.show()</p>
<p><br />
	<br />
	
</p>
<p>
<br />
</p>
