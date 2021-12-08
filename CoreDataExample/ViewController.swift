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
    
    var dataStoreManager = DataStoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.adjustsFontSizeToFitWidth = true
        ageLabel.adjustsFontSizeToFitWidth = true
        
        let user = dataStoreManager.obtainMainUser()
        
        nameLabel.text = user.name
        ageLabel.text = String(user.age)
    }
}

