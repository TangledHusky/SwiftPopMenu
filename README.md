<p># SwiftPopMenu 效果图：</p>
![image](https://github.com/TangledHusky/SwiftPopMenu/blob/master/swiftPopMenu.gif)
<pre name="code" class="html"></pre>
<p>&nbsp;导入项目：</p>
<p>- pods导入：<code>pod 'SwiftPopMenu'</code></p>
<p>- 文件导入：下载Demo，导入SwiftPopMenu.swift文件即可</p>
<p>- 代码现已支持 Swift3 语法</p>
<p>&nbsp;使用介绍：</p>
<pre>import SwiftPopMenu</pre>
<p>&nbsp;</p>
<p>
	&nbsp;1、初始化位置    </p>
<div class="cnblogs_code">
<pre><span style="color: #008000;">    //</span><span style="color: #008000;">frame 为整个popview相对整个屏幕的位置  箭头距离右边位置，默认15
    </span><span style="color: #008000;">//</span><span style="color: #008000;">popMenu =  SwiftPopMenu(frame: CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112))

    </span><span style="color: #008000;">//</span><span style="color: #008000;">frame 为整个popview相对整个屏幕的位置 arrowMargin ：指定箭头距离右边距离</span>
    popMenu = SwiftPopMenu(frame:  CGRect(x: KSCREEN_WIDTH - <span style="color: #800080;">155</span>, y: <span style="color: #800080;">51</span>, width: <span style="color: #800080;">150</span>, height: <span style="color: #800080;">112</span>), arrowMargin: <span style="color: #800080;">12</span><span style="color: #000000;">)
    ／</span>*  ----------  可变参数 - 注意：设置属性要写在设置 popData数据源 前面！！------------- *<span style="color: #000000;">／
    
    </span><span style="color: #008000;">//</span><span style="color: #008000;">小箭头距离右边距离</span>
    <span style="color: #0000ff;">var</span> arrowViewMargin : CGFloat = <span style="color: #800080;">15</span>
    <span style="color: #008000;">//</span><span style="color: #008000;">圆角弧度</span>
    <span style="color: #0000ff;">var</span> cornorRadius:CGFloat = <span style="color: #800080;">5</span>
    
    <span style="color: #008000;">//</span><span style="color: #008000;">pop文字颜色</span>
    <span style="color: #0000ff;">var</span> popTextColor:UIColor = UIColor(red: <span style="color: #800080;">107</span> / <span style="color: #800080;">255.0</span>, green: <span style="color: #800080;">107</span> / <span style="color: #800080;">255.0</span>, blue: <span style="color: #800080;">107</span> / <span style="color: #800080;">255.0</span>, alpha: <span style="color: #800080;">1.0</span><span style="color: #000000;">)
    </span><span style="color: #008000;">//</span><span style="color: #008000;">pop背景色</span>
    <span style="color: #0000ff;">var</span> popMenuBgColor:UIColor =<span style="color: #000000;"> UIColor.white
    </span><span style="color: #008000;">//</span><span style="color: #008000;">设置数据源 icon：图片名称  title：内容</span>
    popMenu.popData = [(icon:<span style="color: #800000;">"</span><span style="color: #800000;">saoyisao</span><span style="color: #800000;">"</span>,title:<span style="color: #800000;">"</span><span style="color: #800000;">扫一扫</span><span style="color: #800000;">"</span><span style="color: #000000;">),
                       (icon:</span><span style="color: #800000;">"</span><span style="color: #800000;">SignRule</span><span style="color: #800000;">"</span>,title:<span style="color: #800000;">"</span><span style="color: #800000;">签到规则</span><span style="color: #800000;">"</span>)]   </pre>
</div>
<p>&nbsp;</p>
<pre name="code" class="objc">
</pre>
<p>&nbsp;2、显示与移除</p>
<div class="cnblogs_code">
<pre><span style="color: #000000;"> popMenu.show()

 popMenu.dismiss()  </span></pre>
</div>
<p>&nbsp;</p>
<p>
	&nbsp;3、点击事件 &nbsp;，block回调处理
</p>
<p>&nbsp;&nbsp;//点击菜单</p>
<div class="cnblogs_code">
<pre>popMenu.didSelectMenuBlock = { [weak self](index:Int)-&gt;Void <span style="color: #0000ff;">in</span><span style="color: #000000;">

       self</span>?<span style="color: #000000;">.popMenu.dismiss()
       print(</span><span style="color: #800000;">"</span><span style="color: #800000;">block select \(index)</span><span style="color: #800000;">"</span><span style="color: #000000;">)
            
 }</span></pre>
</div>
<p>&nbsp;</p>
<p>
	示例代码：</p>
<div class="cnblogs_code">
<pre> <span style="color: #0000ff;">var</span> popMenu:SwiftPopMenu!<span style="color: #000000;">

 popMenu </span>= SwiftPopMenu(frame:  CGRect(x: KSCREEN_WIDTH - <span style="color: #800080;">155</span>, y: <span style="color: #800080;">51</span>, width: <span style="color: #800080;">150</span>, height: <span style="color: #800080;">112</span>), arrowMargin: <span style="color: #800080;">12</span><span style="color: #000000;">)
 popMenu.popData </span>= [(icon:<span style="color: #800000;">"</span><span style="color: #800000;">saoyisao</span><span style="color: #800000;">"</span>,title:<span style="color: #800000;">"</span><span style="color: #800000;">扫一扫</span><span style="color: #800000;">"</span><span style="color: #000000;">),
                           (icon:</span><span style="color: #800000;">"</span><span style="color: #800000;">SignRule</span><span style="color: #800000;">"</span>,title:<span style="color: #800000;">"</span><span style="color: #800000;">签到规则</span><span style="color: #800000;">"</span><span style="color: #000000;">)]
 </span><span style="color: #008000;">//</span><span style="color: #008000;">点击菜单</span>
 popMenu.didSelectMenuBlock = { [weak self](index:Int)-&gt;Void <span style="color: #0000ff;">in</span><span style="color: #000000;">
            self</span>?<span style="color: #000000;">.popMenu.dismiss()
            print(</span><span style="color: #800000;">"</span><span style="color: #800000;">block select \(index)</span><span style="color: #800000;">"</span><span style="color: #000000;">)
            
 }
 popMenu.show()</span></pre>
</div>
<p>&nbsp;</p>
<p><br />
	<br />
	
</p>
<p>
<br />
</p>
