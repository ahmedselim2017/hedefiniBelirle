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
    @IBOutlet weak var btnİlerle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnKisaSureliBasildi(_ sender: Any) {
    }
    @IBAction func btnUzunSureliBasildi(_ sender: Any) {
    }
    @IBAction func btnIlerleBasildi(_ sender: Any) {
    }
    @IBAction func btnGeriBasildi(_ sender: Any) {
        guard let hedefVC=storyboard?.instantiateViewController(withIdentifier: "HedefVC") as? HedefVC else {return;}
        dismissDetail();
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
