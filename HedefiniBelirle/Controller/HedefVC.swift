//
//  ViewController.swift
//  HedefiniBelirle
//
//  Created by Ahmed Selim Üzüm on 11.07.2018.
//  Copyright © 2018 Ahmed Selim Üzüm. All rights reserved.
//

import UIKit
import CoreData;

class HedefVC: UIViewController ,UIGestureRecognizerDelegate{

    @IBOutlet weak var viewGeriAl: UIView!
    var hedefler:[Hedef]=[];
    var silinenIndeks:IndexPath!;
    @IBOutlet weak var tabloGoruntuleyici: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabloGoruntuleyici.delegate=self;
        tabloGoruntuleyici.dataSource=self;
        tabloGoruntuleyici.isHidden=false;
        
    }

    
    
    func viewGeriAlAnimasyon(){
        self.viewGeriAl.alpha=0;
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.viewGeriAl.isHidden=false;
            self.viewGeriAl.alpha=1;

        }, completion: { _ in
            
        })
        self.loadViewIfNeeded();
    }
    
    func viewGeriAlTersAnimasyon(){
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
            self.viewGeriAl.alpha = 0
            
        }, completion: { _ in
            self.viewGeriAl.isHidden=true;
            
        })
        self.loadViewIfNeeded();
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        coreDataGetir();
        tabloGoruntuleyici.reloadData();

    }
    
    func coreDataGetir(){
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
    }
    @IBAction func btnSilBasildi(_ sender: Any) {
        self.kaldir(indeks: silinenIndeks, bitis: { (durum) in
            if durum{
                self.coreDataGetir();
                tabloGoruntuleyici.deleteRows(at: [silinenIndeks], with: .automatic);
            }
            else{
                debugPrint("86. Satır Hata")
            }
        })
        viewGeriAlTersAnimasyon();
    }
    
    @IBAction func btnGeriAlBasildi(_ sender: Any) {
        viewGeriAlTersAnimasyon();
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none;
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let silme=UITableViewRowAction(style: .destructive , title: "SİL") { (sira, indexPath) in
            
            self.silinenIndeks=indexPath;
            
            self.viewGeriAlAnimasyon();
            
            
        }
        
        let ekleme=UITableViewRowAction(style: .normal , title: "1 EKLE") { (sira, indexPath) in
            self.ayarla(indeks: indexPath);
            tableView.reloadRows(at: [indexPath], with: .automatic);
            
        }
        
        ekleme.backgroundColor=#colorLiteral(red: 0.9385011792, green: 0.7164435983, blue: 0.3331357837, alpha: 1);
        silme.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1);
        
        return [silme,ekleme];
        
    }
    
    
}

extension HedefVC{
    
    func ayarla(indeks:IndexPath){
        guard let yonetilenDurum=appDelegete?.persistentContainer.viewContext else {return;}
        let secilmisHedef=hedefler[indeks.row];
        
        if secilmisHedef.hedefDurum<secilmisHedef.hedefBitirmeSayisi{
            secilmisHedef.hedefDurum=secilmisHedef.hedefDurum+1;
        }
        else{
            return;
        }
        
        do{
            try yonetilenDurum.save();
            print("Ayarlama Basarılı");
        }
        catch{
            debugPrint("Hata 116. satır \(error.localizedDescription)")
        }
    }
    
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
    
    func kaldir(indeks:IndexPath,bitis:(_ sonuc:Bool)->()){
        guard let yonetilenDurum = appDelegete?.persistentContainer.viewContext else {return;}
        yonetilenDurum.delete(hedefler[indeks.row]);
        
        do{
            try yonetilenDurum.save();
            debugPrint("Silme Başarılı");
            bitis(true);
        }
        catch{
            debugPrint("Hata 91. Satır \(error.localizedDescription)");
            bitis(false);
        }
    }
    
}
