//
//  ShowTableViewCell.swift
//  testSwift
//
//  Created by Admin on 2019/1/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ShowOneTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var label:UILabel = {
        var label = UILabel.init();
        label.textColor = UIColor.white;
        self.addSubview(label);
        label.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.snp.centerY).offset(0);
            make.centerX.equalTo(self.snp.centerX).offset(0);
            make.height.equalTo(20);
        });
        return label;
    }();
    
}
