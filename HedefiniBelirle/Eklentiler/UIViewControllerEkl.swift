//
//  UIViewControllerEkl.swift
//  HedefiniBelirle
//
//  Created by Ahmed Selim Üzüm on 12.07.2018.
//  Copyright © 2018 Ahmed Selim Üzüm. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func presentDetail(_ viewControllerToPresent:UIViewController){
        let gecis=CATransition();
        gecis.duration=0.25;
        gecis.type = CATransitionType.push;
        gecis.subtype=CATransitionSubtype.fromRight;
        self.view.window?.layer.add(gecis,forKey: kCATransition);
        present(viewControllerToPresent, animated: false, completion: nil);
    }
    
    func dismissDetail(){
        let gecis=CATransition();
        gecis.duration=0.25;
        gecis.type = CATransitionType.push;
        gecis.subtype=CATransitionSubtype.fromLeft;
        self.view.window?.layer.add(gecis,forKey: kCATransition);
        dismiss(animated: false, completion: nil);
    }
    
    func dismissDetailEnBasa(_ viewControllerToPresent:UIViewController){
        let gecis=CATransition();
        gecis.duration=0.25;
        gecis.type = CATransitionType.push;
        gecis.subtype=CATransitionSubtype.fromLeft;
        self.view.window?.layer.add(gecis,forKey: kCATransition);
        present(viewControllerToPresent, animated: false, completion: nil);
    }
    
    
}
