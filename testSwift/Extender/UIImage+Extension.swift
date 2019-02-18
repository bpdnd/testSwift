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
    //将图片裁剪成指定比例
    func crop(ratio:CGFloat) -> UIImage {
        //计算最终尺寸
        var newSize:CGSize!
        if size.width/size.height > ratio {
            newSize = CGSize.init(width: size.height * ratio, height: size.height);
        }else{
            newSize = CGSize.init(width: size.width, height: size.width/ratio);
        }
        //图片绘制区域
        var rect = CGRect.zero;
        rect.size.width = size.width;
        rect.size.height = size.height;
        rect.origin.x   = (newSize.width - size.width) / 2.0;
        rect.origin.y   = (newSize.height - size.height) / 2.0;
        UIGraphicsBeginImageContext(newSize);
        draw(in: rect);
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage!;
    }
}
