//
//  HedefEkleVC.swift
//  HedefiniBelirle
//
//  Created by Ahmed Selim Üzüm on 12.07.2018.
//  Copyright © 2018 Ahmed Selim Üzüm. All rights reserved.
//

import UIKit

class HedefEkleVC: UIViewController ,UITextViewDelegate{

    @IBOutlet weak var txaHedef: UITextView!
    @IBOutlet weak var btnKisaSureli: UIButton!
    @IBOutlet weak var btnUzunSureli: UIButton!
    @IBOutlet weak var btnIlerle: UIButton!
    
    var hedefTipi:HedefTipi = .kisaSureli
    override func viewDidLoad() {
        super.viewDidLoad()
        btnIlerle.klavyeyiCikar();
        klavyeyiKapatmaEkle();
        btnKisaSureli.secilmisRenkAyarla();
        btnUzunSureli.secilmemisRenkAyarla();
        txaHedef.delegate=self;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnKisaSureliBasildi(_ sender: Any) {
        hedefTipi  = .kisaSureli;
        btnKisaSureli.secilmisRenkAyarla();
        btnUzunSureli.secilmemisRenkAyarla();
    }
    @IBAction func btnUzunSureliBasildi(_ sender: Any) {
        hedefTipi  = .uzunSureli;
        btnUzunSureli.secilmisRenkAyarla();
        btnKisaSureli.secilmemisRenkAyarla();

    }
    @IBAction func btnIlerleBasildi(_ sender: Any) {
        if txaHedef.text != "" && txaHedef.text != "Hedefiniz nedir?"{
            guard let hedefiniBitirVC=storyboard?.instantiateViewController(withIdentifier: "hedefiniBitir") as? HedefiniBitirVC else {return;}
            hedefiniBitirVC.initVeri(hedef: txaHedef.text!, tip: hedefTipi);
            presentDetail(hedefiniBitirVC);
        }
    }
    @IBAction func btnGeriBasildi(_ sender: Any) {
       
        dismissDetail();
    }
    
    
    func klavyeyiKapatmaEkle(){
        let dokunma=UITapGestureRecognizer(target: self, action: #selector(klavyeKapat(_:)));
        self.view.addGestureRecognizer(dokunma);
    }
    
    @objc func klavyeKapat(_ dokunma:UITapGestureRecognizer){
        self.view.endEditing(true);
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        txaHedef.text="";
        txaHedef.textColor=#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1);
        
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
