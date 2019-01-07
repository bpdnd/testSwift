//
//  CustomTabBarViewController.swift
//  testSwift
//
//  Created by Admin on 2019/1/5.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //首页
        let homeVC = ViewController();
        self.addChildViewController(childerVC: homeVC, title: "首页1", normalImg: "shouye_normal", selectedImg: "shouye_selected");
        //发现
        let findVC = FindViewController();
        self.addChildViewController(childerVC: findVC, title: "发现", normalImg: "normal", selectedImg: "selected");
        //我的
        let mineVC = MineViewController();
        self.addChildViewController(childerVC: mineVC, title: "我的", normalImg: "shouye_normal", selectedImg: "shouye_selected");
        self.selectedIndex = 0;
        
    }
    //添加子控制器
    func addChildViewController(childerVC:UIViewController,title:NSString,normalImg:NSString,selectedImg:NSString)  {
        
        self.tabBarItem.title = title as String
        let color = UIColor.red;
        self.tabBar.tintColor = color
        childerVC.title = title as String
        var norImg = UIImage(named:normalImg as String)
        norImg = norImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        var selImg = UIImage(named:selectedImg as String)
        selImg = selImg?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let tabItem = UITabBarItem(title: title as String, image: norImg,selectedImage: selImg)
        let naVc = UINavigationController();
        naVc.tabBarItem = tabItem
        naVc.addChildViewController(childerVC)
        self.addChildViewController(naVc)
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
