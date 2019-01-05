//
//  ViewController.swift
//  testSwift
//
//  Created by Admin on 2018/12/17.
//  Copyright © 2018年 Admin. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    var dataSource:NSMutableArray?; //数据
    var cellHeightDic:[String:CGFloat] = [:]; //cell高度缓存
    var historyY:CGFloat?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        tableView.backgroundColor = UIColor.white;
        dataSource = NSMutableArray.init();
        for _ in 0..<10 {
            let model = Model.init();
            model.backUrl = "http://c.hiphotos.baidu.com/image/pic/item/64380cd7912397dd23fb719b5482b2b7d1a287ab.jpg";
            model.headUrl = "http://g.hiphotos.baidu.com/image/pic/item/adaf2edda3cc7cd9ebe507433401213fb90e915b.jpg";
            model.name    = "姓名";
            dataSource?.add(model);
        }
        tableView.reloadData();
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: true);

    }

    
    
    
    
    lazy var tableView:UITableView = {
        var tableView = UITableView(frame: CGRect.zero, style: .plain);
        tableView.tableFooterView = UIView.init();
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none;
        tableView.showsVerticalScrollIndicator = false;
        tableView.delegate = self ;
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
    
    //组的个数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    //cell个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource?.count)!;
    }
    //uitableViewcell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid) as? CustomTableViewCell;
        if cell==nil {
            cell = CustomTableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        cell?.selectionStyle = UITableViewCellSelectionStyle.none;
        if dataSource?.count != 0 {
            cell?.setValueForCell(model: self.dataSource?.object(at: indexPath.row) as! Model);
        }
        return cell!
    }
    //MARK:CELL高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (cellHeightDic["\(indexPath.row)"] != nil) {
            let height = CGFloat(cellHeightDic["\(indexPath.row)"]!);
            return height;
        }
        let model:Model = dataSource?.object(at: indexPath.row) as! Model;
        var cellHeight:Float = 80;
        do {
            let data:Data = try Data.init(contentsOf: NSURL.init(string: model.backUrl!)! as URL)
            let image:UIImage = UIImage.init(data: data)!
            let width  = image.size.width;
            let height = image.size.height;
            cellHeight = Float((UIScreen.main.bounds.size.width-20)/width*height);
        } catch {
            
        }
        cellHeightDic.updateValue(CGFloat(cellHeight), forKey: "\(indexPath.row)");
        return CGFloat(cellHeight);
    }
    //MARK:CELL 点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dataSource?.object(at: indexPath.row) ?? "34");
    }
    
}

