//
//  LoginViewController.swift
//  testSwift
//
//  Created by Admin on 2019/1/7.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        backImageView.image = UIImage.init(named: "loginBG.jpg");
        goBackButton.setImage(UIImage.init(named: "icon_returnBack"), for: UIControlState.normal);
        goBackButton.backgroundColor = UIColor.red;
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: true);
    }
    //MARK :懒加载
    lazy var backImageView:UIImageView = {
        var backImageView = UIImageView.init();
        backImageView.isUserInteractionEnabled = true;
        self.view.addSubview(backImageView);
        backImageView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view.snp.left).offset(0);
            make.top.equalTo(self.view.snp.top).offset(0);
            make.right.equalTo(self.view.snp.right).offset(0);
            make.bottom.equalTo(self.view.snp.bottom).offset(0);
        });
        return backImageView;
    }();
    lazy var goBackButton:UIButton = {
        var  goBackButton = UIButton(type: UIButtonType.custom);
        goBackButton.addTarget(self, action: #selector(returnBackEvent(button:)), for: UIControlEvents.touchUpInside);
        self.backImageView.addSubview(goBackButton);
        goBackButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.backImageView.snp.left).offset(15);
            make.top.equalTo(self.backImageView.snp.top).offset(28);
            //make.size.equalTo(CGSize.init(width: 45, height: 45));
        });
        return goBackButton;
    }();
    @objc func returnBackEvent(button:UIButton){
        print("122");
        self.navigationController?.popViewController(animated: true);
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
