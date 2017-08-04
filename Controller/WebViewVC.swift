//
//  WebViewVC.swift
//  Framework
//
//  Created by Developer88 on 7/20/17.
//  Copyright © 2017 Developer88. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    static var Viewurl : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.scrollView.isScrollEnabled = false
        self.webView.scrollView.bounces = false
        webView.loadRequest(NSURLRequest(url: NSURL(string: WebViewVC.Viewurl)! as URL) as URLRequest)
        var navBackgroundImage:UIImage! = UIImage(named: "logo")
        navBackgroundImage = resizeImage(image: navBackgroundImage, newHeight: 40)
        let imgView = UIImageView(image: navBackgroundImage)
        self.navigationItem.titleView = imgView
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "background"), for: .default)
        
        let language = Locale.current.languageCode
        print(language!)
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "arrow"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(btnBck), for: UIControlEvents.touchUpInside)
        if(language! == "he") {
            button.frame = CGRect.init(x: ((self.navigationController?.navigationBar.frame.width)! - 30), y: 0, width: 15, height: 15)
            let barButton = UIBarButtonItem.init(customView: button)
            self.navigationItem.rightBarButtonItem = barButton
            self.navigationItem.hidesBackButton = true
        } else {
            button.frame = CGRect.init(x: 0, y: 0, width: 15, height: 15)
            let barButton = UIBarButtonItem.init(customView: button)
            self.navigationItem.leftBarButtonItem = barButton
            
        }
    }

    func resizeImage(image: UIImage, newHeight: CGFloat) -> UIImage {
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width :newWidth,height: newHeight))
        image.draw(in: CGRect(x: 0,y:0,width : newWidth,height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func btnBck() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
