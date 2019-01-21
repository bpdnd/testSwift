//
//  FindListCollectionViewCell.swift
//  testSwift
//
//  Created by Admin on 2019/1/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class FindListCollectionViewCell: UICollectionViewCell {
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
