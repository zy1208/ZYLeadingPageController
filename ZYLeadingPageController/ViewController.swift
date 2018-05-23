//
//  ViewController.swift
//  ZYLeadingPageController
//
//  Created by Palmpay on 2018/5/21.
//  Copyright © 2018年 palm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ZYPageControllerFinishBtnClickHandleDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.orange;
        
        let btn = UIButton.init(frame: CGRect(x:100, y:100, width:200, height:100))
        btn.backgroundColor = UIColor.cyan
        btn.setTitle("启动图", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(btnDidClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func btnDidClick(button: UIButton) -> Void {
        //代理
//        pageVC.delegate = self
        //闭包
//        pageVC.handle = { (sender: UIButton) -> Void in
//            print("ni zhe difang keyi l ma")
//        }
        
//        let images = ["wangyiyun0", "wangyiyun1", "wangyiyun2"]
//        let pageVC: ZYPageController = ZYPageController().configPages(count: 3, images: images as NSArray) { (sender: UIButton) in
//            print("啊哈哈哈哈哈哈哈哈哈")
//        }
//        self.present(pageVC, animated: false, completion: nil)
    }
    
    func finishBtnClickHandle(sender: UIButton) {
        print("好好学习，天天向上")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

