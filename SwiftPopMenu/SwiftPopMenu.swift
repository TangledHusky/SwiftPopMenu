//
//  PopView.swift
//  TestSwift
//
//  Created by lyj on 16/5/7.
//  Copyright © 2016年 zyyj. All rights reserved.
//

import UIKit

protocol SwiftPopMenuDelegate {
    func swiftPopMenuDidSelectIndex(index:Int)
}

class SwiftPopMenu: UIView {
    
    //var delegate : SwiftPopMenuDelegate?
    
    
    let KScrW:CGFloat = UIScreen.main.bounds.size.width
    let KScrH:CGFloat = UIScreen.main.bounds.size.height
    
    private var myFrame:CGRect!

    private var arrowView : UIView! = nil
    private var arrowViewWidth : CGFloat = 15
    private var arrowViewHeight : CGFloat = 8
    
    
    //／*  -----------------------  可变参数 ------------------------------------------ *／
    
    //小箭头距离右边距离
    var arrowViewMargin : CGFloat = 15
    //圆角弧度
    var cornorRadius:CGFloat = 5
    
    //pop文字颜色
    var popTextColor:UIColor = UIColor(red: 107 / 255.0, green: 107 / 255.0, blue: 107 / 255.0, alpha: 1.0)
    //pop背景色
    var popMenuBgColor:UIColor = UIColor.white
    
    
    
    var tableView:UITableView! = nil
    var popData:[(icon:String,title:String)]! = [(icon:String,title:String)](){
        didSet{
            //计算行高
            rowHeightValue = (self.myFrame.height - arrowViewHeight)/CGFloat(popData.count)
            initViews()
        }
        
    }
    
    
    var didSelectMenuBlock:((_ index:Int)->Void)?
    
    
    static let cellID:String = "SwiftPopMenuCellID"
    var rowHeightValue:CGFloat = 44
    
    
   
    
    /**
     位置是popmenu相对整个屏幕的位置
     
     - parameter frame: <#frame description#>
     
     - returns: <#return value description#>
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: KScrW, height: KScrH)
        myFrame = frame
    }
    
    
    /// 位置是popmenu相对整个屏幕的位置
    ///
    /// - Parameters:
    ///   - frame: <#frame description#>
    ///   - arrowMargin: 箭头距离右边距离
    init(frame: CGRect,arrowMargin:CGFloat) {
        super.init(frame: frame)
        
        arrowViewMargin = arrowMargin
        self.frame = CGRect(x: 0, y: 0, width: KScrW, height: KScrH)
        myFrame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss()
    }
    
    func show() {
        UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    func dismiss() {
         self.removeFromSuperview()
    }

    
    func initViews() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        //箭头
        arrowView=UIView(frame: CGRect(x: myFrame.origin.x, y: myFrame.origin.y, width: myFrame.width, height: arrowViewHeight))
        let layer=CAShapeLayer()
        let path=UIBezierPath()
        path.move(to: CGPoint(x:myFrame.width - arrowViewMargin - arrowViewWidth/2, y: 0))
        path.addLine(to: CGPoint(x: myFrame.width - arrowViewMargin - arrowViewWidth, y: arrowViewHeight))
        path.addLine(to: CGPoint(x: myFrame.width - arrowViewMargin, y: arrowViewHeight))
        layer.path=path.cgPath
        layer.fillColor = popMenuBgColor.cgColor
        arrowView.layer.addSublayer(layer)
        self.addSubview(arrowView)
        
        tableView=UITableView(frame: CGRect(x: myFrame.origin.x,y: myFrame.origin.y + arrowViewHeight,width: myFrame.width,height: myFrame.height - arrowViewHeight), style: .plain)
        tableView.register(SwiftPopMenuCell.classForCoder(), forCellReuseIdentifier: SwiftPopMenu.cellID)
        tableView.backgroundColor = UIColor.clear
        tableView.layer.cornerRadius = cornorRadius
        tableView.layer.masksToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        UIView.animate(withDuration: 0.3) { 
            self.addSubview(self.tableView)
        }
        

        
    }
    
}


class SwiftPopMenuCell: UITableViewCell {
    var iconImage:UIImageView!
    var lblTitle:UILabel!
    var line:UIView!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        iconImage = UIImageView()
        self.contentView.addSubview(iconImage)
        self.selectionStyle = .none
        
        lblTitle = UILabel()
        lblTitle.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(lblTitle)
        
        line = UIView()
        line.backgroundColor = UIColor(red: 222/255.0, green: 222/255.0, blue: 222/255.0, alpha: 0.5)
        self.contentView.addSubview(line)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(iconImage:String,title:String,textColor:UIColor,islast:Bool = false) {
        self.iconImage.image = UIImage(named: iconImage)
        self.lblTitle.text = title
        self.line.isHidden = islast
        lblTitle.textColor = textColor
        
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(self.bounds)
        self.iconImage.frame = CGRect(x: 10, y: (self.bounds.size.height - 20)/2, width: 20, height: 20)
        self.lblTitle.frame = CGRect(x: 40, y: 0, width: self.bounds.size.width - 40, height: self.bounds.size.height)
        self.line.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)

    }
    
    
}

extension SwiftPopMenu : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if popData.count>indexPath.row {
            let cell = tableView.dequeueReusableCell(withIdentifier: SwiftPopMenu.cellID) as! SwiftPopMenuCell
            let model = popData[indexPath.row]
            if indexPath.row == popData.count - 1 {
                cell.fill(iconImage: model.icon, title: model.title,textColor: popTextColor, islast: true)
            }else{
                 cell.fill(iconImage: model.icon, title: model.title,textColor: popTextColor)
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
}

extension SwiftPopMenu : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeightValue
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if self.delegate != nil{
//            self.delegate?.swiftPopMenuDidSelectIndex(index: indexPath.row)
//        }
        if didSelectMenuBlock != nil {
            didSelectMenuBlock!(indexPath.row)
        }
        
    }
}
