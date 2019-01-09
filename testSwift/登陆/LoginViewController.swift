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
        goBackButton.backgroundColor = UIColor.clear;
        userNameTextField.placeholder = "请输入账号";
        passWordTextField.placeholder = "请输入密码";
        loginButton.setTitle("登陆", for: UIControlState.normal);

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
        self.navigationController?.popViewController(animated: true);
    }
    lazy var userNameTextField:LoginBaseTextField = {
        var userNameTextField = LoginBaseTextField.init();
        self.backImageView.addSubview(userNameTextField);
        userNameTextField.snp.makeConstraints({ (make) in
            make.left.equalTo(self.backImageView.snp.left).offset(30);
            make.top.equalTo(self.backImageView.snp.top).offset(150);
            make.right.equalTo(self.backImageView.snp.right).offset(-30);
            make.height.equalTo(40);
        });
        return userNameTextField;
    }();
    lazy var passWordTextField:LoginBaseTextField = {
        var passWordTextField = LoginBaseTextField.init();
        self.backImageView.addSubview(passWordTextField);
        passWordTextField.snp.makeConstraints({ (make) in
            make.left.equalTo(self.backImageView.snp.left).offset(30);
            make.top.equalTo(self.userNameTextField.snp.bottom).offset(30);
            make.right.equalTo(self.backImageView.snp.right).offset(-30);
            make.height.equalTo(40);
        });
        return passWordTextField;
    }();
    lazy var loginButton:LoginButton = {
        var loginButton = LoginButton.init(type: UIButtonType.custom);
        loginButton.setTitleColor(UIColor(red: 0/255, green: 73/255, blue: 74/255, alpha: 1), for: UIControlState.normal);
        loginButton.backgroundColor = UIColor(red: 235/255, green: 242/255, blue: 243/255, alpha: 1);
        self.backImageView.addSubview(loginButton);
        loginButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.backImageView.snp.left).offset(30);
            make.top.equalTo(self.passWordTextField.snp.bottom).offset(30);
            make.right.equalTo(self.backImageView.snp.right).offset(-30);
            make.height.equalTo(50);
        });
        return loginButton;
    }();
    
    
    
    
    //MARK:点击空白处，键盘收回
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
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
