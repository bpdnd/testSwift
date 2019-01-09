//
//  LoginBaseTextField.swift
//  testSwift
//
//  Created by Admin on 2019/1/9.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class LoginBaseTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        //下划线
        let  contextRef = UIGraphicsGetCurrentContext();
        contextRef?.setFillColor(UIColor.white.cgColor);
        contextRef?.fill(CGRect.init(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1));
        let placeholserAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,attributes: placeholserAttributes)
    }

}
