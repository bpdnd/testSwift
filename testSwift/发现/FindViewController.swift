//
//  FindViewController.swift
//  testSwift
//
//  Created by Admin on 2019/1/7.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class FindViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,FindListCollectionViewLayoutDelegate {
    
    var sizeAllDic:Dictionary<String, Any>?;
    var dataSource:Array<Any>?;
    var model:FindListModel?;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.collectionView.backgroundColor = UIColor.white;
        self.sizeAllDic = Dictionary.init();
        self.dataSource = [];
        for i in 0..<15 {
            let model:FindListModel = FindListModel.init();
            model.name = "\(i)";
            if i<3 {
                model.imageUrl = "http://c.hiphotos.baidu.com/image/pic/item/64380cd7912397dd23fb719b5482b2b7d1a287ab.jpg";
            }else if i>=3 && i<=10 {
                model.imageUrl = "http://c.hiphotos.baidu.com/image/pic/item/3801213fb80e7bec5678461a222eb9389a506bae.jpg";
            }else{
                model.imageUrl = "http://qkk.oss-cn-beijing.aliyuncs.com//qkk/travel/oxpbTvjqOqdE-wNIJr59ENcWJBTk/1544278655.png";
            }
            model.width = CGFloat((UIScreen.main.bounds.size.width-30)/2);
            do{
                let imageData:Data = try Data.init(contentsOf: NSURL.init(string: model.imageUrl!)! as URL);
                let image:UIImage = UIImage.init(data: imageData)!;
                let imageScanle:CGFloat = CGFloat(image.size.height/image.size.width);
                model.height = model.width! * imageScanle;
            } catch {
                
            }
            
            self.dataSource?.append(model);
        }
        self.collectionView.reloadData();
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.setNavigationBarHidden(true, animated: true);
    }
    //MARK: CollectionView
    lazy var collectionView:UICollectionView = {
        var layout:FindListCollectionViewLayout = FindListCollectionViewLayout.init();
        layout.delegate = self;
        var collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout);
        collectionView.register(FindListCollectionViewCell.self, forCellWithReuseIdentifier: "cellRe");
        collectionView.delegate = self;
        collectionView.dataSource = self;
        self.view.addSubview(collectionView);
        collectionView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view.snp.left).offset(0);
            make.top.equalTo(self.view.snp.top).offset(0);
            make.right.equalTo(self.view.snp.right).offset(0);
            make.bottom.equalTo(self.view.snp.bottom).offset(0);
        });
        return collectionView;
    }();
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataSource?.count)!;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellRe = "cellRe";
        let cell:FindListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellRe, for: indexPath) as! FindListCollectionViewCell;
        if self.dataSource?.count != 0 {
            let model:FindListModel = self.dataSource![indexPath.row] as! FindListModel;
            let backUrl = URL(string: model.imageUrl!);
            cell.imageView.kf.setImage(with: backUrl)
        }
        return cell;
    }
    
    func waterFlowLayout(layout: FindListCollectionViewLayout, indexPath: NSIndexPath, itemWidth: CGFloat) -> CGFloat {
//        var height:CGFloat = 0;
//        if (self.sizeAllDic!["\(indexPath.row)"] != nil) {
//            let sizeDic:Dictionary<String,String> = self.sizeAllDic!["\(indexPath.row)"] as! Dictionary;
//            let itemHeight:String = sizeDic["height"]!;
//            height = CGFloat(Double(itemHeight)!);
//        }else{
//            let width = CGFloat((UIScreen.main.bounds.size.width-30)/2);
//            let model:FindListModel = self.dataSource![indexPath.row] as! FindListModel;
//            do{
//                let imageData:Data = try Data.init(contentsOf: NSURL.init(string: model.imageUrl!)! as URL);
//                let image:UIImage = UIImage.init(data: imageData)!;
//                let imageScanle:CGFloat = CGFloat(image.size.height/image.size.width);
//                height = width * imageScanle;
//            } catch {
//
//            }
//            self.sizeAllDic?.updateValue(["width":width,"height":height], forKey: "\(indexPath.row)");
//        }
//        return height;
        
        let model:FindListModel = self.dataSource![indexPath.row] as! FindListModel;
        return model.height!;
        
    }
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width:Double = 0;
        var height:Double = 0;
        if (self.sizeAllDic!["\(indexPath.row)"] != nil) {
            let sizeDic:Dictionary<String,String> = self.sizeAllDic!["\(indexPath.row)"] as! Dictionary;
            let itemWidth:String = sizeDic["width"]!;
            let itemHeight:String = sizeDic["height"]!;
            width  = Double(itemWidth)!;
            height = Double(itemHeight)!;
        }else{
            width = Double((UIScreen.main.bounds.size.width-30)/2);
            let model:FindListModel = self.dataSource![indexPath.row] as! FindListModel;
            do{
                let imageData:Data = try Data.init(contentsOf: NSURL.init(string: model.imageUrl!)! as URL);
                let image:UIImage = UIImage.init(data: imageData)!;
                let imageScanle:Double = Double(image.size.height/image.size.width);
                height = width * imageScanle;
            } catch {

            }
            self.sizeAllDic?.updateValue(["width":width,"height":height], forKey: "\(indexPath.row)");
        }
        return CGSize.init(width: width, height: height);
    }
    */

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
