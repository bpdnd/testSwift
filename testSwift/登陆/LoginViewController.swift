//
//  LoginViewController.swift
//  testSwift
//
//  Created by Admin on 2019/1/7.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var isAgreeProtocol:Bool?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.isAgreeProtocol = true;
        backImageView.image = UIImage.init(named: "loginBG.jpg");
        goBackButton.setImage(UIImage.init(named: "icon_returnBack"), for: UIControlState.normal);
        goBackButton.backgroundColor = UIColor.clear;
        userNameTextField.placeholder = "请输入账号";
        passWordTextField.placeholder = "请输入密码";
        loginButton.setTitle("登陆", for: UIControlState.normal);
        forgetButton.setTitle("忘记密码?", for: UIControlState.normal);
        registerButton.setTitle("注册", for: UIControlState.normal);
        protocolLabel.text = "我已阅读同意用户使用协议";
        protocolButton.setImage(UIImage.init(named: "icon_agreeNo"), for: UIControlState.normal);
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: true);
    }
    //MARK: 背景图
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
    //MARK:返回按钮
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
    //MARK:账号
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
    //MARK:密码
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
    //MARK:登陆按钮
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
    //MARK:忘记密码
    lazy var forgetButton:UIButton = {
        var forgetButton = UIButton.init(type: UIButtonType.custom);
        forgetButton.setTitleColor(UIColor(red: 235/255, green: 242/255, blue: 243/255, alpha: 1), for: UIControlState.normal);
        self.backImageView.addSubview(forgetButton);
        forgetButton.snp.makeConstraints({ (make) in
            make.left.equalTo(self.backImageView.snp.left).offset(30);
            make.top.equalTo(self.loginButton.snp.bottom).offset(15);
            make.height.equalTo(30);
        });
        return forgetButton;
    }();
    //MARK:注册
    lazy var registerButton:UIButton = {
        var registerButton = UIButton.init(type: UIButtonType.custom);
        registerButton.setTitleColor(UIColor(red: 235/255, green: 242/255, blue: 243/255, alpha: 1), for: UIControlState.normal);
        self.backImageView.addSubview(registerButton);
        registerButton.snp.makeConstraints({ (make) in
            make.right.equalTo(self.backImageView.snp.right).offset(-30);
            make.top.equalTo(self.loginButton.snp.bottom).offset(15);
            make.height.equalTo(30);
        });
        return registerButton;
    }();
    //MARK:协议
    lazy var protocolLabel:UILabel = {
        var protocolLabel = UILabel.init();
        protocolLabel.font = UIFont.systemFont(ofSize: 15);
        protocolLabel.textColor = UIColor(red: 235/255, green: 242/255, blue: 243/255, alpha: 1);
        self.backImageView.addSubview(protocolLabel);
        protocolLabel.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.backImageView.snp.centerX).offset(0);
            make.bottom.equalTo(self.backImageView.snp.bottom).offset(-30);
        });
        return protocolLabel;
    }();
    //MARK:同意协议按钮
    lazy var protocolButton:UIButton = {
        var protocolButton = UIButton.init(type: UIButtonType.custom);
        protocolButton.addTarget(self, action: #selector(protocolButtonEvent(button:)), for: UIControlEvents.touchUpInside);
        self.backImageView.addSubview(protocolButton);
        protocolButton.snp.makeConstraints({ (make) in
            make.right.equalTo(self.protocolLabel.snp.left).offset(-5);
            make.centerY.equalTo(self.protocolLabel.snp.centerY).offset(0);
            make.size.equalTo(CGSize.init(width: 22, height: 22));
        });
        return protocolButton;
    }();
    @objc func protocolButtonEvent(button:UIButton){
        self.isAgreeProtocol = self.isAgreeProtocol! ? false:true;
        if self.isAgreeProtocol! {
            //button.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControlState#>)
            button.setImage(UIImage.init(named: "icon_agreeYes"), for: UIControlState.normal);
        }else{
            button.setImage(UIImage.init(named: "icon_agreeNo"), for: UIControlState.normal);
        }
    }
    
    
    
    
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
