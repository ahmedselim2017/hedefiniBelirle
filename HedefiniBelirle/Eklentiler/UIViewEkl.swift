//
//  UIViewEkl.swift
//  HedefiniBelirle
//
//  Created by Ahmed Selim Üzüm on 12.07.2018.
//  Copyright © 2018 Ahmed Selim Üzüm. All rights reserved.
//

import Foundation
import UIKit;

extension UIView{
    func klavyeyiCikar(){
        NotificationCenter.default.addObserver(self, selector: #selector(klavyeDegisti(_:)), name: UIResponder.keyboardWillChangeFrameNotification  , object: nil);
    }
    
    @objc func klavyeDegisti(_ notification:NSNotification){
        let sure=notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double;
        let kavis=notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt;
        let baslangicCercevesi=(notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue;
        let bitisCercevesi=(notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue ).cgRectValue;
        let deltaY=bitisCercevesi.origin.y-baslangicCercevesi.origin.y;
        UIView.animateKeyframes(withDuration: sure, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: kavis), animations: {
            self.frame.origin.y += deltaY;
        }, completion: nil);
    }
}
