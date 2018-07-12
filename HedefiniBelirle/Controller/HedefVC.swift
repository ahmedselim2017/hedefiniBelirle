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

    var hedefler:[Hedef]=[];
    @IBOutlet weak var tabloGoruntuleyici: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabloGoruntuleyici.delegate=self;
        tabloGoruntuleyici.dataSource=self;
        tabloGoruntuleyici.isHidden=false;
        
    }

    override func viewDidAppear(_ animated: Bool) {
        self.getir { (durum) in
            if durum{
                if hedefler.count>=1 {
                    tabloGoruntuleyici.isHidden=false;
                }
                else{
                    tabloGoruntuleyici.isHidden=true;
                }
                
            }
        }
        tabloGoruntuleyici.reloadData();

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
        return hedefler.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let hucre=tableView.dequeueReusableCell(withIdentifier: "hedefHucresi") as? HedefHucresi else{return UITableViewCell()}
        
        let hedef=hedefler[indexPath.row];
        
        
        hucre.hucreleriAyara(hedef: hedef);
        return hucre;
    }
}

extension HedefVC{
    func getir(bitis:(_ sonuc:Bool)->()){
        guard let yonetilenDurum=appDelegete?.persistentContainer.viewContext else {return;}
        
        let getirIstegi=NSFetchRequest<Hedef>(entityName: "Hedef")
        
        do{
            hedefler=try yonetilenDurum.fetch(getirIstegi) as! [Hedef];
            debugPrint(hedefler.count);
            bitis(true);
        }
        catch{
            debugPrint("Hata 55.Satır \(error.localizedDescription)");
            bitis(false);
        }
    }
}
