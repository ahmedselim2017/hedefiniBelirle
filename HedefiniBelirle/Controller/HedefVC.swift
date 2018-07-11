//
//  ViewController.swift
//  HedefiniBelirle
//
//  Created by Ahmed Selim Üzüm on 11.07.2018.
//  Copyright © 2018 Ahmed Selim Üzüm. All rights reserved.
//

import UIKit
import CoreData;

class HedefVC: UIViewController {

    @IBOutlet weak var tabloGoruntuleyici: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let hedefVeri=Hedef();
        
    }

    @IBAction func btnHedefEkleBasildi(_ sender: Any) {
        print("hedef ekle");
    }
    
}

