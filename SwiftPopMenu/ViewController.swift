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
        //frame 为整个popview相对整个屏幕的位置
        popMenu =  SwiftPopMenu(frame: CGRect(x: KSCREEN_WIDTH - 155, y: 51, width: 150, height: 112))
        popMenu.popData = [(icon:"saoyisao",title:"扫一扫"),(icon:"SignRule",title:"签到规则")]
        popMenu.delegate = self
        UIApplication.shared.keyWindow?.addSubview(popMenu)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - 菜单
extension ViewController:SwiftPopMenuDelegate{
    func swiftPopMenuDidSelectIndex(index: Int) {
        popMenu.dismiss()
        print("click \(index)")
    
    }
}
