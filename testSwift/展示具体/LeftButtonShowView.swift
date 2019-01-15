//
//  LeftButtonShowView.swift
//  testSwift
//
//  Created by Admin on 2019/1/15.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class LeftButtonShowView: UIView {

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
}
