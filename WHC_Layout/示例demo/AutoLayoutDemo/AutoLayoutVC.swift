//
//  AutoLayoutDemoVC.swift
//  WHC_AutoLayoutKit(Swift)
//
//  Created by WHC on 16/7/9.
//  Copyright © 2016年 WHC. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_Layout *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

import UIKit

class AutoLayoutVC: UIViewController {
    
    fileprivate let leftTopLable = UILabel()
    fileprivate let rightTopLable = UILabel()
    fileprivate let leftBottomLable = UILabel()
    fileprivate let rightBottomLable = UILabel()
    
    fileprivate let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.navigationItem.title = "AutoLayout示例"
        self.view.addSubview(leftTopLable)
        self.view.addSubview(rightTopLable)
        self.view.addSubview(leftBottomLable)
        self.view.addSubview(rightBottomLable)
        self.view.addSubview(button)
        
        // 添加约束
        leftTopLable.whc_Left(0)
            .whc_Top(64)
            .whc_Size(100, height: 100)
        
        leftBottomLable.whc_Left(0)
            .whc_Bottom(0)
            .whc_SizeEqual(rightTopLable)
        
        rightTopLable.whc_Trailing(0)
            .whc_Top(64)
            .whc_SizeEqual(leftTopLable)
        
        rightBottomLable.whc_Trailing(0)
            .whc_Bottom(0)
            .whc_SizeEqual(leftBottomLable)
        
        button.whc_Center(0, y: 32, toView: self.view)
              .whc_WidthEqual(leftTopLable)
        
        leftTopLable.backgroundColor = UIColor.orange
        leftBottomLable.backgroundColor = UIColor.orange
        rightTopLable.backgroundColor = UIColor.orange
        rightBottomLable.backgroundColor = UIColor.orange
        
        leftTopLable.text = "1"
        rightTopLable.text = "2"
        leftBottomLable.text = "3"
        rightBottomLable.text = "4"
        
        leftTopLable.textAlignment = .center
        rightTopLable.textAlignment = .center
        leftBottomLable.textAlignment = .center
        rightBottomLable.textAlignment = .center
        
        button.backgroundColor = UIColor.red
        
        button.setTitle("开始动画", for: UIControlState())
        button.addTarget(self, action: #selector(self.clickStartAnimation(_:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func clickStartAnimation(_ sender: UIButton) -> Void {
        // 动态更新约束
        leftTopLable.whc_RemoveAttrs(.left)     /// 移除旧约束
            .whc_Trailing(0)
            .whc_RemoveAttrs(.top)              /// 移除旧约束
            .whc_Bottom(0)
        
        rightTopLable.whc_RemoveAttrs(.trailing)
            .whc_Left(0)
            .whc_RemoveAttrs(.top)
            .whc_BottomEqual(leftTopLable)
        
        leftBottomLable.whc_RemoveAttrs(.left)
            .whc_TrailingEqual(leftTopLable)
            .whc_RemoveAttrs(.bottom)
            .whc_Top(64)
        
        rightBottomLable.whc_RemoveAttrs(.trailing)
            .whc_LeftEqual(rightTopLable)
            .whc_RemoveAttrs(.bottom)
            .whc_TopEqual(leftBottomLable)
        UIView.animate(withDuration: 1, animations: { 
            self.view.layoutIfNeeded()
        }) 
    }

}
