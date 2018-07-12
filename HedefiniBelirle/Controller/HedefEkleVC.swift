//
//  HedefEkleVC.swift
//  HedefiniBelirle
//
//  Created by Ahmed Selim Üzüm on 12.07.2018.
//  Copyright © 2018 Ahmed Selim Üzüm. All rights reserved.
//

import UIKit

class HedefEkleVC: UIViewController {

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
    }
    @IBAction func btnGeriBasildi(_ sender: Any) {
        guard let hedefVC=storyboard?.instantiateViewController(withIdentifier: "HedefVC") as? HedefVC else {return;}
        dismissDetail();
    }
    
    
    func klavyeyiKapatmaEkle(){
        let dokunma=UITapGestureRecognizer(target: self, action: #selector(klavyeKapat(_:)));
        self.view.addGestureRecognizer(dokunma);
    }
    
    @objc func klavyeKapat(_ dokunma:UITapGestureRecognizer){
        self.view.endEditing(true);
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
