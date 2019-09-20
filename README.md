# SwiftPopMenu 效果图：
![image](https://github.com/TangledHusky/SwiftPopMenu/blob/master/img1.png)
![image](https://github.com/TangledHusky/SwiftPopMenu/blob/master/img2.png)
<img src="https://github.com/TangledHusky/SwiftPopMenu/blob/master/img1.png" width="120">

 功能：
    只需要传入菜单箭头点位置、菜单宽度、数据源即可。
 
    1、支持任意点弹出（点是基于整个屏幕位置）
    2、会根据点位置自动计算菜单位置
    3、背景色、文字等支持自定义设置



 导入项目：

- pods导入：pod 'SwiftPopMenu' 

- 文件导入：下载Demo，导入SwiftPopMenu.swift文件即可

- 代码现已支持 Swift5 （2.x已支持swift5，1.x支持swift3）


 使用介绍：

import SwiftPopMenu


 1、初始化
 <pre>
 ///   初始化菜单
 ///
 /// - Parameters:
 ///   - menuWidth: 菜单宽度
 ///   - arrow: 箭头位置是popmenu相对整个屏幕的位置
 ///   - datas: 数据源数组，icon允许传空，若数据源传空，菜单不会显示
 ///   - configure: 配置信息，可不传，不传采用默认值
    init(menuWidth:CGFloat,arrow:CGPoint,datas:[(icon:String,title:String)],configures:[SwiftPopMenuConfigure] = []) {
        ///
    }

</pre>

 2、显示与移除
<pre>
 popMenu.show()

 popMenu.dismiss()  
</pre>

 3、点击事件，提供两种方式
 
 - block回调处理
 - 代理处理

 4、参数配置(使用时可不传)
 <pre>
public enum SwiftPopMenuConfigure {
    case PopMenuTextFont(UIFont)            //菜单文字字体，默认systemFont(ofSize: 17)
    case PopMenuTextColor(UIColor)          //菜单文字颜色，默认black
    case PopMenuBackgroudColor(UIColor)     //菜单背景色，默认white
    case popMenuCornorRadius(CGFloat)       //菜单圆角，默认6
    case popMenuItemHeight(CGFloat)         //菜单行高度（非整个高度），默认44
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

//设置参数
let parameters:[SwiftPopMenuConfigure] = [
    .PopMenuTextColor(UIColor.black),
    .popMenuItemHeight(44),
    .PopMenuTextFont(UIFont.systemFont(ofSize: 18))
]

//init  (test随机生成点位置，注意：arrow点是基于屏幕的位置)
popMenu = SwiftPopMenu(menuWidth: 150, arrow: CGPoint(x: CGFloat(arc4random_uniform(UInt32(KSCREEN_WIDTH-100)) + 80), y: CGFloat(arc4random_uniform(UInt32(KSCREEN_HEIGHT-100)) + 80)), datas: popData,configures: parameters)

//click
popMenu.didSelectMenuBlock = { [weak self](index:Int)->Void in            
    print("block select \(index)")
    self?.popMenu = nil
}

//show
popMenu.show()

</pre>





