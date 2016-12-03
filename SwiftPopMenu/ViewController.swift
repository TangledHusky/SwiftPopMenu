//
//  ViewController.swift
//  SwiftPopMenu
//
//  Created by lyj on 2016/12/2.
//  Copyright © 2016年 zyyj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var popMenu:SwiftPopMenu!
    
    let KSCREEN_WIDTH:CGFloat = UIScreen.main.bounds.size.width
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Shape"), style: .plain, target: self, action: #selector(self.showMenu))
        
   
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showMenu() {
        //frame 为整个popview相对整个屏幕的位置  箭头距离右边位置，默认15
        //popMenu =  SwiftPopMenu(frame: CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112))

        //frame 为整个popview相对整个屏幕的位置 arrowMargin ：指定箭头距离右边距离
        popMenu = SwiftPopMenu(frame:  CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112), arrowMargin: 12)

        
        popMenu.popData = [(icon:"saoyisao",title:"扫一扫"),
                           (icon:"SignRule",title:"签到规则")]
        //点击菜单
        popMenu.didSelectMenuBlock = { [weak self](index:Int)->Void in
            self?.popMenu.dismiss()
            print("block select \(index)")
            
        }
        popMenu.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
