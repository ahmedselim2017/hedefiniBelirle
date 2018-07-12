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
    
    @IBOutlet weak var viewBitis: UIView!
    
    func hucreleriAyara(hedef:Hedef){
        self.lblHedef.text=hedef.hedef;
        self.lblTip.text=hedef.tip;
        self.lblHedefDurum.text=String(hedef.hedefDurum);
        if hedef.hedefDurum==hedef.hedefBitirmeSayisi{
            self.viewBitis.isHidden=false;
        }
        else{
            self.viewBitis.isHidden=true;
        }
    }
    
}
