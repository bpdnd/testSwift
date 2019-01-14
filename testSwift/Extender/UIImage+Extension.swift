//
//  UIImage+Extension.swift
//  testSwift
//
//  Created by Admin on 2019/1/14.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

extension UIImage {
    //重设图片大小
    func reSizeImage(resize:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(resize, false, UIScreen.main.scale);
        self.draw(in: CGRect.init(x: 0, y: 0, width: resize.width, height: resize.height));
        let  reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    //等比例缩放
    func scaleImage(scaleSize:CGFloat) -> UIImage {
        let reSize = CGSize.init(width: self.size.width * scaleSize, height: self.size.height * scaleSize);
        return reSizeImage(resize: reSize);
    }
}
