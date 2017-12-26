//
//  RootTabBarController.swift
//  SlyRead
//
//  Created by wushuying on 2017/12/26.
//  Copyright © 2017年 wushuying. All rights reserved.
//

import UIKit

extension String{
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            
            return String(self[startIndex..<endIndex])
        }
    }
}

extension UIColor {
    
    /// 用十六进制颜色创建UIColor
    ///
    /// - Parameter hexColor: 十六进制颜色 (0F0F0F)
    convenience init(hexColor: String) {
        
        // 存储转换后的数值
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        
        // 分别转换进行转换
        Scanner(string: hexColor[0..<2]).scanHexInt32(&red)
        
        Scanner(string: hexColor[2..<4]).scanHexInt32(&green)
        
        Scanner(string: hexColor[4..<6]).scanHexInt32(&blue)
        
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
}

class RootTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = UIColor.white
        initChildController()
        //        for i in 0..<self.tabBar.items!.count {
        //            let item = self.tabBar.items![i]
        //            item.image = item.image!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //            item.selectedImage = item.image!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //            item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: UIControlState.normal)
        //            item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.init(hexColor: "f2bf5e")], for: UIControlState.selected)
        //            item.selectedImage = UIImage.init(named: "书架(1)")
        //        }
    }
    
    func initChildController(){
        let bookVC = BookShelfController()
        var bookTabImage = UIImage.init(named: "书架")
        var bookTabSelectedImage = UIImage.init(named: "书架(1)")
        bookTabImage = bookTabImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        bookTabSelectedImage = bookTabSelectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let bookItem:UITabBarItem = UITabBarItem(title:"书架", image: bookTabImage, selectedImage: bookTabSelectedImage)
        bookItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: UIControlState.normal)
        bookItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.init(hexColor: "f2bf5e")], for: UIControlState.selected)
        bookVC.tabBarItem = bookItem
        
        let myVC = MyController()
        var myTabImage = UIImage.init(named: "我的")
        var myTabSelectedImage = UIImage.init(named: "我的(1)")
        myTabImage = myTabImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        myTabSelectedImage = myTabSelectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let myItem:UITabBarItem = UITabBarItem(title: "我的", image: myTabImage, selectedImage: myTabSelectedImage)
        myItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: UIControlState.normal)
        myItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.init(hexColor: "f2bf5e")], for: UIControlState.selected)
        myVC.tabBarItem = myItem
        
        self.viewControllers = [bookVC, myVC]
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

