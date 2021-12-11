//
//  ViewController.swift
//  CoreDataExample
//
//  Created by ruslan on 05.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var dataStoreManager = DataStoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        nameLabel.sizeToFit()
        ageLabel.sizeToFit()
        
        updateNameLabel()
    }
    
    func updateNameLabel() {
        let user = dataStoreManager.obtainMainUser()
        
        nameLabel.text = user.name
        ageLabel.text = String(user.age)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let name = textField.text else { return }
        
        dataStoreManager.updateMainUser(with: name)
        updateNameLabel()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {        
        textField.resignFirstResponder()
        
        return true
    }
}
