# SwiftPopMenu
效果图：  

 ![image](https://github.com/TangledHusky/SwiftPopMenu/blob/master/img2.png)
 ![image](https://github.com/TangledHusky/SwiftPopMenu/blob/master/img1.png)
 
  
  <pre name="code" class="html"></pre>
<p>
	&nbsp;导入项目：
</p>
<p>
	&nbsp;暂不支持pods导入，请下载文件，导入SwiftPopMenu.swift文件即可。 &nbsp;
</p>
&nbsp;代码现已支持 Swift3 语法&nbsp;&nbsp;&nbsp;&nbsp;
<p>
	&nbsp;使用介绍：
</p>
<p>
	&nbsp;1、初始化位置
</p>
<pre name="code" class="objc">        //frame 为整个popview相对整个屏幕的位置  箭头距离右边位置，默认15
        //popMenu =  SwiftPopMenu(frame: CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112))

        //frame 为整个popview相对整个屏幕的位置 arrowMargin ：指定箭头距离右边距离
        popMenu = SwiftPopMenu(frame:  CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112), arrowMargin: 12)

</pre>
<br />
&nbsp;&nbsp;<br />

<p>
	&nbsp;2、显示与移除
</p>
<p>
</p>
<p class="p1">
	<span class="s1">&nbsp;popMenu</span><span class="s2">.</span><span class="s1">show</span><span class="s2">()</span>
</p>
<p>
	&nbsp;popMenu.dismiss() &nbsp;
</p>
<p>
	<br />
	
</p>
&nbsp; &nbsp;<br />

<p>
	&nbsp;3、点击事件 &nbsp;，block回调处理
</p>
&nbsp;
<pre name="code" class="html"> //点击菜单
        popMenu.didSelectMenuBlock = { [weak self](index:Int)-&gt;Void in
            self?.popMenu.dismiss()
            print(&quot;block select \(index)&quot;)
            
        }</pre>
<br />

<p>
	<br />
	
</p>
<p>
	示例代码：
</p>
<p>
	<pre name="code" class="html"> var popMenu:SwiftPopMenu!

 popMenu = SwiftPopMenu(frame:  CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112), arrowMargin: 12)
        popMenu.popData = [(icon:&quot;saoyisao&quot;,title:&quot;扫一扫&quot;),
                           (icon:&quot;SignRule&quot;,title:&quot;签到规则&quot;)]
        //点击菜单
        popMenu.didSelectMenuBlock = { [weak self](index:Int)-&gt;Void in
            self?.popMenu.dismiss()
            print(&quot;block select \(index)&quot;)
            
        }
        popMenu.show()</pre>
	<br />
	<br />
	
</p>
<br />/>
