//
//  ShowViewController.swift
//  testSwift
//
//  Created by Admin on 2019/1/14.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var model:Model?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        let urlStr = URL(string: (model?.backUrl)!);
        let data = NSData.init(contentsOf: urlStr!);
        let imageView = UIImageView.init();
        
        let  image = UIImage.init(data: data! as Data);
        imageView.image = image?.crop(ratio: UIScreen.main.bounds.size.width/UIScreen.main.bounds.size.height);
      //imageView.image = image?.reSizeImage(resize: CGSize.init(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height));

//        imageView.kf.setImage(with: URL(string: (model?.backUrl)!));
//        imageView.contentMode = UIViewContentMode.center;
        
        self.tableView.backgroundView = imageView;
        
        self.leftButton.setImage(UIImage.init(named: "icon_more_b"), for: UIControlState.normal);
        self.rightButton.setImage(UIImage.init(named: "icon_close_black"), for: UIControlState.normal);
        leftButtonShowBackView.showBackViewIsShow(isShow: false);
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: true);
    }
    //MARK: tableView 懒加载
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableViewStyle.plain);
        tableView.tableFooterView = UIView.init();
        tableView.delegate   = self;
        tableView.dataSource = self;
        self.view.addSubview(tableView);
        tableView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view.snp.left).offset(0);
            make.top.equalTo(self.view.snp.top).offset(0);
            make.right.equalTo(self.view.snp.right).offset(0);
            make.bottom.equalTo(self.view.snp.bottom).offset(0);
        });
        return tableView;
    }();
    //MARK: 左边按钮
    lazy var leftButton:UIButton = {
        var leftButton = UIButton.init(type: UIButtonType.custom);
        leftButton.addTarget(self, action: #selector(leftButtonEvent(button:)), for: UIControlEvents.touchUpInside);
        self.view.addSubview(leftButton);
        leftButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view.snp.left).offset(15);
            make.top.equalTo(self.view.snp.top).offset(28);
        });
        return leftButton;
    }();
    @objc func leftButtonEvent(button:UIButton) {
        leftButtonShowBackView.showBackViewIsShow(isShow: true);
        button.isHidden = true;
    }
    lazy var leftButtonShowBackView:LeftButtonShowBackView = {
        var leftButtonShowBackView = LeftButtonShowBackView.init(frame:UIScreen.main.bounds);
        let tap = UITapGestureRecognizer.init();
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        tap.addTarget(self, action: #selector(leftButtonShowBackViewTap));
        leftButtonShowBackView.addGestureRecognizer(tap);
        leftButtonShowBackView.backgroundColor = UIColor.init(white: 0.8, alpha: 0.5);
        return leftButtonShowBackView;
    }();
    @objc func leftButtonShowBackViewTap() {
        leftButtonShowBackView.showBackViewIsShow(isShow: false);
        leftButton.isHidden = false;
    }
    //MARK: 右边按钮
    lazy var rightButton:UIButton = {
        var rightButton = UIButton.init(type: UIButtonType.custom);
        rightButton.addTarget(self, action: #selector(returnBack(button:)), for: UIControlEvents.touchUpInside);
        self.view.addSubview(rightButton);
        rightButton.snp.makeConstraints({ (make) in
            make.right.equalTo(self.view.snp.right).offset(-15);
            make.top.equalTo(self.view.snp.top).offset(28);
        });
        return rightButton;
    }();
    @objc func returnBack(button:UIButton) {
        self.navigationController?.popViewController(animated: true);
    }
    //MARK: tableView delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cellRe = "cellOneRe";
            var cell:ShowOneTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellRe) as? ShowOneTableViewCell;
            if cell == nil {
                cell = ShowOneTableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: cellRe);
            }
            cell?.backgroundColor = UIColor.clear;
            cell.label.text = "完美";
            return cell!;
        }
       
        let cellRe = "cellTwoRe";
        var cell:ShowTwoTableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellRe) as? ShowTwoTableViewCell;
        if cell == nil {
            cell = ShowTwoTableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: cellRe);
        }
        cell?.backgroundColor = UIColor.init(white: 0.8, alpha: 0.6);
        cell.label.text = "苍翠田野，碧蓝深海,喧嚣街市，眼睛明亮笑容坚韧的女人们";
        cell.setHeadImageUrl(url: model!.headUrl ?? "");
        cell.nameLabel.text = "12121";
        cell.chuDate.text = "出发日期/2019-02-19";
        cell.chuDateNum.text = "出发天数/3天";
        return cell!;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
