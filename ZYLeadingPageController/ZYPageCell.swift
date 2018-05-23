//
//  ZYPageCell.swift
//  ZYLeadingPageController
//
//  Created by Palmpay on 2018/5/22.
//  Copyright © 2018年 palm. All rights reserved.
//

import UIKit

class ZYPageCell: UICollectionViewCell {
    
    lazy var finishBtn: UIButton = {
        () -> UIButton in
        let finishBtn = UIButton.init(type: UIButtonType.custom)
        finishBtn.setTitle("立即体验", for: UIControlState.normal)
        finishBtn.backgroundColor = UIColor.blue
        return finishBtn
    }()
    
    lazy var bgImageView: UIImageView = {
        () -> UIImageView in
        let bgImageView = UIImageView.init(frame: CGRect.zero)
        bgImageView.image = UIImage.init(named: "wangyiyun2")
        return bgImageView;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    convenience init() {
        self.init()
        //初始化
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //设置布局
        self.setLayout()
    }
    
    func commonInit() -> Void {
        self.addSubview(self.bgImageView)
        self.addSubview(self.finishBtn)
    }
    
    func setLayout() -> Void {
        self.bgImageView.frame = self.bounds
        let fininshW = 120.0
        let margin = (Double(kScreenWidth) - Double(fininshW)) / 2.0
        let finishH = 47.0
        let finishY = Double(kScreenHeight) - finishH - Double(100.0)
        self.finishBtn.frame = CGRect(x:margin, y:finishY, width:fininshW, height:finishH)
    }
}
