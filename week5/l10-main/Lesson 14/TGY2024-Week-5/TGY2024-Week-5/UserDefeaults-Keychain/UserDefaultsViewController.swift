//
//  UserDefaultsViewController.swift
//  TGY2024-Week-5
//
//  Created by Kerem Demir on 16.03.2024.
//

import UIKit
import KeychainAccess

/*
 Userdefault:
 HASSAS OLMAYAN VERILERDE USERDEFAULT KULLANILSIN.
 Veri plaintext tutuldugu icin guvenlik acigina nede olabilir.
 
 Keychain:
 Hassas veriler saklanmasinda guvenilirdir.
 */

class UserDefaultsViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    let keyChain = Keychain(service: "com.keremdemir.TGY2024-Week-5")
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        setInfoForUserdefaults()
        setInfoLabelForKeychain()
    }
    
    private func setInfoLabelForKeychain() {
        guard let name = keyChain["name"] else { return }
        guard let age = keyChain["age"] else { return }
        
        infoLabel.text = "Merhaba ben \(name), \(age) yaşındayım."
    }
    
    private func setInfoForUserdefaults() {
        guard let name = UserDefaults.standard.value(forKey: "name") else { return }
        guard let age = UserDefaults.standard.value(forKey: "age") else { return }
        
        infoLabel.text = "Merhaba ben \(name), \(age) yaşındayım."
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        guard let name = nameTextField.text else { return }
        guard let age = ageTextField.text else { return }
        
//        UserDefaults.standard.setValue(name, forKey: "name")
//        UserDefaults.standard.setValue(age, forKey: "age")
        
        keyChain["name"] = name
        keyChain["age"] = age
        
        infoLabel.text = "Merhaba ben \(name), \(age) yaşındayım."
    }
    
}
