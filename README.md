# SwiftPopMenu 效果图：

![image](https://github.com/TangledHusky/SwiftPopMenu/blob/master/swiftPopMenu.gif)

 导入项目：

- pods导入：pod 'SwiftPopMenu'

- 文件导入：下载Demo，导入SwiftPopMenu.swift文件即可

- 代码现已支持 Swift3 语法

 使用介绍：

import SwiftPopMenu


 1、初始化位置

    //frame 为整个popview相对整个屏幕的位置  箭头距离右边位置，默认15
    //popMenu =  SwiftPopMenu(frame: CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112))

    //frame 为整个popview相对整个屏幕的位置 arrowMargin ：指定箭头距离右边距离
    popMenu = SwiftPopMenu(frame:  CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112), arrowMargin: 12)
    ／*  ----------  可变参数 - 注意：设置属性要写在设置 popData数据源 前面！！------------- *／
    
    //小箭头距离右边距离
    var arrowViewMargin : CGFloat = 15
    //圆角弧度
    var cornorRadius:CGFloat = 5
    
    //pop文字颜色
    var popTextColor:UIColor = UIColor(red: 107 / 255.0, green: 107 / 255.0, blue: 107 / 255.0, alpha: 1.0)
    //pop背景色
    var popMenuBgColor:UIColor = UIColor.white
    
    //设置数据源 icon：图片名称  title：内容
    popMenu.popData = [(icon:"saoyisao",title:"扫一扫"),
                       (icon:"SignRule",title:"签到规则")]   



 2、显示与移除
<pre>
 popMenu.show()

 popMenu.dismiss()  
</pre>

 3、点击事件，提供两种方式
 
 - block回调处理
 - 代理处理


 示例代码：
<pre>
 var popMenu:SwiftPopMenu!

 popMenu = SwiftPopMenu(frame:  CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112), arrowMargin: 12)
 popMenu.popData = [(icon:"saoyisao",title:"扫一扫"),
                           (icon:"SignRule",title:"签到规则")]
 //点击菜单
 popMenu.didSelectMenuBlock = { [weak self](index:Int)->Void in
            self?.popMenu.dismiss()
            print("block select \(index)")
            
 }
 popMenu.show()

</pre>





