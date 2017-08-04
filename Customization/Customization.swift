//
//  Customization.swift
//  Framework
//
//  Created by Developer88 on 7/25/17.
//  Copyright © 2017 Developer88. All rights reserved.
//

import Foundation

public class Customization: NSObject {
    
    public override init() {}

    static var bgColor : UIColor! = #colorLiteral(red: 0.8564705253, green: 0.123423703, blue: 0.1560736001, alpha: 1)
    static var btnColor : UIColor! = #colorLiteral(red: 0.6306080222, green: 0.07898784429, blue: 0.0982254222, alpha: 1)
    static var txtColor : UIColor! = #colorLiteral(red: 0.9737131134, green: 0.9737131134, blue: 0.9737131134, alpha: 1)
    static var bundle : Bundle!
    
    func setBundle(_ bundle : String) {
        Customization.bundle = Bundle(identifier :  (bundle))!
    }
    
    
    public func setBgColor(_ color : UIColor) {
       Customization.bgColor = color
   }
   
   public func setBtnColor(_ color1 : UIColor) {
        Customization.btnColor = color1
    }
   
   public func setTextColor(_ color : UIColor) {
        Customization.txtColor = color
    }
}



