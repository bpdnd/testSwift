//
//  LeftButtonShowBackView.swift
//  testSwift
//
//  Created by Admin on 2019/1/15.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class LeftButtonShowBackView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame);
        leftButtonShow.backgroundColor = UIColor.white;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var leftButtonShow:LeftButtonShowView = {
        var leftButtonShow = LeftButtonShowView.init(frame: .zero);
        self.addSubview(leftButtonShow);
        leftButtonShow.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(15);
            make.top.equalTo(self.snp.top).offset(28);
            make.size.equalTo(CGSize.init(width: 180, height: 50));
        });
        return leftButtonShow;
    }();
    func showBackViewIsShow(isShow:Bool){
        if isShow {
            
            var isHaveShow:Bool = false;
            for  item:UIView  in (UIApplication.shared.keyWindow?.subviews)!{
                if item.isKind(of: LeftButtonShowBackView.self) {
                    isHaveShow = true;
                    break;
                }else{
                    
                }
            }
            if !isHaveShow {
                UIApplication.shared.keyWindow?.addSubview(self);
            }
        }else{
           self.removeFromSuperview();
        }
    }
}
