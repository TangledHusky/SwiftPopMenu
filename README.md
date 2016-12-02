# SwiftPopMenu
效果图：  

 ![image](https://github.com/TangledHusky/SwiftPopMenu/blob/master/img2.png)
 ![image](https://github.com/TangledHusky/SwiftPopMenu/blob/master/img1.png)
 
  
  
 已支持 Swift3 语法
  
  
 使用介绍：
  
 暂不支持pods导入，请下载文件，导入SwiftPopMenu.swift文件即可。  
 
 1、添加
  
  
//frame 为整个popview相对整个屏幕的位置  

        popMenu =  SwiftPopMenu(frame: CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112))
        popMenu.popData = [(icon:"saoyisao",title:"扫一扫"),(icon:"SignRule",title:"签到规则")]
        popMenu.delegate = self
        UIApplication.shared.keyWindow?.addSubview(popMenu)
	
  
  
 2、移除  
 

 popMenu.dismiss()  
   
 3、代理    
 
<pre name="code" class="html"> extension ViewController:SwiftPopMenuDelegate{
    func swiftPopMenuDidSelectIndex(index: Int) {
        popMenu.dismiss()
        print(&quot;click \(index)&quot;)
    
    }
}</pre>
<br />
