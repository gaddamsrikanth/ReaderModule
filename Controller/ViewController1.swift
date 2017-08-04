//
//  ViewController.swift
//  Framework
//
//  Created by Developer88 on 7/19/17.
//  Copyright © 2017 Developer88. All rights reserved.
//

import UIKit

public class ViewController1: UIViewController{
    
    public static var cameraView : UIViewController!
    
    @IBOutlet var btnScan: UIButton!
    @IBOutlet var lbladReaderHome: UILabel!
    @IBOutlet var lblusrManual: UILabel!
    @IBOutlet var lblInstruction: UILabel!
    @IBOutlet var bgView: UIView!
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let cvWrap = CVWrapper()

        ViewController1.cameraView = cvWrap.beginProcess()
        localization()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
           }
    
    public override func viewDidLayoutSubviews() {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "arrow"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(bckBtn), for: UIControlEvents.touchUpInside)
        let language = Locale.current.languageCode
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
        
        var navBackgroundImage:UIImage! = UIImage(named: "logo")
        navBackgroundImage = resizeImage(image: navBackgroundImage, newHeight: 40)
        let imgView = UIImageView(image: navBackgroundImage)
        self.navigationItem.titleView = imgView
        
        self.btnScan.layer.cornerRadius = self.btnScan.frame.height / 2
        bgView.backgroundColor = Customization.bgColor
        btnScan.backgroundColor = Customization.btnColor
        lblusrManual.textColor = Customization.txtColor
        lblInstruction.textColor = Customization.txtColor
        lbladReaderHome.textColor = Customization.txtColor

    }
    
    @IBAction func openImagescan(_ sender: Any) {
        let vc = scanImageController(nibName: "scanImageController", bundle: Customization.bundle)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func localization() -> Void {
        btnScan.setTitle(NSLocalizedString("START", tableName: nil , bundle: Customization.bundle, value: "", comment: ""), for: .normal)
        
        lbladReaderHome.text = NSLocalizedString("AD_READER", tableName: nil , bundle: Customization.bundle, value: "", comment: "")
        
        
        lblusrManual.text = NSLocalizedString("MANUAL:", tableName: nil , bundle: Customization.bundle, value: "", comment: "")
        
        lblInstruction.text = NSLocalizedString("INSTRUCTION", tableName: nil , bundle: Customization.bundle, value: "", comment: "")
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
    
    func bckBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
