//
//  MineBaseTwoView.swift
//  testSwift
//
//  Created by Admin on 2019/1/5.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MineBaseTwoView: UIView,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.lineOne.backgroundColor    = UIColor.gray;
        self.changeImage(page: 0);
        self.lineTwo.backgroundColor    = UIColor.gray;
        self.collectionView.backgroundColor = UIColor.white;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: 懒加载
     //lineone
    lazy var lineOne:UILabel = {
        var lineOne = UILabel.init();
        self.addSubview(lineOne);
        lineOne.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(0);
            make.top.equalTo(self.snp.top).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(1);
        });
        return lineOne;
    }();
      //imageOne
    lazy var imageOneButton:UIButton = {
        var imageOneButton = UIButton(type: UIButtonType.custom);
        imageOneButton.tag = 10;
        imageOneButton.addTarget(self, action:#selector(imageButtonEvent(button:)), for: UIControlEvents.touchUpInside);
        self.addSubview(imageOneButton);
        imageOneButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(30);
            make.top.equalTo(self.lineOne.snp.bottom).offset(10);
            make.size.equalTo(CGSize(width: 35, height: 35));
        });
        return imageOneButton;
    }();
      //imagetwo
    lazy var imageTwoButton:UIButton = {
        var imageTwoButton = UIButton(type: UIButtonType.custom);
        imageTwoButton.tag = 11;
        imageTwoButton.addTarget(self, action:#selector(imageButtonEvent(button:)), for: UIControlEvents.touchUpInside);
        self.addSubview(imageTwoButton);
        imageTwoButton.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.snp.centerX).offset(0);
            make.top.equalTo(self.lineOne.snp.bottom).offset(10);
            make.size.equalTo(CGSize(width: 35, height: 35));
        });
        return imageTwoButton;
    }();
      //imagethree
    lazy var imageThreeButton:UIButton = {
        var imageThreeButton = UIButton(type: UIButtonType.custom);
        imageThreeButton.tag = 12;
        imageThreeButton.addTarget(self, action:#selector(imageButtonEvent(button:)), for: UIControlEvents.touchUpInside);
        self.addSubview(imageThreeButton);
        imageThreeButton.snp.makeConstraints({ (make) in
            make.right.equalTo(self.snp.right).offset(-30);
            make.top.equalTo(self.lineOne.snp.bottom).offset(10);
            make.size.equalTo(CGSize(width: 35, height: 35));
        });
        return imageThreeButton;
    }();
      //linetwo
    lazy var lineTwo:UILabel = {
        var lineTwo = UILabel.init();
        self.addSubview(lineTwo);
        lineTwo.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(0);
            make.top.equalTo(self.imageOneButton.snp.bottom).offset(10);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(1);
        });
        return lineTwo;
    }();
    lazy var dataSource:NSMutableArray = {
        var dataSource = NSMutableArray.init();
        return dataSource;
    }();
     //collectionView
    lazy var collectionView:UICollectionView = {
        var flewLayer = UICollectionViewFlowLayout.init();
        flewLayer.scrollDirection = UICollectionViewScrollDirection.horizontal;
        var collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: flewLayer);
        collectionView.register(MineBaseOneCollectionViewCell.self, forCellWithReuseIdentifier: "cellRe");
        collectionView.isPagingEnabled = true;
        collectionView.showsHorizontalScrollIndicator = false;
        collectionView.delegate   = self;
        collectionView.dataSource = self;
        self.addSubview(collectionView);
        collectionView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(0);
            make.top.equalTo(self.lineTwo.snp.bottom).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.bottom.equalTo(self.snp.bottom).offset(0);
        });
        return collectionView;
    }();
    //MARK:
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:MineBaseOneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellRe", for: indexPath) as! MineBaseOneCollectionViewCell;
        cell.backgroundColor = UIColor.gray;
        if self.dataSource.count != 0 {
            cell.customLabel.text = self.dataSource.object(at: indexPath.row) as? String;
        }
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: collectionView.frame.height);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = (Int(scrollView.contentOffset.x) / Int(UIScreen.main.bounds.size.width)) % self.dataSource.count
        self.changeImage(page: page);
    }
    //MARK:修改图片颜色
    func changeImage(page:Int) {
        switch page {
        case 0:
            imageOneButton.setImage(UIImage.init(named: "mine_list_selected"), for: UIControlState.normal);
            imageTwoButton.setImage(UIImage.init(named: "mine_flow_normal"), for: UIControlState.normal);
            imageThreeButton.setImage(UIImage.init(named: "mine_collect_normal"), for: UIControlState.normal);
            break;
        case 1:
            imageOneButton.setImage(UIImage.init(named: "mine_list_normal"), for: UIControlState.normal);
            imageTwoButton.setImage(UIImage.init(named: "mine_flow_selected"), for: UIControlState.normal);
            imageThreeButton.setImage(UIImage.init(named: "mine_collect_normal"), for: UIControlState.normal);
            break;
        case 2:
            imageOneButton.setImage(UIImage.init(named: "mine_list_normal"), for: UIControlState.normal);
            imageTwoButton.setImage(UIImage.init(named: "mine_flow_normal"), for: UIControlState.normal);
            imageThreeButton.setImage(UIImage.init(named: "mine_collect_selected"), for: UIControlState.normal);
            break;
        default:
            print("")
            break;
        }
    }
    //MARK:点击事件，滚动视图
    @objc func imageButtonEvent(button:UIButton){
        let tag = button.tag;
        self.changeImage(page: tag-10);
        switch tag {
        case 10:
            collectionView.contentOffset.x = 0;
            break;
        case 11:
            collectionView.contentOffset.x = UIScreen.main.bounds.size.width;
            break;
        case 12:
            collectionView.contentOffset.x = UIScreen.main.bounds.size.width*2;
            break;
        default:
            print("");
            break;
        }
    }
}
