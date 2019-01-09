//
//  LoginButton.swift
//  testSwift
//
//  Created by Admin on 2019/1/9.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class LoginButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        let corners:UIRectCorner = [.topLeft,.topRight,.bottomLeft,.bottomRight];
        let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize.init(width: 10, height: 10));
        let maskLayer = CAShapeLayer.init();
        maskLayer.frame = rect;
        maskLayer.path  = path.cgPath;
        self.layer.mask = maskLayer;
    }
}
