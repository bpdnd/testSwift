//
//  HeadView.swift
//  testSwift
//
//  Created by Admin on 2019/1/5.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class HeadView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: rect.size.width/2);
        let maskLayer = CAShapeLayer.init();
        maskLayer.frame = rect;
        maskLayer.path  = path.cgPath;
        self.layer.mask = maskLayer;
    }
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var imageView:UIImageView = {
        var imageView = UIImageView.init();
        self.addSubview(imageView);
        imageView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(0);
            make.top.equalTo(self.snp.top).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.bottom.equalTo(self.snp.bottom).offset(0);
        });
        return imageView;
    }();
}
