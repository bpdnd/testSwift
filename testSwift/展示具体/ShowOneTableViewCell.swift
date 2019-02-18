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
        self.selectionStyle = UITableViewCellSelectionStyle.none;
        oneLabel.text = "**************************";
        twoLabel.text = "******************";
        cuImageView.image = UIImage(named: "freeWalker");
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
            make.height.equalTo(50);
        });
        return label;
    }();
    lazy var oneLabel:UILabel = {
        var oneLabel = UILabel.init();
        oneLabel.textAlignment = NSTextAlignment.center;
        oneLabel.textColor = UIColor.white;
        self.addSubview(oneLabel);
        oneLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(20);
            make.right.equalTo(self.snp.right).offset(-20);
            make.bottom.equalTo(self.label.snp.top).offset(0);
        });
        return oneLabel;
    }();
    lazy var twoLabel:UILabel = {
        var twoLabel = UILabel.init();
        twoLabel.textAlignment = NSTextAlignment.center;
        twoLabel.textColor = UIColor.white;
        self.addSubview(twoLabel);
        twoLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(20);
            make.right.equalTo(self.snp.right).offset(-20);
            make.top.equalTo(self.label.snp.bottom).offset(0);
        });
        return twoLabel;
    }();
    lazy var cuImageView: UIImageView = {
        var cuImageView = UIImageView.init();
        self.addSubview(cuImageView);
        cuImageView.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.snp.centerX).offset(0);
            make.bottom.equalTo(self.snp.bottom).offset(-20);
        })
        return cuImageView;
    }();
}
