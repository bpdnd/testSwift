//
//  MineSignView.swift
//  testSwift
//
//  Created by Admin on 2019/1/8.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MineSignView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        //圆角
        let corners: UIRectCorner = [.topLeft,.topRight,.bottomLeft,.bottomRight]
        let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize.init(width: 20, height: 20));
        let maskLayer = CAShapeLayer.init();
        maskLayer.frame = rect;
        maskLayer.path = path.cgPath;
        self.layer.mask = maskLayer;
        //渐变
        let gradient = CAGradientLayer.init();
        gradient.frame  = rect;
        //定义渐变的颜色（从黄色渐变到橙色）
        let topColor = UIColor(red: 92/255, green: 155/255, blue: 236/255, alpha: 1)
        let buttomColor = UIColor(red: 14/255, green: 101/255, blue: 215/255, alpha: 1)
        let gradientColors = [topColor.cgColor, buttomColor.cgColor]
        gradient.colors = gradientColors;

        gradient.startPoint = CGPoint.init(x: 0, y: 0.5);
        gradient.endPoint   = CGPoint.init(x: 1, y: 0.5);

        gradient.type = kCAGradientLayerAxial;
        self.layer.addSublayer(gradient);
        // gradient.mask = self.label.layer;  //只显示文字，文字的颜色为渐变的

    }
    override init(frame: CGRect) {
        super.init(frame: frame);
        label.textAlignment = NSTextAlignment.center;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var label:UILabel = {
        var label = UILabel.init();
        self.addSubview(label);
        label.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(0);
            make.top.equalTo(self.snp.top).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.bottom.equalTo(self.snp.bottom).offset(0);
        });
        return label;
    }();
}
