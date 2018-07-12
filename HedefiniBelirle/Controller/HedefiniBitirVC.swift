//
//  HedefiniBitirVC.swift
//  HedefiniBelirle
//
//  Created by Ahmed Selim Üzüm on 12.07.2018.
//  Copyright © 2018 Ahmed Selim Üzüm. All rights reserved.
//

import UIKit
import CoreData;

let appDelegete=UIApplication.shared.delegate as? AppDelegate;

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
        if txtHedefSayi.text != nil{
            kaydet { (sonuc) in
                if sonuc{
                    guard let hedefVC=storyboard?.instantiateViewController(withIdentifier: "HedefVC") as? HedefVC else{return;}
                    dismissDetailEnBasa(hedefVC);
                }
            }
            
        }
    }
    
    @IBAction func btnGeriBasildi(_ sender: Any) {
        guard let hedefVC=storyboard?.instantiateViewController(withIdentifier: "HedefVC") as? HedefVC else{return;}
        dismissDetailEnBasa(hedefVC);
        
    }
    
    func kaydet(bitis:(_ sonuc:Bool)->()){
        guard let yonetilenDurum=appDelegete?.persistentContainer.viewContext else {return;}
        let hedef=Hedef(context: yonetilenDurum);
        
        hedef.hedef=self.hedef;
        hedef.tip=self.tip.rawValue;
        hedef.hedefBitirmeSayisi=Int32(self.txtHedefSayi.text!)!;
        hedef.hedefDurum=Int32(0);
        
        do{
            try yonetilenDurum.save();
            bitis(true);
            debugPrint("Kaydetme Başarılı");
        }
        catch{
            debugPrint("57. Satır Hata \(error.localizedDescription)");
            bitis(false);
        }
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
