//
//  MineBaseView.swift
//  testSwift
//
//  Created by Admin on 2019/1/5.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MineBaseView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame);
        //赞
        zanNumberLabel.textColor = UIColor.black;
        zanLabel.textColor = UIColor.gray;
        //收藏
        shouNumberLabel.textColor = UIColor.black;
        shouLabel.textColor = UIColor.gray;

        //作品
        zuoNumberLabel.textColor = UIColor.black;
        zuoLabel.textColor = UIColor.gray;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: 懒加载
     //赞
    lazy var zanNumberLabel:UILabel = {
        var zanNumberLabel = UILabel.init();
        zanNumberLabel.textAlignment = NSTextAlignment.center;
        zanNumberLabel.font = UIFont.systemFont(ofSize: 15);
        self.addSubview(zanNumberLabel);
        zanNumberLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(self.snp.top).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.size.equalTo(CGSize(width: 50, height: 30));
        });
        return zanNumberLabel;
    }();
    lazy var zanLabel:UILabel = {
        var zanLabel = UILabel.init();
        zanLabel.adjustsFontSizeToFitWidth = true;
        zanLabel.textAlignment = NSTextAlignment.center;
        self.addSubview(zanLabel);
        zanLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(self.zanNumberLabel.snp.bottom).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.size.equalTo(CGSize(width: 50, height: 30));
        });
        return zanLabel;
    }();
    //收藏
    lazy var shouNumberLabel:UILabel = {
        var shouNumberLabel = UILabel.init();
        shouNumberLabel.textAlignment = NSTextAlignment.center;
        shouNumberLabel.font = UIFont.systemFont(ofSize: 15);
        self.addSubview(shouNumberLabel);
        shouNumberLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(self.snp.top).offset(0);
            make.right.equalTo(self.zanNumberLabel.snp.left).offset(0);
            make.size.equalTo(CGSize(width: 50, height: 30));
        });
        return shouNumberLabel;
    }();
    lazy var shouLabel:UILabel = {
        var shouLabel = UILabel.init();
        shouLabel.adjustsFontSizeToFitWidth = true;
        shouLabel.textAlignment = NSTextAlignment.center;
        self.addSubview(shouLabel);
        shouLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(self.shouNumberLabel.snp.bottom).offset(0);
            make.right.equalTo(self.zanLabel.snp.left).offset(0);
            make.size.equalTo(CGSize(width: 50, height: 30));
        });
        return shouLabel;
    }();
    //作品
    lazy var zuoNumberLabel:UILabel = {
        var zuoNumberLabel = UILabel.init();
        zuoNumberLabel.textAlignment = NSTextAlignment.center;
        zuoNumberLabel.font = UIFont.systemFont(ofSize: 15);
        self.addSubview(zuoNumberLabel);
        zuoNumberLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(self.snp.top).offset(0);
            make.right.equalTo(self.shouNumberLabel.snp.left).offset(0);
            make.size.equalTo(CGSize(width: 50, height: 30));
        });
        return zuoNumberLabel;
    }();
    lazy var zuoLabel:UILabel = {
        var zuoLabel = UILabel.init();
        zuoLabel.adjustsFontSizeToFitWidth = true;
        zuoLabel.textAlignment = NSTextAlignment.center;
        self.addSubview(zuoLabel);
        zuoLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(self.zuoNumberLabel.snp.bottom).offset(0);
            make.right.equalTo(self.shouLabel.snp.left).offset(0);
            make.size.equalTo(CGSize(width: 50, height: 30));
        });
        return zuoLabel;
    }();
    //MARK:赋值
    func setValueNumber(zanNumber:String,shouNumber:String,zuoNumber:String){
        self.zanNumberLabel.text = zanNumber;
        self.zanLabel.text       = "获赞";
        
        self.shouNumberLabel.text = shouNumber;
        self.shouLabel.text      = "收藏";
        
        self.zuoNumberLabel.text  = zuoNumber;
        self.zuoLabel.text       = "作品";
    }

}
