//
//  MineBaseOneCollectionViewCell.swift
//  testSwift
//
//  Created by Admin on 2019/1/5.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MineBaseOneCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.customLabel.textColor = UIColor.white;
        self.customLabel.backgroundColor = UIColor.black;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var customLabel:UILabel = {
        var customLabel = UILabel.init();
        self.addSubview(customLabel);
        customLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(0);
            make.top.equalTo(self.snp.top).offset(0);
            make.size.equalTo(CGSize(width: 50, height: 50));
        });
        return customLabel;
    }();
}
