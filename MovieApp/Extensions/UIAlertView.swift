//
//  UIAlertView.swift
//  MovieApp
//
//  Created by Aslıhan Gürkan on 11.02.2023.
//

import UIKit

extension UIViewController {
    
    func showAlertMessage(titleInput: String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { alert in
            self.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
