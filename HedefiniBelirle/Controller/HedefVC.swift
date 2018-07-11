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
        tabloGoruntuleyici.delegate=self;
        tabloGoruntuleyici.dataSource=self;
        tabloGoruntuleyici.isHidden=false;
        
    }

    @IBAction func btnHedefEkleBasildi(_ sender: Any) {
        guard let hedefEkleVC=storyboard?.instantiateViewController(withIdentifier: "HedefEkleVC") as? HedefEkleVC else {return;}
        presentDetail(hedefEkleVC);
    }
    
}

extension HedefVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let hucre=tableView.dequeueReusableCell(withIdentifier: "hedefHucresi") as? HedefHucresi else{return UITableViewCell()}
        
        hucre.hucreleriAyara(hedef: "Uygulamayı Bitir", tip: HedefTipi.kisaSureli , hedefDurum: 0);
        return hucre;
    }
}
