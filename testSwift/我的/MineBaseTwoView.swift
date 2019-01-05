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
        self.imageOne.backgroundColor   = UIColor.red;
        self.imageTwo.backgroundColor   = UIColor.red;
        self.imageThree.backgroundColor = UIColor.red;
        self.lineTwo.backgroundColor    = UIColor.gray;
        self.collectionView.backgroundColor = UIColor.red;
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
    lazy var imageOne:UIImageView = {
        var imageOne = UIImageView.init();
        self.addSubview(imageOne);
        imageOne.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(30);
            make.top.equalTo(self.lineOne.snp.bottom).offset(10);
            make.size.equalTo(CGSize(width: 35, height: 35));
        });
        return imageOne;
    }();
      //imagetwo
    lazy var imageTwo:UIImageView = {
        var imageTwo = UIImageView.init();
        self.addSubview(imageTwo);
        imageTwo.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.snp.centerX).offset(0);
            make.top.equalTo(self.lineOne.snp.bottom).offset(10);
            make.size.equalTo(CGSize(width: 35, height: 35));
        });
        return imageTwo;
    }();
      //imagethree
    lazy var imageThree:UIImageView = {
        var imageThree = UIImageView.init();
        self.addSubview(imageThree);
        imageThree.snp.makeConstraints({ (make) in
            make.right.equalTo(self.snp.right).offset(-30);
            make.top.equalTo(self.lineOne.snp.bottom).offset(10);
            make.size.equalTo(CGSize(width: 35, height: 35));
        });
        return imageThree;
    }();
      //linetwo
    lazy var lineTwo:UILabel = {
        var lineTwo = UILabel.init();
        self.addSubview(lineTwo);
        lineTwo.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(0);
            make.top.equalTo(self.imageOne.snp.bottom).offset(10);
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
        return CGSize(width: UIScreen.main.bounds.size.width, height: 500);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(-40, 0, 0, 0);
    }
}
