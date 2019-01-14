//
//  ShowViewController.swift
//  testSwift
//
//  Created by Admin on 2019/1/14.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    var model:Model?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        let urlStr = URL(string: (model?.backUrl)!);
        let data = NSData.init(contentsOf: urlStr!);
        let imageView = UIImageView.init();
        
        let  image = UIImage.init(data: data! as Data);
        imageView.image = image?.reSizeImage(resize: CGSize.init(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height));

//        imageView.kf.setImage(with: URL(string: (model?.backUrl)!));
//        imageView.contentMode = UIViewContentMode.center;
        
        self.tableView.backgroundView = imageView;
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: true);
        
    }
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: .zero, style: UITableViewStyle.plain);
        self.view.addSubview(tableView);
        tableView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view.snp.left).offset(0);
            make.top.equalTo(self.view.snp.top).offset(0);
            make.right.equalTo(self.view.snp.right).offset(0);
            make.bottom.equalTo(self.view.snp.bottom).offset(0);
        });
        return tableView;
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
