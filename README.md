# SwiftPopMenu 效果图：

<img src="https://github.com/TangledHusky/SwiftPopMenu/blob/master/img3.png" >



 功能：
    只需要传入菜单箭头点位置、菜单宽度、数据源即可。
 
    1、支持任意点弹出（点是基于整个屏幕位置）
    2、会根据点位置自动计算菜单位置和高度
    3、背景色、文字等属性支持自定义设置
    4、easy自定义，有更多需求，可以直接在SwiftPopMenu.swift自己修改


 导入项目：

- pods导入：pod 'SwiftPopMenu' 

- 文件导入：下载Demo，导入SwiftPopMenu.swift文件即可

- 代码现已支持 Swift5 （2.x已支持swift5，1.x支持swift3）


 使用介绍：

import SwiftPopMenu


 1、初始化Init
 <pre>

    ///初始化菜单
    init(menuWidth:CGFloat,                                 //菜单宽度(高度不需要传，会根据item高*item数量自动计算)
         arrow:CGPoint,                                     //箭头点位置是基于整个屏幕的位置
         datas:[(icon:String,title:String)],                //数据源数组，icon没有就传空
         configures:[SwiftPopMenuConfigure] = []            //配置信息，可不传，不传采用默认值
         ) {}

</pre>

 2、显示与移除
<pre>
 popMenu.show()

 popMenu.dismiss()  
</pre>

 3、点击事件，提供两种方式
 
 - block回调处理
 - delegate代理处理

 4、参数配置(使用时可不传)
 <pre>
public enum SwiftPopMenuConfigure {
    case PopMenuTextFont(UIFont)            //菜单文字字体，默认systemFont(ofSize: 17)
    case PopMenuTextColor(UIColor)          //菜单文字颜色，默认black
    case PopMenuBackgroudColor(UIColor)     //菜单背景色，默认white
    case popMenuCornorRadius(CGFloat)       //菜单圆角，默认6
    case popMenuItemHeight(CGFloat)         //菜单内单行高度（非整个menu高度），默认44.0
    case popMenuSplitLineColor(UIColor)     //菜单分割线颜色，默认（222，222，222）
    case popMenuIconLeftMargin(CGFloat)     //icon左间距，默认15
    case popMenuMargin(CGFloat)             //菜单与屏幕边距，默认10
    case popMenuAlpha(CGFloat)              //菜单背景透明度，默认0.3
}
 </pre>

 完整示例代码：
<pre>
var popMenu:SwiftPopMenu!

 
 //数据源（icon可不填）
let popData = [(icon:"saoyisao",title:"扫一扫"),
               (icon:"SignRule",title:"签到规则"),
               (icon:"saoyisao",title:"扫一扫"),
               (icon:"SignRule",title:"签到规则")]

//设置Parameter（可不写）
let parameters:[SwiftPopMenuConfigure] = [
    .PopMenuTextColor(UIColor.black),
    .popMenuItemHeight(44),
    .PopMenuTextFont(UIFont.systemFont(ofSize: 18))
]

//init  (注意：arrow点是基于屏幕的位置)
popMenu = SwiftPopMenu(menuWidth: 150, arrow: CGPoint(x: 100, y: 100), datas: popData,configures: parameters)

//click
popMenu.didSelectMenuBlock = { [weak self](index:Int)->Void in            
    print("block select \(index)")
    self?.popMenu = nil
}

//show
popMenu.show()

</pre>





