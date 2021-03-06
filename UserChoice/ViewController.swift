//
//  ViewController.swift
//  UserChoice
//
//  Created by Ege Sucu on 12.12.2018.
//  Copyright © 2018 Ege Sucu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    IBOutlet Değerleri
    @IBOutlet weak var metinTextView: UITextView!
    @IBOutlet weak var karanlıktemaOpsiyonu: UISwitch!
    @IBOutlet weak var metinDüzenlemeOpsiyonu: UISwitch!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "Background")
        
        
//       Butonların UserDefaults'taki kayıtlı halini aldık.
        objeDurumunuAl()

//       Switchlere İzleyici atadık. Değerleri her değiştiğinde özellikler değişsin.
        secenekleriIzle()
        
//       Başlangıçta Bu değerler açık ise UI kendini ayarlasın
        arayuzuDuzenle()
        

    }
    
    
    private func arayuzuDuzenle(){

        if karanlıktemaOpsiyonu.isOn{
            karanlıkTemaİstendi()
        }
        if metinDüzenlemeOpsiyonu.isOn{
            metinDüzenlenebilirİstendi()
        }
        
        
    }
    
    private func secenekleriIzle(){

        karanlıktemaOpsiyonu.addTarget(self, action: #selector(karanlıkTemaİstendi), for: .valueChanged)
        metinDüzenlemeOpsiyonu.addTarget(self, action: #selector(metinDüzenlenebilirİstendi), for: .valueChanged)
    }
    
    private func objeDurumunuAl(){

        karanlıktemaOpsiyonu.isOn = UserDefaults.standard.bool(forKey: "karanlıkModu")
        metinDüzenlemeOpsiyonu.isOn = UserDefaults.standard.bool(forKey: "metinDüzenleme")
    }
    
    
    
    
//    Karanlık temayı açıp kapatır.
    @objc func karanlıkTemaİstendi(){
        if karanlıktemaOpsiyonu.isOn{
            metinTextView.textColor = UIColor.white
            metinTextView.backgroundColor = UIColor.black
        } else {
            metinTextView.textColor = UIColor.black
            metinTextView.backgroundColor = UIColor(named: "Background")
        }
        
    }
//    metni düzenlenebilir yapar.
    @objc func metinDüzenlenebilirİstendi(){
        if metinDüzenlemeOpsiyonu.isOn{
            metinTextView.isEditable = true
        } else {
            metinTextView.isEditable = false
        }
    }
    
//      IBAction Fonksiyonları
    @IBAction func kaydetBasıldı(_ sender: Any) {
        UserDefaults.standard.set(karanlıktemaOpsiyonu.isOn, forKey: "karanlıkModu")
        UserDefaults.standard.set(metinDüzenlemeOpsiyonu.isOn, forKey: "metinDüzenleme")
        UserDefaults.standard.synchronize()
        
    }
    

}

