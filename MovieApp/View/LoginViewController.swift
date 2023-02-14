//
//  LoginViewController.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && emailText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error == nil {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                } else {
                    self.showAlertMessage(titleInput: "Error", messageInput: "Cannot Sign In. Please check your email or password.")
                }
            }
        } else {
            self.showAlertMessage(titleInput: "Error", messageInput: "Error")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                if error == nil {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                } else {
                    self.showAlertMessage(titleInput: "Error", messageInput: "Error")
                }
            }
        } else {
            self.showAlertMessage(titleInput: "Error", messageInput: "Error")
        }
    }
}
