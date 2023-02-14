//
//  SettingsViewController.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toLoginViewController", sender: nil)
        } catch {
            self.showAlertMessage(titleInput: "Error", messageInput: error.localizedDescription)
        }
    }
}
