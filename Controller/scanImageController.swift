//
//  scanImageController.swift
//  Framework
//
//  Created by Developer88 on 7/19/17.
//  Copyright © 2017 Developer88. All rights reserved.
//

import UIKit
import AVFoundation

public class scanImageController: UIViewController {
    
    @IBOutlet var viewCamera: UIView!
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var lblPointCam: UILabel!
    

    override public func viewDidLoad() {
        super.viewDidLoad()
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
        NotificationCenter.default.addObserver(self, selector: #selector(detectImage(_:)), name: NSNotification.Name(rawValue: "detectImage"), object: nil)
        localization()
                bgView.backgroundColor = Customization.bgColor
        var navBackgroundImage:UIImage! = UIImage(named: "logo")
        navBackgroundImage = resizeImage(image: navBackgroundImage, newHeight: 40)
        let imgView = UIImageView(image: navBackgroundImage)
        self.navigationItem.titleView = imgView
    }
    
    public override func viewDidLayoutSubviews() {
        bgView.backgroundColor = Customization.bgColor
        viewCamera.clipsToBounds = true
        viewCamera.layer.cornerRadius = 20
        viewCamera.layer.borderWidth = 20
        viewCamera.layer.borderColor = UIColor.white.cgColor
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        ViewController1.cameraView.view.frame = CGRect(x: viewCamera.frame.origin.x + 20, y: viewCamera.frame.origin.y + 20, width: UIScreen.main.bounds.size.width - 82, height: UIScreen.main.bounds.size.height - viewCamera.frame.origin.y - 60)
        self.viewCamera.frame = CGRect(x: viewCamera.frame.origin.x, y: viewCamera.frame.origin.y, width: UIScreen.main.bounds.size.width - 42, height: UIScreen.main.bounds.size.height - viewCamera.frame.origin.y - 20)
        self.addChildViewController(ViewController1.cameraView)
        self.view.addSubview(ViewController1.cameraView.view!)
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
    
    func localization() -> Void {
        lblPointCam.text = NSLocalizedString("POINT_CAM", tableName: nil , bundle: Customization.bundle, value: "", comment: "")
    }
    
    func detectImage(_ notification: NSNotification) {
        
       
        print(notification.object as! String)
        
        if(!(notification.object as! String).isEmpty) {
            let alert = UIAlertController(title: nil, message: "Image successfully detected", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                WebViewVC.Viewurl = notification.object as! String
                ViewController1.cameraView.view.removeFromSuperview()
                ViewController1.cameraView.removeFromParentViewController()
                let vc = WebViewVC(nibName: "WebViewVC", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)

            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
