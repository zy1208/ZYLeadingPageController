//
//  ZYPageController.swift
//  ZYLeadingPageController
//
//  Created by Palmpay on 2018/5/21.
//  Copyright © 2018年 palm. All rights reserved.
//

import UIKit

protocol ZYPageControllerFinishBtnClickHandleDelegate {
    func finishBtnClickHandle(sender: UIButton) -> Void
}

typealias finishHandle = (_ sender: UIButton) -> Void

class ZYPageController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {

    static var reuseIdentifier = "hahaha"
    
    var handle: finishHandle? = nil
    
    var pagesCount: Int = 5
    
    var delegate: ZYPageControllerFinishBtnClickHandleDelegate? = nil
    
    var imagesArr = [] as NSArray

    //MARK: 懒加载
    lazy var collectionView: UICollectionView = {
        () -> UICollectionView in
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: kScreenWidth, height: kScreenHeight)
        //设置滚动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        //设置边距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let collectionView: UICollectionView = UICollectionView.init(frame:CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.yellow
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.register(ZYPageCell.self, forCellWithReuseIdentifier: ZYPageController.reuseIdentifier)
        return collectionView;
    }()
    
    lazy var pageControl: UIPageControl = {
        () -> (UIPageControl) in
        let pageControl: UIPageControl = UIPageControl.init()
        pageControl.numberOfPages = pagesCount
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.orange
        pageControl.currentPage = 0
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加控件
        self.commonInit()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //布局
        self.setLayout()
    }
    
    //设置基础信息
    func configPages(count: Int, images: NSArray, finisHandle: @escaping ((_ sender: UIButton) -> Void)) -> ZYPageController {
        pagesCount = count;
        if images.count != 0 {
            imagesArr = images
        } else {
            print("没有设置图片")
        }
        if pagesCount != images.count {
            print("count和图片个数不统一")
        }
        handle = finisHandle
        return self
    }
    
    func commonInit() -> Void {
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.pageControl)
    }
    
    func setLayout() -> Void {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.frame = CGRect(x:0, y:0, width:kScreenWidth, height:kScreenHeight)
        let pageH = 47.0
        let pageY = Double(kScreenHeight) - 50.0 - pageH
        self.pageControl.frame = CGRect(x: 0.0, y: pageY, width: Double(kScreenWidth), height: pageH)
    }
    
    //MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pagesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ZYPageCell = collectionView.dequeueReusableCell(withReuseIdentifier: ZYPageController.reuseIdentifier, for: indexPath) as! ZYPageCell
        cell.backgroundColor = UIColor.init(red: CGFloat(arc4random()%1000/255), green: CGFloat(arc4random()%1000/255), blue: CGFloat(arc4random()%1000/255), alpha: 1)
        if indexPath.row == (pagesCount - 1) {
            cell.finishBtn.isHidden = false
            cell.finishBtn.addTarget(self, action: #selector(finishBtnClick), for: UIControlEvents.touchUpInside)
        } else {
            cell.finishBtn.isHidden = true
        }
        guard imagesArr.count != 0 else {
            return cell
        }
        cell.bgImageView.image = UIImage.init(named: imagesArr[indexPath.row] as! String)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentIndex: Int = Int(scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5)
        if self.pageControl.currentPage != currentIndex {
            self.pageControl.currentPage = currentIndex
        }
    }
 
    @objc func finishBtnClick(sender: UIButton) -> Void {
        print("人间一趟 看看太阳☀️")
    
        if let click = handle {
            click(sender)
        }
        
        if let handle = delegate {
            handle.finishBtnClickHandle(sender: sender)
        }
    }
}
