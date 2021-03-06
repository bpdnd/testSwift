//
//  CustomImageView.swift
//  testSwift
//
//  Created by Admin on 2019/1/4.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class CustomImageView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
//        let corners: UIRectCorner = [.topLeft,.topRight,.bottomLeft,.bottomRight]
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 10, height: 10));
//        let maskLayer = CAShapeLayer.init();
//        maskLayer.path = path.cgPath;
//        maskLayer.frame = rect;
//        self.layer.mask = maskLayer;

    }
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    lazy var imageView:UIImageView = {
        var imageView = UIImageView.init();
        imageView.layer.cornerRadius = 10;
        imageView.layer.masksToBounds =  true;
        self.addSubview(imageView);
        imageView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(0);
            make.top.equalTo(self.snp.top).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.bottom.equalTo(self.snp.bottom).offset(0);
        });
        return imageView;
    }();
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
