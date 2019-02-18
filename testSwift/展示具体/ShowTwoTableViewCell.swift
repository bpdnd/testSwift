//
//  ShowTwoTableViewCell.swift
//  testSwift
//
//  Created by Admin on 2019/2/17.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ShowTwoTableViewCell: UITableViewCell {

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
        oneLine.text = "····················";
        timeLabel.text = "时间";
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var label:UILabel = {
        var label = UILabel.init();
        label.lineBreakMode = NSLineBreakMode.byWordWrapping;
        label.textAlignment = NSTextAlignment.center;
        label.numberOfLines = 2;
        self.addSubview(label);
        label.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(0);
            make.top.equalTo(self.snp.top).offset(5);
            make.right.equalTo(self.snp.right).offset(0);
        });
        return label;
    }();
    lazy var cuImageView: UIImageView = {
        var cuImageView = UIImageView.init();
        cuImageView.layer.cornerRadius  = 25;
        cuImageView.layer.masksToBounds = true;
        self.addSubview(cuImageView);
        cuImageView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.label.snp.bottom).offset(10);
            make.centerX.equalTo(self.snp.centerX).offset(0);
            make.size.equalTo(CGSize.init(width: 50, height: 50));
        });
        return cuImageView;
    }();
    func setHeadImageUrl(url:String) {
        let headUrl = URL(string: url);
        cuImageView.kf.setImage(with: headUrl)
    }
    lazy var nameLabel: UILabel = {
        var nameLabel = UILabel.init();
        nameLabel.textColor = UIColor.init(red: 56/255.0, green: 125/255.0, blue: 126/255.0, alpha: 1);
        self.addSubview(nameLabel);
        nameLabel.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.snp.centerX).offset(0);
            make.top.equalTo(self.cuImageView.snp.bottom).offset(5);
            make.height.equalTo(20);
        })
        return nameLabel;
    }();
    lazy var oneLine:UILabel = {
        var oneLine = UILabel.init();
        oneLine.font = UIFont.systemFont(ofSize: 16);
        oneLine.textAlignment = NSTextAlignment.center;
        self.addSubview(oneLine);
        oneLine.snp.makeConstraints({ (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(5);
            make.left.equalTo(self.snp.left).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(20);
        });
        return oneLine;
    }();
    lazy var timeLabel:UILabel = {
        var timeLabel = UILabel.init();
        timeLabel.textAlignment = NSTextAlignment.center;
        timeLabel.textColor = UIColor.init(red: 56/255.0, green: 125/255.0, blue: 126/255.0, alpha: 1);
        self.addSubview(timeLabel);
        timeLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(self.oneLine.snp.bottom).offset(5);
            make.left.equalTo(self.snp.left).offset(0);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(20);
        });
        return timeLabel;
    }();
    lazy var chuDate: UILabel = {
        var chuDate = UILabel.init();
        chuDate.font = UIFont.systemFont(ofSize: 14);
        self.addSubview(chuDate);
        chuDate.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(UIScreen.main.bounds.size.width/3);
            make.top.equalTo(self.timeLabel.snp.bottom).offset(5);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(20);
        });
        return chuDate;
    }();
    lazy var chuDateNum: UILabel = {
        var chuDateNum = UILabel.init();
        chuDateNum.font = UIFont.systemFont(ofSize: 14);
        self.addSubview(chuDateNum);
        chuDateNum.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(UIScreen.main.bounds.size.width/3);
            make.top.equalTo(self.chuDate.snp.bottom).offset(5);
            make.right.equalTo(self.snp.right).offset(0);
            make.height.equalTo(20);
        });
        return chuDateNum;
    }();
}
