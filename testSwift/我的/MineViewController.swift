//
//  MineViewController.swift
//  testSwift
//
//  Created by Admin on 2019/1/5.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false;
        self.view.backgroundColor = UIColor.white;
        self.headButton.setImage(UIImage.init(named: "icon_defaultHead"), for: UIControlState.normal);
        self.signView.label.text  = "122";
        self.showView.setValueNumber(zanNumber: "0", shouNumber: "0", zuoNumber: "0");
        self.baseTwoView.backgroundColor = UIColor.white;
        self.baseTwoView.dataSource = ["1","2","3"];
        self.baseTwoView.collectionView.reloadData();
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        // 隐藏导航栏有动画
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.setNavigationBarHidden(false, animated: true);
    }
    //MARK: 头像
    lazy var headButton:UIButton = {
        let headButton = UIButton(type: UIButtonType.custom);
        headButton.adjustsImageWhenHighlighted = false;
        headButton.addTarget(self,action: #selector(gotoLogin(button:)), for: UIControlEvents.touchUpInside);
        self.view.addSubview(headButton);
        headButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view.snp.left).offset(30);
            make.top.equalTo(self.view.snp.top).offset(30);
            make.size.equalTo(CGSize(width: 80, height: 80));
        });
        return headButton;
    }();
    @objc func gotoLogin(button:UIButton){
        self.hidesBottomBarWhenPushed = true;
        let loginVC = LoginViewController.init();
        self.navigationController?.pushViewController(loginVC, animated: true);
        self.hidesBottomBarWhenPushed = false;
    }
    //MARK: 签名
    lazy var signView:MineSignView = {
        var signView = MineSignView.init(frame: .zero);
        self.view.addSubview(signView);
        signView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view.snp.left).offset(30);
            make.top.equalTo(self.headButton.snp.bottom).offset(20);
            make.right.equalTo(self.view.snp.right).offset(-30);
            make.height.equalTo(40);
        });
        return signView;
    }();
    //MARK: 获赞 收藏 作品
    lazy var showView:MineBaseView = {
        var showView = MineBaseView.init(frame: .zero);
        self.view.addSubview(showView);
        showView.snp.makeConstraints({ (make) in
            make.right.equalTo(self.view.snp.right).offset(-30);
            make.centerY.equalTo(self.headButton.snp.centerY).offset(0);
            make.size.equalTo(CGSize(width: 120, height: 60));
        });
        return showView;
    }();
    //MARK:
    lazy var baseTwoView:MineBaseTwoView = {
        var baseTwoView = MineBaseTwoView.init(frame: .zero);
        self.view.addSubview(baseTwoView);
        baseTwoView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view.snp.left).offset(0);
            make.top.equalTo(self.headButton.snp.bottom).offset(80);
            make.right.equalTo(self.view.snp.right).offset(0);
            make.bottom.equalTo(self.view.snp.bottom).offset(0);
        });
        return baseTwoView;
    }();
    
    
    
    
    
    
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
