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
    let KSCREEN_HEIGHT:CGFloat = UIScreen.main.bounds.size.height

    lazy var btn:UIButton = {
       let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        btn.center = self.view.center
        btn.backgroundColor = UIColor.black
        btn.setTitle("点击测试", for: .normal)
        btn.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Shape"), style: .plain, target: self, action: #selector(self.showMenu))
        
   
        
    }
    
    @objc func showMenu() {
        //数据源（icon可不填）
        let popData = [(icon:"saoyisao",title:"扫一扫"),
                       (icon:"SignRule",title:"签到规则"),
                       (icon:"saoyisao",title:"扫一扫"),
                       (icon:"SignRule",title:"签到规则"),
                       (icon:"saoyisao",title:"扫一扫"),
                       (icon:"SignRule",title:"签到规则")]
        
        //设置参数
        let parameters:[SwiftPopMenuConfigure] = [
            .PopMenuTextColor(UIColor.black),
            .popMenuItemHeight(44),
            .PopMenuTextFont(UIFont.systemFont(ofSize: 18))
        ]
        
        //init  (随机生成点位置)
        popMenu = SwiftPopMenu(menuWidth: 150, arrow: CGPoint(x: CGFloat(arc4random_uniform(UInt32(KSCREEN_WIDTH-100)) + 80), y: CGFloat(arc4random_uniform(UInt32(KSCREEN_HEIGHT-100)) + 80)), datas: popData,configures: parameters)

        //click
        popMenu.didSelectMenuBlock = { [weak self](index:Int)->Void in            
            print("block select \(index)")
            self?.popMenu = nil
        }
        popMenu.show()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
