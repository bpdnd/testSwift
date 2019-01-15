//
//  LeftButtonShowView.swift
//  testSwift
//
//  Created by Admin on 2019/1/15.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class LeftButtonShowView: UIView {
    var isLike = false;
    var isXing = false;
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        let conrners:UIRectCorner = [.topLeft,.topRight,.bottomLeft,.bottomRight];
        let path:UIBezierPath = UIBezierPath.init(roundedRect: rect, byRoundingCorners: conrners, cornerRadii: CGSize.init(width: rect.height/2, height: rect.height/2));
        let maskLayer = CAShapeLayer.init();
        maskLayer.path  = path.cgPath;
        maskLayer.frame = rect;
        self.layer.mask = maskLayer;
    }
    override init(frame: CGRect) {
        super.init(frame: frame);
        likeButton.setImage(UIImage.init(named: "icon_heart"), for: UIControlState.normal);
        shareButton.setImage(UIImage.init(named: "share"), for: UIControlState.normal);
        xingButton.setImage(UIImage.init(named: "icon_collect_normal"), for: UIControlState.normal);
        reportButton.setImage(UIImage.init(named: "icon_report"), for: UIControlState.normal);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: ❤️
    lazy var likeButton:UIButton = {
        var likeButton = UIButton.init(type: UIButtonType.custom);
        likeButton.addTarget(self, action: #selector(likeButtonEvent(button:)), for: UIControlEvents.touchUpInside);
        self.addSubview(likeButton);
        likeButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(15);
            make.centerY.equalTo(self.snp.centerY).offset(0);
        });
        return likeButton;
    }();
    @objc func likeButtonEvent(button:UIButton) {
        self.isLike = !self.isLike;
        if self.isLike {
            button.setImage(UIImage.init(named: "icon_heart_filled"), for: UIControlState.normal);
        }else{
            button.setImage(UIImage.init(named: "icon_heart"), for: UIControlState.normal);
        }
    }
    //MARK:分享
    lazy var shareButton:UIButton = {
        var shareButton = UIButton.init(type: UIButtonType.custom);
        self.addSubview(shareButton);
        shareButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.likeButton.snp.right).offset(20);
            make.centerY.equalTo(self.snp.centerY).offset(0);
        });
        return shareButton;
    }();
    //MARK:🌟
    lazy var xingButton:UIButton = {
        var xingButton = UIButton.init(type: UIButtonType.custom);
        xingButton.addTarget(self, action: #selector(xingButtonEvent(button:)), for: UIControlEvents.touchUpInside);
        self.addSubview(xingButton);
        xingButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.shareButton.snp.right).offset(20);
            make.centerY.equalTo(self.snp.centerY).offset(0);
        });
        return xingButton;
    }();
    @objc func xingButtonEvent(button:UIButton) {
        self.isXing = !self.isXing;
        if self.isXing {
            button.setImage(UIImage.init(named: "icon_collect_selected"), for: UIControlState.normal);
        }else{
            button.setImage(UIImage.init(named: "icon_collect_normal"), for: UIControlState.normal);
        }
    }
    //MARK: 感叹号
    lazy var reportButton:UIButton = {
        var reportButton = UIButton.init(type: UIButtonType.custom);
        self.addSubview(reportButton);
        reportButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.xingButton.snp.right).offset(20);
            make.centerY.equalTo(self.snp.centerY).offset(0);
        });
        return reportButton;
    }();
    
    
    
}
