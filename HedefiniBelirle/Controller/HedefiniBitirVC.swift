//
//  HedefiniBitirVC.swift
//  HedefiniBelirle
//
//  Created by Ahmed Selim Üzüm on 12.07.2018.
//  Copyright © 2018 Ahmed Selim Üzüm. All rights reserved.
//

import UIKit

class HedefiniBitirVC: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var btnHedefEkle: UIButton!
    @IBOutlet weak var txtHedefSayi: UITextField!
    
    var hedef:String!;
    var tip:HedefTipi!;
    override func viewDidLoad() {
        super.viewDidLoad()
        btnHedefEkle.klavyeyiCikar();
        txtHedefSayi.delegate=self;
        // Do any additional setup after loading the view.
    }
    
    
    func initVeri(hedef:String,tip:HedefTipi){
        self.hedef=hedef;
        self.tip=tip;
    }
    
    @IBAction func btnHedefEkleBasildi(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
