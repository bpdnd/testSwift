//
//  CustomTableViewCell.swift
//  testSwift
//
//  Created by Admin on 2019/1/4.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class CustomTableViewCell: UITableViewCell {
    //var customLabel:UILabel?; //标题
    //var customImageView:UIImageView?; //图片
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
        self.backgroundColor = UIColor.white;
        self.customImageView.backgroundColor = UIColor.white;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK 懒加载
     //背景图
    lazy var customImageView:CustomImageView = {
        var customImageView = CustomImageView.init();
        self.addSubview(customImageView);
        customImageView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.snp.left).offset(10);
            make.top.equalTo(self.snp.top).offset(10);
            make.right.equalTo(self.snp.right).offset(-10);
            make.bottom.equalTo(self.snp.bottom).offset(0);
        });
        return customImageView;
    }();
     //头视图
    lazy var headView:HeadView = {
        var headView = HeadView.init(frame: .zero);
        self.customImageView.addSubview(headView);
        headView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.customImageView.snp.left).offset(20);
            make.bottom.equalTo(self.customImageView.snp.bottom).offset(-10);
            make.size.equalTo(CGSize(width: 30, height: 30));
        });
        return headView;
    }();
    //名称
    lazy var nameLabel:UILabel = {
        var nameLabel:UILabel = UILabel.init();
        nameLabel.textAlignment = .left;
        nameLabel.textColor = UIColor.white;
        nameLabel.font = UIFont.systemFont(ofSize: 17);
        self.customImageView.addSubview(nameLabel);
        nameLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.headView.snp.right).offset(5);
            make.centerY.equalTo(self.headView.snp.centerY).offset(0);
            make.height.equalTo(20);
        });
        return nameLabel;
    }();
    // 赋值
    func setValueForCell(model:Model) {
        let backUrl = URL(string: model.backUrl!);
        self.customImageView.imageView.kf.setImage(with: backUrl);
        
        let headUrl = URL(string: model.headUrl!);
        self.headView.imageView.kf.setImage(with: headUrl);
        
        self.headView.imageView.backgroundColor = UIColor.white;
        self.nameLabel.text = model.name;
    }
}
