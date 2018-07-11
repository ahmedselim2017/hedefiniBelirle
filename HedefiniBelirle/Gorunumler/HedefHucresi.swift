//
//  HedefHucresi.swift
//  HedefiniBelirle
//
//  Created by Ahmed Selim Üzüm on 11.07.2018.
//  Copyright © 2018 Ahmed Selim Üzüm. All rights reserved.
//

import UIKit

class HedefHucresi: UITableViewCell {

    @IBOutlet weak var lblHedef: UILabel!
    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblHedefDurum: UILabel!
    
    
    func hucreleriAyara(hedef:String,tip:HedefTipi,hedefDurum:Int){
        self.lblHedef.text=hedef;
        self.lblTip.text=tip.rawValue;
        self.lblHedefDurum.text=String(hedefDurum);
    }
    
}
